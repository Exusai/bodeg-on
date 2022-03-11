; Auto-generated. Do not edit!


(cl:in-package unity_msgs-msg)


;//! \htmlinclude OrderPickerVelocity.msg.html

(cl:defclass <OrderPickerVelocity> (roslisp-msg-protocol:ros-message)
  ((orderPickerSpeed
    :reader orderPickerSpeed
    :initarg :orderPickerSpeed
    :type cl:float
    :initform 0.0))
)

(cl:defclass OrderPickerVelocity (<OrderPickerVelocity>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <OrderPickerVelocity>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'OrderPickerVelocity)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name unity_msgs-msg:<OrderPickerVelocity> is deprecated: use unity_msgs-msg:OrderPickerVelocity instead.")))

(cl:ensure-generic-function 'orderPickerSpeed-val :lambda-list '(m))
(cl:defmethod orderPickerSpeed-val ((m <OrderPickerVelocity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_msgs-msg:orderPickerSpeed-val is deprecated.  Use unity_msgs-msg:orderPickerSpeed instead.")
  (orderPickerSpeed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <OrderPickerVelocity>) ostream)
  "Serializes a message object of type '<OrderPickerVelocity>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'orderPickerSpeed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <OrderPickerVelocity>) istream)
  "Deserializes a message object of type '<OrderPickerVelocity>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'orderPickerSpeed) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<OrderPickerVelocity>)))
  "Returns string type for a message object of type '<OrderPickerVelocity>"
  "unity_msgs/OrderPickerVelocity")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'OrderPickerVelocity)))
  "Returns string type for a message object of type 'OrderPickerVelocity"
  "unity_msgs/OrderPickerVelocity")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<OrderPickerVelocity>)))
  "Returns md5sum for a message object of type '<OrderPickerVelocity>"
  "b771032ad1d53adf5c692218acbd5c7b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'OrderPickerVelocity)))
  "Returns md5sum for a message object of type 'OrderPickerVelocity"
  "b771032ad1d53adf5c692218acbd5c7b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<OrderPickerVelocity>)))
  "Returns full string definition for message of type '<OrderPickerVelocity>"
  (cl:format cl:nil "float32 orderPickerSpeed~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'OrderPickerVelocity)))
  "Returns full string definition for message of type 'OrderPickerVelocity"
  (cl:format cl:nil "float32 orderPickerSpeed~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <OrderPickerVelocity>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <OrderPickerVelocity>))
  "Converts a ROS message object to a list"
  (cl:list 'OrderPickerVelocity
    (cl:cons ':orderPickerSpeed (orderPickerSpeed msg))
))
