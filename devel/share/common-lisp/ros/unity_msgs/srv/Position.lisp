; Auto-generated. Do not edit!


(cl:in-package unity_msgs-srv)


;//! \htmlinclude Position-request.msg.html

(cl:defclass <Position-request> (roslisp-msg-protocol:ros-message)
  ((input
    :reader input
    :initarg :input
    :type unity_msgs-msg:OrderPickerPosition
    :initform (cl:make-instance 'unity_msgs-msg:OrderPickerPosition)))
)

(cl:defclass Position-request (<Position-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Position-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Position-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name unity_msgs-srv:<Position-request> is deprecated: use unity_msgs-srv:Position-request instead.")))

(cl:ensure-generic-function 'input-val :lambda-list '(m))
(cl:defmethod input-val ((m <Position-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_msgs-srv:input-val is deprecated.  Use unity_msgs-srv:input instead.")
  (input m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Position-request>) ostream)
  "Serializes a message object of type '<Position-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'input) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Position-request>) istream)
  "Deserializes a message object of type '<Position-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'input) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Position-request>)))
  "Returns string type for a service object of type '<Position-request>"
  "unity_msgs/PositionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Position-request)))
  "Returns string type for a service object of type 'Position-request"
  "unity_msgs/PositionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Position-request>)))
  "Returns md5sum for a message object of type '<Position-request>"
  "5190f887b70decc2fafe0ae2939b233a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Position-request)))
  "Returns md5sum for a message object of type 'Position-request"
  "5190f887b70decc2fafe0ae2939b233a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Position-request>)))
  "Returns full string definition for message of type '<Position-request>"
  (cl:format cl:nil "OrderPickerPosition input~%~%================================================================================~%MSG: unity_msgs/OrderPickerPosition~%float32 pos_x~%float32 pos_y~%float32 pos_z~%float32 rot_x~%float32 rot_y~%float32 rot_z~%float32 rot_w~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Position-request)))
  "Returns full string definition for message of type 'Position-request"
  (cl:format cl:nil "OrderPickerPosition input~%~%================================================================================~%MSG: unity_msgs/OrderPickerPosition~%float32 pos_x~%float32 pos_y~%float32 pos_z~%float32 rot_x~%float32 rot_y~%float32 rot_z~%float32 rot_w~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Position-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'input))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Position-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Position-request
    (cl:cons ':input (input msg))
))
;//! \htmlinclude Position-response.msg.html

(cl:defclass <Position-response> (roslisp-msg-protocol:ros-message)
  ((output
    :reader output
    :initarg :output
    :type unity_msgs-msg:OrderPickerPosition
    :initform (cl:make-instance 'unity_msgs-msg:OrderPickerPosition)))
)

(cl:defclass Position-response (<Position-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Position-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Position-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name unity_msgs-srv:<Position-response> is deprecated: use unity_msgs-srv:Position-response instead.")))

(cl:ensure-generic-function 'output-val :lambda-list '(m))
(cl:defmethod output-val ((m <Position-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_msgs-srv:output-val is deprecated.  Use unity_msgs-srv:output instead.")
  (output m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Position-response>) ostream)
  "Serializes a message object of type '<Position-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'output) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Position-response>) istream)
  "Deserializes a message object of type '<Position-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'output) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Position-response>)))
  "Returns string type for a service object of type '<Position-response>"
  "unity_msgs/PositionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Position-response)))
  "Returns string type for a service object of type 'Position-response"
  "unity_msgs/PositionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Position-response>)))
  "Returns md5sum for a message object of type '<Position-response>"
  "5190f887b70decc2fafe0ae2939b233a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Position-response)))
  "Returns md5sum for a message object of type 'Position-response"
  "5190f887b70decc2fafe0ae2939b233a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Position-response>)))
  "Returns full string definition for message of type '<Position-response>"
  (cl:format cl:nil "OrderPickerPosition output~%~%================================================================================~%MSG: unity_msgs/OrderPickerPosition~%float32 pos_x~%float32 pos_y~%float32 pos_z~%float32 rot_x~%float32 rot_y~%float32 rot_z~%float32 rot_w~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Position-response)))
  "Returns full string definition for message of type 'Position-response"
  (cl:format cl:nil "OrderPickerPosition output~%~%================================================================================~%MSG: unity_msgs/OrderPickerPosition~%float32 pos_x~%float32 pos_y~%float32 pos_z~%float32 rot_x~%float32 rot_y~%float32 rot_z~%float32 rot_w~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Position-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'output))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Position-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Position-response
    (cl:cons ':output (output msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Position)))
  'Position-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Position)))
  'Position-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Position)))
  "Returns string type for a service object of type '<Position>"
  "unity_msgs/Position")