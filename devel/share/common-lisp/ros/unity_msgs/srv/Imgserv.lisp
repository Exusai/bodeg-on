; Auto-generated. Do not edit!


(cl:in-package unity_msgs-srv)


;//! \htmlinclude Imgserv-request.msg.html

(cl:defclass <Imgserv-request> (roslisp-msg-protocol:ros-message)
  ((input
    :reader input
    :initarg :input
    :type unity_msgs-msg:CamImgs
    :initform (cl:make-instance 'unity_msgs-msg:CamImgs)))
)

(cl:defclass Imgserv-request (<Imgserv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Imgserv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Imgserv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name unity_msgs-srv:<Imgserv-request> is deprecated: use unity_msgs-srv:Imgserv-request instead.")))

(cl:ensure-generic-function 'input-val :lambda-list '(m))
(cl:defmethod input-val ((m <Imgserv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_msgs-srv:input-val is deprecated.  Use unity_msgs-srv:input instead.")
  (input m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Imgserv-request>) ostream)
  "Serializes a message object of type '<Imgserv-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'input) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Imgserv-request>) istream)
  "Deserializes a message object of type '<Imgserv-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'input) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Imgserv-request>)))
  "Returns string type for a service object of type '<Imgserv-request>"
  "unity_msgs/ImgservRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Imgserv-request)))
  "Returns string type for a service object of type 'Imgserv-request"
  "unity_msgs/ImgservRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Imgserv-request>)))
  "Returns md5sum for a message object of type '<Imgserv-request>"
  "2756544b56553ab47e7b3ef7356d02a3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Imgserv-request)))
  "Returns md5sum for a message object of type 'Imgserv-request"
  "2756544b56553ab47e7b3ef7356d02a3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Imgserv-request>)))
  "Returns full string definition for message of type '<Imgserv-request>"
  (cl:format cl:nil "CamImgs input~%~%================================================================================~%MSG: unity_msgs/CamImgs~%Header header~%string format~%uint8[] data~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Imgserv-request)))
  "Returns full string definition for message of type 'Imgserv-request"
  (cl:format cl:nil "CamImgs input~%~%================================================================================~%MSG: unity_msgs/CamImgs~%Header header~%string format~%uint8[] data~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Imgserv-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'input))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Imgserv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Imgserv-request
    (cl:cons ':input (input msg))
))
;//! \htmlinclude Imgserv-response.msg.html

(cl:defclass <Imgserv-response> (roslisp-msg-protocol:ros-message)
  ((output
    :reader output
    :initarg :output
    :type unity_msgs-msg:CamImgs
    :initform (cl:make-instance 'unity_msgs-msg:CamImgs)))
)

(cl:defclass Imgserv-response (<Imgserv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Imgserv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Imgserv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name unity_msgs-srv:<Imgserv-response> is deprecated: use unity_msgs-srv:Imgserv-response instead.")))

(cl:ensure-generic-function 'output-val :lambda-list '(m))
(cl:defmethod output-val ((m <Imgserv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_msgs-srv:output-val is deprecated.  Use unity_msgs-srv:output instead.")
  (output m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Imgserv-response>) ostream)
  "Serializes a message object of type '<Imgserv-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'output) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Imgserv-response>) istream)
  "Deserializes a message object of type '<Imgserv-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'output) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Imgserv-response>)))
  "Returns string type for a service object of type '<Imgserv-response>"
  "unity_msgs/ImgservResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Imgserv-response)))
  "Returns string type for a service object of type 'Imgserv-response"
  "unity_msgs/ImgservResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Imgserv-response>)))
  "Returns md5sum for a message object of type '<Imgserv-response>"
  "2756544b56553ab47e7b3ef7356d02a3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Imgserv-response)))
  "Returns md5sum for a message object of type 'Imgserv-response"
  "2756544b56553ab47e7b3ef7356d02a3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Imgserv-response>)))
  "Returns full string definition for message of type '<Imgserv-response>"
  (cl:format cl:nil "CamImgs output~%~%================================================================================~%MSG: unity_msgs/CamImgs~%Header header~%string format~%uint8[] data~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Imgserv-response)))
  "Returns full string definition for message of type 'Imgserv-response"
  (cl:format cl:nil "CamImgs output~%~%================================================================================~%MSG: unity_msgs/CamImgs~%Header header~%string format~%uint8[] data~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Imgserv-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'output))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Imgserv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Imgserv-response
    (cl:cons ':output (output msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Imgserv)))
  'Imgserv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Imgserv)))
  'Imgserv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Imgserv)))
  "Returns string type for a service object of type '<Imgserv>"
  "unity_msgs/Imgserv")