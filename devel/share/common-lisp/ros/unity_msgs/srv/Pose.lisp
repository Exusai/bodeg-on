; Auto-generated. Do not edit!


(cl:in-package unity_msgs-srv)


;//! \htmlinclude Pose-request.msg.html

(cl:defclass <Pose-request> (roslisp-msg-protocol:ros-message)
  ((input
    :reader input
    :initarg :input
    :type unity_msgs-msg:ArmPose
    :initform (cl:make-instance 'unity_msgs-msg:ArmPose)))
)

(cl:defclass Pose-request (<Pose-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Pose-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Pose-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name unity_msgs-srv:<Pose-request> is deprecated: use unity_msgs-srv:Pose-request instead.")))

(cl:ensure-generic-function 'input-val :lambda-list '(m))
(cl:defmethod input-val ((m <Pose-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_msgs-srv:input-val is deprecated.  Use unity_msgs-srv:input instead.")
  (input m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Pose-request>) ostream)
  "Serializes a message object of type '<Pose-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'input) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Pose-request>) istream)
  "Deserializes a message object of type '<Pose-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'input) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Pose-request>)))
  "Returns string type for a service object of type '<Pose-request>"
  "unity_msgs/PoseRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Pose-request)))
  "Returns string type for a service object of type 'Pose-request"
  "unity_msgs/PoseRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Pose-request>)))
  "Returns md5sum for a message object of type '<Pose-request>"
  "b83998b949202c6834b3ab9d4bd151b4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Pose-request)))
  "Returns md5sum for a message object of type 'Pose-request"
  "b83998b949202c6834b3ab9d4bd151b4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Pose-request>)))
  "Returns full string definition for message of type '<Pose-request>"
  (cl:format cl:nil "ArmPose input~%~%================================================================================~%MSG: unity_msgs/ArmPose~%float32 q1~%float32 q2~%float32 q3~%float32 d4~%float32 q5~%float32 succ~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Pose-request)))
  "Returns full string definition for message of type 'Pose-request"
  (cl:format cl:nil "ArmPose input~%~%================================================================================~%MSG: unity_msgs/ArmPose~%float32 q1~%float32 q2~%float32 q3~%float32 d4~%float32 q5~%float32 succ~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Pose-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'input))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Pose-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Pose-request
    (cl:cons ':input (input msg))
))
;//! \htmlinclude Pose-response.msg.html

(cl:defclass <Pose-response> (roslisp-msg-protocol:ros-message)
  ((output
    :reader output
    :initarg :output
    :type unity_msgs-msg:ArmPose
    :initform (cl:make-instance 'unity_msgs-msg:ArmPose)))
)

(cl:defclass Pose-response (<Pose-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Pose-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Pose-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name unity_msgs-srv:<Pose-response> is deprecated: use unity_msgs-srv:Pose-response instead.")))

(cl:ensure-generic-function 'output-val :lambda-list '(m))
(cl:defmethod output-val ((m <Pose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader unity_msgs-srv:output-val is deprecated.  Use unity_msgs-srv:output instead.")
  (output m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Pose-response>) ostream)
  "Serializes a message object of type '<Pose-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'output) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Pose-response>) istream)
  "Deserializes a message object of type '<Pose-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'output) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Pose-response>)))
  "Returns string type for a service object of type '<Pose-response>"
  "unity_msgs/PoseResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Pose-response)))
  "Returns string type for a service object of type 'Pose-response"
  "unity_msgs/PoseResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Pose-response>)))
  "Returns md5sum for a message object of type '<Pose-response>"
  "b83998b949202c6834b3ab9d4bd151b4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Pose-response)))
  "Returns md5sum for a message object of type 'Pose-response"
  "b83998b949202c6834b3ab9d4bd151b4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Pose-response>)))
  "Returns full string definition for message of type '<Pose-response>"
  (cl:format cl:nil "ArmPose output~%~%================================================================================~%MSG: unity_msgs/ArmPose~%float32 q1~%float32 q2~%float32 q3~%float32 d4~%float32 q5~%float32 succ~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Pose-response)))
  "Returns full string definition for message of type 'Pose-response"
  (cl:format cl:nil "ArmPose output~%~%================================================================================~%MSG: unity_msgs/ArmPose~%float32 q1~%float32 q2~%float32 q3~%float32 d4~%float32 q5~%float32 succ~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Pose-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'output))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Pose-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Pose-response
    (cl:cons ':output (output msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Pose)))
  'Pose-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Pose)))
  'Pose-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Pose)))
  "Returns string type for a service object of type '<Pose>"
  "unity_msgs/Pose")