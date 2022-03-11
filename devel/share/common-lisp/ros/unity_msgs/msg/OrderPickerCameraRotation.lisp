; Auto-generated. Do not edit!


(cl:in-package unity_msgs-msg)


;//! \htmlinclude OrderPickerCameraRotation.msg.html

(cl:defclass <OrderPickerCameraRotation> (roslisp-msg-protocol:ros-message)
  ((orderPickerCameraRotation
    :reader orderPickerCameraRotation
    :initarg :orderPickerCameraRotation
    :type cl:float
    :initform 0.0))
)

(cl:defclass OrderPickerCameraRotation (<OrderPickerCameraRotation>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <OrderPickerCameraRotation>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'OrderPickerCameraRotation)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name unity_msgs-msg:<OrderPickerCameraRotation> is deprecated: use unity_msgs-msg:OrderPickerCameraRotation instead.")))

(cl:ensure-generic-function 'orderPickerCameraRotation-val :lambda-list '(m))
(cl:defmethod orderPickerCameraRotation-val ((m <OrderPickerCameraRotation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_msgs-msg:orderPickerCameraRotation-val is deprecated.  Use unity_msgs-msg:orderPickerCameraRotation instead.")
  (orderPickerCameraRotation m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <OrderPickerCameraRotation>) ostream)
  "Serializes a message object of type '<OrderPickerCameraRotation>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'orderPickerCameraRotation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <OrderPickerCameraRotation>) istream)
  "Deserializes a message object of type '<OrderPickerCameraRotation>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'orderPickerCameraRotation) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<OrderPickerCameraRotation>)))
  "Returns string type for a message object of type '<OrderPickerCameraRotation>"
  "unity_msgs/OrderPickerCameraRotation")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'OrderPickerCameraRotation)))
  "Returns string type for a message object of type 'OrderPickerCameraRotation"
  "unity_msgs/OrderPickerCameraRotation")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<OrderPickerCameraRotation>)))
  "Returns md5sum for a message object of type '<OrderPickerCameraRotation>"
  "d0b74d1f759a1fb713ba4af444bedb4b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'OrderPickerCameraRotation)))
  "Returns md5sum for a message object of type 'OrderPickerCameraRotation"
  "d0b74d1f759a1fb713ba4af444bedb4b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<OrderPickerCameraRotation>)))
  "Returns full string definition for message of type '<OrderPickerCameraRotation>"
  (cl:format cl:nil "float32 orderPickerCameraRotation~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'OrderPickerCameraRotation)))
  "Returns full string definition for message of type 'OrderPickerCameraRotation"
  (cl:format cl:nil "float32 orderPickerCameraRotation~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <OrderPickerCameraRotation>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <OrderPickerCameraRotation>))
  "Converts a ROS message object to a list"
  (cl:list 'OrderPickerCameraRotation
    (cl:cons ':orderPickerCameraRotation (orderPickerCameraRotation msg))
))
