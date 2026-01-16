;; Auto-generated. Do not edit!


(when (boundp 'kuavo_person_follow::PersonState)
  (if (not (find-package "KUAVO_PERSON_FOLLOW"))
    (make-package "KUAVO_PERSON_FOLLOW"))
  (shadow 'PersonState (find-package "KUAVO_PERSON_FOLLOW")))
(unless (find-package "KUAVO_PERSON_FOLLOW::PERSONSTATE")
  (make-package "KUAVO_PERSON_FOLLOW::PERSONSTATE"))

(in-package "ROS")
;;//! \htmlinclude PersonState.msg.html


(defclass kuavo_person_follow::PersonState
  :super ros::object
  :slots (_x _z _vx _vz _yaw_err _valid _confidence ))

(defmethod kuavo_person_follow::PersonState
  (:init
   (&key
    ((:x __x) 0.0)
    ((:z __z) 0.0)
    ((:vx __vx) 0.0)
    ((:vz __vz) 0.0)
    ((:yaw_err __yaw_err) 0.0)
    ((:valid __valid) nil)
    ((:confidence __confidence) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _z (float __z))
   (setq _vx (float __vx))
   (setq _vz (float __vz))
   (setq _yaw_err (float __yaw_err))
   (setq _valid __valid)
   (setq _confidence (float __confidence))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:vx
   (&optional __vx)
   (if __vx (setq _vx __vx)) _vx)
  (:vz
   (&optional __vz)
   (if __vz (setq _vz __vz)) _vz)
  (:yaw_err
   (&optional __yaw_err)
   (if __yaw_err (setq _yaw_err __yaw_err)) _yaw_err)
  (:valid
   (&optional (__valid :null))
   (if (not (eq __valid :null)) (setq _valid __valid)) _valid)
  (:confidence
   (&optional __confidence)
   (if __confidence (setq _confidence __confidence)) _confidence)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _z
    4
    ;; float32 _vx
    4
    ;; float32 _vz
    4
    ;; float32 _yaw_err
    4
    ;; bool _valid
    1
    ;; float32 _confidence
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _z
       (sys::poke _z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vx
       (sys::poke _vx (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vz
       (sys::poke _vz (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw_err
       (sys::poke _yaw_err (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _valid
       (if _valid (write-byte -1 s) (write-byte 0 s))
     ;; float32 _confidence
       (sys::poke _confidence (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _z
     (setq _z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vx
     (setq _vx (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vz
     (setq _vz (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw_err
     (setq _yaw_err (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _valid
     (setq _valid (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _confidence
     (setq _confidence (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get kuavo_person_follow::PersonState :md5sum-) "ff2a122bd34c3d20e5271bb623e20485")
(setf (get kuavo_person_follow::PersonState :datatype-) "kuavo_person_follow/PersonState")
(setf (get kuavo_person_follow::PersonState :definition-)
      "float32 x        # 左右偏移 (m)，左为正（base_link 坐标系）
float32 z        # 前后距离 (m)，前方为正
float32 vx       # x 方向速度 (m/s)
float32 vz       # z 方向速度 (m/s)
float32 yaw_err  # 朝向误差 (rad)，>0 目标在左侧
bool   valid     # 当前是否有可靠目标
float32 confidence  # 0~1, 置信度

")



(provide :kuavo_person_follow/PersonState "ff2a122bd34c3d20e5271bb623e20485")


