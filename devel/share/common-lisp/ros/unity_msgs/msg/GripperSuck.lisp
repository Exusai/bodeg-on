; Auto-generated. Do not edit!


(cl:in-package unity_msgs-msg)


;//! \htmlinclude GripperSuck.msg.html

(cl:defclass <GripperSuck> (roslisp-msg-protocol:ros-message)
  ((suck
    :reader suck
    :initarg :suck
    :type cl:float
    :initform 0.0))
)

(cl:defclass GripperSuck (<GripperSuck>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GripperSuck>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GripperSuck)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name unity_msgs-msg:<GripperSuck> is deprecated: use unity_msgs-msg:GripperSuck instead.")))

(cl:ensure-generic-function 'suck-val :lambda-list '(m))
(cl:defmethod suck-val ((m <GripperSuck>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_msgs-msg:suck-val is deprecated.  Use unity_msgs-msg:suck instead.")
  (suck m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GripperSuck>) ostream)
  "Serializes a message object of type '<GripperSuck>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'suck))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GripperSuck>) istream)
  "Deserializes a message object of type '<GripperSuck>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'suck) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GripperSuck>)))
  "Returns string type for a message object of type '<GripperSuck>"
  "unity_msgs/GripperSuck")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GripperSuck)))
  "Returns string type for a message object of type 'GripperSuck"
  "unity_msgs/GripperSuck")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GripperSuck>)))
  "Returns md5sum for a message object of type '<GripperSuck>"
  "99e58236a92fed374f4db00fc52a88ea")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GripperSuck)))
  "Returns md5sum for a message object of type 'GripperSuck"
  "99e58236a92fed374f4db00fc52a88ea")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GripperSuck>)))
  "Returns full string definition for message of type '<GripperSuck>"
  (cl:format cl:nil "float32 suck~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GripperSuck)))
  "Returns full string definition for message of type 'GripperSuck"
  (cl:format cl:nil "float32 suck~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GripperSuck>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GripperSuck>))
  "Converts a ROS message object to a list"
  (cl:list 'GripperSuck
    (cl:cons ':suck (suck msg))
))
