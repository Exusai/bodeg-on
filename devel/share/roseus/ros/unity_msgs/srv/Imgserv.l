;; Auto-generated. Do not edit!


(when (boundp 'unity_msgs::Imgserv)
  (if (not (find-package "UNITY_MSGS"))
    (make-package "UNITY_MSGS"))
  (shadow 'Imgserv (find-package "UNITY_MSGS")))
(unless (find-package "UNITY_MSGS::IMGSERV")
  (make-package "UNITY_MSGS::IMGSERV"))
(unless (find-package "UNITY_MSGS::IMGSERVREQUEST")
  (make-package "UNITY_MSGS::IMGSERVREQUEST"))
(unless (find-package "UNITY_MSGS::IMGSERVRESPONSE")
  (make-package "UNITY_MSGS::IMGSERVRESPONSE"))

(in-package "ROS")





(defclass unity_msgs::ImgservRequest
  :super ros::object
  :slots (_input ))

(defmethod unity_msgs::ImgservRequest
  (:init
   (&key
    ((:input __input) (instance unity_msgs::CamImgs :init))
    )
   (send-super :init)
   (setq _input __input)
   self)
  (:input
   (&rest __input)
   (if (keywordp (car __input))
       (send* _input __input)
     (progn
       (if __input (setq _input (car __input)))
       _input)))
  (:serialization-length
   ()
   (+
    ;; unity_msgs/CamImgs _input
    (send _input :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; unity_msgs/CamImgs _input
       (send _input :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; unity_msgs/CamImgs _input
     (send _input :deserialize buf ptr-) (incf ptr- (send _input :serialization-length))
   ;;
   self)
  )

(defclass unity_msgs::ImgservResponse
  :super ros::object
  :slots (_output ))

(defmethod unity_msgs::ImgservResponse
  (:init
   (&key
    ((:output __output) (instance unity_msgs::CamImgs :init))
    )
   (send-super :init)
   (setq _output __output)
   self)
  (:output
   (&rest __output)
   (if (keywordp (car __output))
       (send* _output __output)
     (progn
       (if __output (setq _output (car __output)))
       _output)))
  (:serialization-length
   ()
   (+
    ;; unity_msgs/CamImgs _output
    (send _output :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; unity_msgs/CamImgs _output
       (send _output :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; unity_msgs/CamImgs _output
     (send _output :deserialize buf ptr-) (incf ptr- (send _output :serialization-length))
   ;;
   self)
  )

(defclass unity_msgs::Imgserv
  :super ros::object
  :slots ())

(setf (get unity_msgs::Imgserv :md5sum-) "2756544b56553ab47e7b3ef7356d02a3")
(setf (get unity_msgs::Imgserv :datatype-) "unity_msgs/Imgserv")
(setf (get unity_msgs::Imgserv :request) unity_msgs::ImgservRequest)
(setf (get unity_msgs::Imgserv :response) unity_msgs::ImgservResponse)

(defmethod unity_msgs::ImgservRequest
  (:response () (instance unity_msgs::ImgservResponse :init)))

(setf (get unity_msgs::ImgservRequest :md5sum-) "2756544b56553ab47e7b3ef7356d02a3")
(setf (get unity_msgs::ImgservRequest :datatype-) "unity_msgs/ImgservRequest")
(setf (get unity_msgs::ImgservRequest :definition-)
      "CamImgs input

================================================================================
MSG: unity_msgs/CamImgs
Header header
string format
uint8[] data
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id
---
CamImgs output

================================================================================
MSG: unity_msgs/CamImgs
Header header
string format
uint8[] data
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id
")

(setf (get unity_msgs::ImgservResponse :md5sum-) "2756544b56553ab47e7b3ef7356d02a3")
(setf (get unity_msgs::ImgservResponse :datatype-) "unity_msgs/ImgservResponse")
(setf (get unity_msgs::ImgservResponse :definition-)
      "CamImgs input

================================================================================
MSG: unity_msgs/CamImgs
Header header
string format
uint8[] data
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id
---
CamImgs output

================================================================================
MSG: unity_msgs/CamImgs
Header header
string format
uint8[] data
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id
")



(provide :unity_msgs/Imgserv "2756544b56553ab47e7b3ef7356d02a3")


