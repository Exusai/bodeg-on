; Auto-generated. Do not edit!


(cl:in-package unity_msgs-msg)


;//! \htmlinclude ArmTarget.msg.html

(cl:defclass <ArmTarget> (roslisp-msg-protocol:ros-message)
  ((xTarget
    :reader xTarget
    :initarg :xTarget
    :type cl:float
    :initform 0.0)
   (yTarget
    :reader yTarget
    :initarg :yTarget
    :type cl:float
    :initform 0.0)
   (zTarget
    :reader zTarget
    :initarg :zTarget
    :type cl:float
    :initform 0.0)
   (grabAngle
    :reader grabAngle
    :initarg :grabAngle
    :type cl:float
    :initform 0.0))
)

(cl:defclass ArmTarget (<ArmTarget>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ArmTarget>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ArmTarget)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name unity_msgs-msg:<ArmTarget> is deprecated: use unity_msgs-msg:ArmTarget instead.")))

(cl:ensure-generic-function 'xTarget-val :lambda-list '(m))
(cl:defmethod xTarget-val ((m <ArmTarget>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_msgs-msg:xTarget-val is deprecated.  Use unity_msgs-msg:xTarget instead.")
  (xTarget m))

(cl:ensure-generic-function 'yTarget-val :lambda-list '(m))
(cl:defmethod yTarget-val ((m <ArmTarget>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_msgs-msg:yTarget-val is deprecated.  Use unity_msgs-msg:yTarget instead.")
  (yTarget m))

(cl:ensure-generic-function 'zTarget-val :lambda-list '(m))
(cl:defmethod zTarget-val ((m <ArmTarget>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_msgs-msg:zTarget-val is deprecated.  Use unity_msgs-msg:zTarget instead.")
  (zTarget m))

(cl:ensure-generic-function 'grabAngle-val :lambda-list '(m))
(cl:defmethod grabAngle-val ((m <ArmTarget>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_msgs-msg:grabAngle-val is deprecated.  Use unity_msgs-msg:grabAngle instead.")
  (grabAngle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ArmTarget>) ostream)
  "Serializes a message object of type '<ArmTarget>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'xTarget))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yTarget))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'zTarget))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'grabAngle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ArmTarget>) istream)
  "Deserializes a message object of type '<ArmTarget>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'xTarget) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yTarget) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'zTarget) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'grabAngle) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ArmTarget>)))
  "Returns string type for a message object of type '<ArmTarget>"
  "unity_msgs/ArmTarget")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ArmTarget)))
  "Returns string type for a message object of type 'ArmTarget"
  "unity_msgs/ArmTarget")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ArmTarget>)))
  "Returns md5sum for a message object of type '<ArmTarget>"
  "5bd81dd8154876a58e80e524a6eefe6e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ArmTarget)))
  "Returns md5sum for a message object of type 'ArmTarget"
  "5bd81dd8154876a58e80e524a6eefe6e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ArmTarget>)))
  "Returns full string definition for message of type '<ArmTarget>"
  (cl:format cl:nil "float32 xTarget~%float32 yTarget~%float32 zTarget~%float32 grabAngle~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ArmTarget)))
  "Returns full string definition for message of type 'ArmTarget"
  (cl:format cl:nil "float32 xTarget~%float32 yTarget~%float32 zTarget~%float32 grabAngle~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ArmTarget>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ArmTarget>))
  "Converts a ROS message object to a list"
  (cl:list 'ArmTarget
    (cl:cons ':xTarget (xTarget msg))
    (cl:cons ':yTarget (yTarget msg))
    (cl:cons ':zTarget (zTarget msg))
    (cl:cons ':grabAngle (grabAngle msg))
))
