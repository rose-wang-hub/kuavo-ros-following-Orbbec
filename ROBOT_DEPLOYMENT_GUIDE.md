# Orbbec Gemini 335L 人形跟随系统 - 机器人部署指南

## 📋 目录
1. [硬件要求](#硬件要求)
2. [软件环境准备](#软件环境准备)
3. [Orbbec相机配置](#orbbec相机配置)
4. [系统部署步骤](#系统部署步骤)
5. [运行与测试](#运行与测试)
6. [故障排除](#故障排除)
7. [性能优化](#性能优化)

---

## 🖥️ 硬件要求

### 必需硬件
- **机器人平台**：支持ROS的机器人（如Kuavo系列）
- **相机**：Orbbec Gemini 335L RGB-D相机
- **计算平台**：
  - CPU: Intel i5/i7 或 AMD Ryzen 5/7 (推荐)
  - RAM: 至少8GB (推荐16GB)
  - GPU: NVIDIA GTX 1050或更高 (可选，但推荐用于深度学习加速)
- **操作系统**：Ubuntu 18.04/20.04/22.04 (推荐20.04)

### 推荐配置
- **CPU**: Intel i7-8700K 或 AMD Ryzen 7 3700X
- **RAM**: 16GB DDR4
- **GPU**: NVIDIA RTX 3060 或更高
- **存储**: 256GB SSD (用于系统和模型)

---

## 🔧 软件环境准备

### 1. 系统更新
```bash
sudo apt update && sudo apt upgrade -y
```

### 2. 安装Python 3.8+
```bash
# 检查Python版本
python3 --version

# 如果需要安装Python 3.8
sudo apt install python3.8 python3.8-dev python3-pip -y

# 设置Python 3.8为默认
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1
```

### 3. 安装CUDA (如果有GPU)
```bash
# 安装NVIDIA驱动 (根据你的GPU型号)
ubuntu-drivers autoinstall

# 安装CUDA 11.8 (推荐)
wget https://developer.download.nvidia.com/compute/cuda/11.8.0/local_installers/cuda_11.8.0_520.61.05_linux.run
sudo sh cuda_11.8.0_520.61.05_linux.run

# 添加到环境变量
echo 'export PATH=/usr/local/cuda/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc
```

### 4. 安装ROS (如果需要ROS集成)
```bash
# 安装ROS Noetic (Ubuntu 20.04)
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

sudo apt update
sudo apt install ros-noetic-desktop-full -y

# 初始化rosdep
sudo rosdep init
rosdep update

# 添加ROS环境到bashrc
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
```

---

## 📷 Orbbec相机配置

### 1. 安装USB规则
```bash
# 复制USB规则文件
sudo cp 99-obsensor-libusb.rules /etc/udev/rules.d/

# 重新加载udev规则
sudo udevadm control --reload-rules
sudo udevadm trigger

# 重启系统或重新插拔相机
sudo reboot
```

### 2. 验证相机连接
```bash
# 运行相机测试脚本
python3 show_camera.py

# 如果正常，应该能看到彩色和深度图像
```

### 3. 相机固件更新 (可选但推荐)
```bash
# 使用Orbbec提供的工具更新固件
# 访问: https://www.orbbec.com.cn/ 下载最新固件
```

---

## 🚀 系统部署步骤

### 1. 克隆项目
```bash
# 克隆项目到机器人工作目录
cd ~/robot_ws/src
git clone https://github.com/rose-wang-hub/kuavo-ros-following-Orbbec.git

# 如果使用Git LFS，确保大文件被下载
git lfs pull
```

### 2. 创建虚拟环境 (推荐)
```bash
# 安装virtualenv
pip3 install virtualenv

# 创建虚拟环境
cd ~/robot_ws/src/kuavo-ros-following-Orbbec
virtualenv -p python3 venv
source venv/bin/activate
```

### 3. 安装Python依赖
```bash
# 激活虚拟环境
source venv/bin/activate

# 安装依赖
pip install -r robot_requirements.txt

# 安装Orbbec SDK wheel文件
pip install pyorbbecsdk-2.0.15-cp38-cp38-linux_x86_64.whl
```

### 4. 下载预训练模型
```bash
# 确保YOLOv8模型文件存在
ls src/yolo8-person-detector/yolov8n.pt

# 如果不存在，从ultralytics下载
python3 -c "from ultralytics import YOLO; model = YOLO('yolov8n.pt')"
```

### 5. 编译ROS包 (如果使用ROS)
```bash
cd ~/robot_ws
catkin_make

# 或者使用catkin build
catkin build
```

---

## 🎯 运行与测试

### 1. 基本功能测试
```bash
# 激活虚拟环境
cd ~/robot_ws/src/kuavo-ros-following-Orbbec
source venv/bin/activate

# 测试相机连接
python3 show_camera.py

# 测试跟踪系统 (非ROS模式)
cd src/yolo8-person-detector
python3 kuavo_follow_controller.py
```

### 2. ROS集成运行
```bash
# 启动ROS核心
roscore

# 新终端：启动跟踪节点
cd ~/robot_ws
source devel/setup.bash
source src/kuavo-ros-following-Orbbec/venv/bin/activate

rosrun yolo8-person-detector kuavo_follow_controller.py
```

### 3. 参数调优
根据实际环境调整 `kuavo_follow_controller.py` 中的参数：

```python
# 示例调参
YOLO_PERSON_CONF = 0.45      # 根据光照条件调整
TARGET_DISTANCE = 1.5        # 根据机器人尺寸调整
MAX_LOST_FRAMES = 10         # 根据运动速度调整
```

---

## 🔧 故障排除

### 相机相关问题
```bash
# 检查USB连接
lsusb | grep Orbbec

# 检查相机权限
ls -l /dev/video*

# 重新加载USB规则
sudo udevadm control --reload-rules
sudo udevadm trigger
```

### Python依赖问题
```bash
# 重新安装依赖
source venv/bin/activate
pip install --force-reinstall -r robot_requirements.txt

# 检查PyTorch CUDA支持
python3 -c "import torch; print(torch.cuda.is_available())"
```

### 性能问题
- **CPU占用过高**：增加 `YOLO_DETECT_INTERVAL` 值
- **内存不足**：减少轨迹历史长度或使用更小的模型
- **跟踪不稳定**：调整ReID阈值或增加光照

### ROS相关问题
```bash
# 检查ROS环境
echo $ROS_PACKAGE_PATH

# 重建工作空间
cd ~/robot_ws
rm -rf build devel
catkin_make
```

---

## ⚡ 性能优化

### 1. GPU加速
- 确保CUDA正确安装
- 使用GPU版本的PyTorch
- 考虑使用TensorRT加速YOLO推理

### 2. 系统优化
```bash
# 禁用不必要的服务
sudo systemctl disable bluetooth.service
sudo systemctl disable cups.service

# 调整CPU频率
sudo apt install cpufrequtils
sudo cpufreq-set -g performance
```

### 3. 网络优化 (如果需要远程监控)
```bash
# 配置SSH无密码登录
ssh-keygen -t rsa
ssh-copy-id user@robot_ip

# 使用ROS网络配置
export ROS_MASTER_URI=http://robot_ip:11311
export ROS_IP=robot_ip
```

---

## 📞 支持与维护

### 定期维护
- 每月更新系统补丁：`sudo apt update && sudo apt upgrade`
- 每季度检查相机固件更新
- 定期备份配置文件和调优参数

### 获取帮助
- 查看项目GitHub Issues
- 检查Orbbec官方文档
- ROS社区论坛

---

## ✅ 部署检查清单

- [ ] 硬件连接正确 (相机、机器人)
- [ ] 系统更新完成
- [ ] Python环境配置完成
- [ ] 依赖包安装成功
- [ ] 相机测试通过
- [ ] 跟踪系统运行正常
- [ ] ROS集成完成 (如果需要)
- [ ] 参数调优完成
- [ ] 性能测试通过

按照此指南操作，您应该能够成功在机器人上部署Orbbec Gemini 335L人形跟随系统。如有问题，请参考故障排除部分或提交GitHub Issue。