; Auto-generated. Do not edit!


(cl:in-package unity_msgs-msg)


;//! \htmlinclude OrderPickerLifter.msg.html

(cl:defclass <OrderPickerLifter> (roslisp-msg-protocol:ros-message)
  ((lifterHeight
    :reader lifterHeight
    :initarg :lifterHeight
    :type cl:float
    :initform 0.0))
)

(cl:defclass OrderPickerLifter (<OrderPickerLifter>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <OrderPickerLifter>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'OrderPickerLifter)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name unity_msgs-msg:<OrderPickerLifter> is deprecated: use unity_msgs-msg:OrderPickerLifter instead.")))

(cl:ensure-generic-function 'lifterHeight-val :lambda-list '(m))
(cl:defmethod lifterHeight-val ((m <OrderPickerLifter>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_msgs-msg:lifterHeight-val is deprecated.  Use unity_msgs-msg:lifterHeight instead.")
  (lifterHeight m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <OrderPickerLifter>) ostream)
  "Serializes a message object of type '<OrderPickerLifter>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'lifterHeight))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <OrderPickerLifter>) istream)
  "Deserializes a message object of type '<OrderPickerLifter>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lifterHeight) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<OrderPickerLifter>)))
  "Returns string type for a message object of type '<OrderPickerLifter>"
  "unity_msgs/OrderPickerLifter")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'OrderPickerLifter)))
  "Returns string type for a message object of type 'OrderPickerLifter"
  "unity_msgs/OrderPickerLifter")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<OrderPickerLifter>)))
  "Returns md5sum for a message object of type '<OrderPickerLifter>"
  "6763d9c3a4d73a57831d19dcb37daf6a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'OrderPickerLifter)))
  "Returns md5sum for a message object of type 'OrderPickerLifter"
  "6763d9c3a4d73a57831d19dcb37daf6a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<OrderPickerLifter>)))
  "Returns full string definition for message of type '<OrderPickerLifter>"
  (cl:format cl:nil "float32 lifterHeight~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'OrderPickerLifter)))
  "Returns full string definition for message of type 'OrderPickerLifter"
  (cl:format cl:nil "float32 lifterHeight~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <OrderPickerLifter>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <OrderPickerLifter>))
  "Converts a ROS message object to a list"
  (cl:list 'OrderPickerLifter
    (cl:cons ':lifterHeight (lifterHeight msg))
))
