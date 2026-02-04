import cv2
import numpy as np
import pyorbbecsdk as ob

# 创建管道
pipeline = ob.Pipeline()

# 获取设备
device = pipeline.get_device()

# 获取流配置
config = ob.Config()

# 启用彩色流
color_profile = pipeline.get_stream_profile_list(ob.OBSensorType.COLOR_SENSOR).get_video_stream_profile(0, 0, ob.OBFormat.RGB, 0)
config.enable_stream(color_profile)

# 启用深度流（可选）
depth_profile = pipeline.get_stream_profile_list(ob.OBSensorType.DEPTH_SENSOR).get_video_stream_profile(0, 0, ob.OBFormat.Y16, 0)
config.enable_stream(depth_profile)

# 启动管道
pipeline.start(config)

print("相机启动成功，开始显示画面。按'q'退出。")

try:
    while True:
        # 等待帧
        frames = pipeline.wait_for_frames(100)
        if frames is None:
            continue

        # 获取彩色帧
        color_frame = frames.get_color_frame()
        if color_frame is not None:
            color_data = color_frame.get_data()
            color_image = np.frombuffer(color_data, dtype=np.uint8).reshape((color_frame.get_height(), color_frame.get_width(), 3))
            color_image = cv2.cvtColor(color_image, cv2.COLOR_RGB2BGR)
            cv2.imshow('Orbbec Gemini 335L - Color', color_image)

        # 获取深度帧（可选）
        depth_frame = frames.get_depth_frame()
        if depth_frame is not None:
            depth_data = depth_frame.get_data()
            depth_image = np.frombuffer(depth_data, dtype=np.uint16).reshape((depth_frame.get_height(), depth_frame.get_width()))
            # 归一化深度图像以显示
            depth_image = cv2.normalize(depth_image, None, 0, 255, cv2.NORM_MINMAX, dtype=cv2.CV_8U)
            depth_image = cv2.applyColorMap(depth_image, cv2.COLORMAP_JET)
            cv2.imshow('Orbbec Gemini 335L - Depth', depth_image)

        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

except KeyboardInterrupt:
    print("中断")

finally:
    # 停止管道
    pipeline.stop()
    cv2.destroyAllWindows()