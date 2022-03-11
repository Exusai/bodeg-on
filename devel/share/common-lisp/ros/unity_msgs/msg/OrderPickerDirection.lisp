; Auto-generated. Do not edit!


(cl:in-package unity_msgs-msg)


;//! \htmlinclude OrderPickerDirection.msg.html

(cl:defclass <OrderPickerDirection> (roslisp-msg-protocol:ros-message)
  ((orderPickerDirection
    :reader orderPickerDirection
    :initarg :orderPickerDirection
    :type cl:float
    :initform 0.0))
)

(cl:defclass OrderPickerDirection (<OrderPickerDirection>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <OrderPickerDirection>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'OrderPickerDirection)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name unity_msgs-msg:<OrderPickerDirection> is deprecated: use unity_msgs-msg:OrderPickerDirection instead.")))

(cl:ensure-generic-function 'orderPickerDirection-val :lambda-list '(m))
(cl:defmethod orderPickerDirection-val ((m <OrderPickerDirection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_msgs-msg:orderPickerDirection-val is deprecated.  Use unity_msgs-msg:orderPickerDirection instead.")
  (orderPickerDirection m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <OrderPickerDirection>) ostream)
  "Serializes a message object of type '<OrderPickerDirection>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'orderPickerDirection))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <OrderPickerDirection>) istream)
  "Deserializes a message object of type '<OrderPickerDirection>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'orderPickerDirection) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<OrderPickerDirection>)))
  "Returns string type for a message object of type '<OrderPickerDirection>"
  "unity_msgs/OrderPickerDirection")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'OrderPickerDirection)))
  "Returns string type for a message object of type 'OrderPickerDirection"
  "unity_msgs/OrderPickerDirection")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<OrderPickerDirection>)))
  "Returns md5sum for a message object of type '<OrderPickerDirection>"
  "83553efb863f0e36f94f0d60ee9c10ce")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'OrderPickerDirection)))
  "Returns md5sum for a message object of type 'OrderPickerDirection"
  "83553efb863f0e36f94f0d60ee9c10ce")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<OrderPickerDirection>)))
  "Returns full string definition for message of type '<OrderPickerDirection>"
  (cl:format cl:nil "float32 orderPickerDirection~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'OrderPickerDirection)))
  "Returns full string definition for message of type 'OrderPickerDirection"
  (cl:format cl:nil "float32 orderPickerDirection~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <OrderPickerDirection>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <OrderPickerDirection>))
  "Converts a ROS message object to a list"
  (cl:list 'OrderPickerDirection
    (cl:cons ':orderPickerDirection (orderPickerDirection msg))
))
