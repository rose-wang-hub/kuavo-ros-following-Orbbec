; Auto-generated. Do not edit!


(cl:in-package kuavo_person_follow-msg)


;//! \htmlinclude PersonState.msg.html

(cl:defclass <PersonState> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (z
    :reader z
    :initarg :z
    :type cl:float
    :initform 0.0)
   (vx
    :reader vx
    :initarg :vx
    :type cl:float
    :initform 0.0)
   (vz
    :reader vz
    :initarg :vz
    :type cl:float
    :initform 0.0)
   (yaw_err
    :reader yaw_err
    :initarg :yaw_err
    :type cl:float
    :initform 0.0)
   (valid
    :reader valid
    :initarg :valid
    :type cl:boolean
    :initform cl:nil)
   (confidence
    :reader confidence
    :initarg :confidence
    :type cl:float
    :initform 0.0))
)

(cl:defclass PersonState (<PersonState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PersonState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PersonState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name kuavo_person_follow-msg:<PersonState> is deprecated: use kuavo_person_follow-msg:PersonState instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <PersonState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kuavo_person_follow-msg:x-val is deprecated.  Use kuavo_person_follow-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <PersonState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kuavo_person_follow-msg:z-val is deprecated.  Use kuavo_person_follow-msg:z instead.")
  (z m))

(cl:ensure-generic-function 'vx-val :lambda-list '(m))
(cl:defmethod vx-val ((m <PersonState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kuavo_person_follow-msg:vx-val is deprecated.  Use kuavo_person_follow-msg:vx instead.")
  (vx m))

(cl:ensure-generic-function 'vz-val :lambda-list '(m))
(cl:defmethod vz-val ((m <PersonState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kuavo_person_follow-msg:vz-val is deprecated.  Use kuavo_person_follow-msg:vz instead.")
  (vz m))

(cl:ensure-generic-function 'yaw_err-val :lambda-list '(m))
(cl:defmethod yaw_err-val ((m <PersonState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kuavo_person_follow-msg:yaw_err-val is deprecated.  Use kuavo_person_follow-msg:yaw_err instead.")
  (yaw_err m))

(cl:ensure-generic-function 'valid-val :lambda-list '(m))
(cl:defmethod valid-val ((m <PersonState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kuavo_person_follow-msg:valid-val is deprecated.  Use kuavo_person_follow-msg:valid instead.")
  (valid m))

(cl:ensure-generic-function 'confidence-val :lambda-list '(m))
(cl:defmethod confidence-val ((m <PersonState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kuavo_person_follow-msg:confidence-val is deprecated.  Use kuavo_person_follow-msg:confidence instead.")
  (confidence m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PersonState>) ostream)
  "Serializes a message object of type '<PersonState>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vx))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vz))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yaw_err))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'valid) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'confidence))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PersonState>) istream)
  "Deserializes a message object of type '<PersonState>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vx) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vz) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw_err) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'valid) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'confidence) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PersonState>)))
  "Returns string type for a message object of type '<PersonState>"
  "kuavo_person_follow/PersonState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PersonState)))
  "Returns string type for a message object of type 'PersonState"
  "kuavo_person_follow/PersonState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PersonState>)))
  "Returns md5sum for a message object of type '<PersonState>"
  "ff2a122bd34c3d20e5271bb623e20485")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PersonState)))
  "Returns md5sum for a message object of type 'PersonState"
  "ff2a122bd34c3d20e5271bb623e20485")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PersonState>)))
  "Returns full string definition for message of type '<PersonState>"
  (cl:format cl:nil "float32 x        # 左右偏移 (m)，左为正（base_link 坐标系）~%float32 z        # 前后距离 (m)，前方为正~%float32 vx       # x 方向速度 (m/s)~%float32 vz       # z 方向速度 (m/s)~%float32 yaw_err  # 朝向误差 (rad)，>0 目标在左侧~%bool   valid     # 当前是否有可靠目标~%float32 confidence  # 0~~1, 置信度~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PersonState)))
  "Returns full string definition for message of type 'PersonState"
  (cl:format cl:nil "float32 x        # 左右偏移 (m)，左为正（base_link 坐标系）~%float32 z        # 前后距离 (m)，前方为正~%float32 vx       # x 方向速度 (m/s)~%float32 vz       # z 方向速度 (m/s)~%float32 yaw_err  # 朝向误差 (rad)，>0 目标在左侧~%bool   valid     # 当前是否有可靠目标~%float32 confidence  # 0~~1, 置信度~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PersonState>))
  (cl:+ 0
     4
     4
     4
     4
     4
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PersonState>))
  "Converts a ROS message object to a list"
  (cl:list 'PersonState
    (cl:cons ':x (x msg))
    (cl:cons ':z (z msg))
    (cl:cons ':vx (vx msg))
    (cl:cons ':vz (vz msg))
    (cl:cons ':yaw_err (yaw_err msg))
    (cl:cons ':valid (valid msg))
    (cl:cons ':confidence (confidence msg))
))
