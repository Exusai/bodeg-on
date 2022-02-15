;; Auto-generated. Do not edit!


(when (boundp 'unity_msgs::Position)
  (if (not (find-package "UNITY_MSGS"))
    (make-package "UNITY_MSGS"))
  (shadow 'Position (find-package "UNITY_MSGS")))
(unless (find-package "UNITY_MSGS::POSITION")
  (make-package "UNITY_MSGS::POSITION"))
(unless (find-package "UNITY_MSGS::POSITIONREQUEST")
  (make-package "UNITY_MSGS::POSITIONREQUEST"))
(unless (find-package "UNITY_MSGS::POSITIONRESPONSE")
  (make-package "UNITY_MSGS::POSITIONRESPONSE"))

(in-package "ROS")





(defclass unity_msgs::PositionRequest
  :super ros::object
  :slots (_input ))

(defmethod unity_msgs::PositionRequest
  (:init
   (&key
    ((:input __input) (instance unity_msgs::OrderPickerPosition :init))
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
    ;; unity_msgs/OrderPickerPosition _input
    (send _input :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; unity_msgs/OrderPickerPosition _input
       (send _input :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; unity_msgs/OrderPickerPosition _input
     (send _input :deserialize buf ptr-) (incf ptr- (send _input :serialization-length))
   ;;
   self)
  )

(defclass unity_msgs::PositionResponse
  :super ros::object
  :slots (_output ))

(defmethod unity_msgs::PositionResponse
  (:init
   (&key
    ((:output __output) (instance unity_msgs::OrderPickerPosition :init))
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
    ;; unity_msgs/OrderPickerPosition _output
    (send _output :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; unity_msgs/OrderPickerPosition _output
       (send _output :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; unity_msgs/OrderPickerPosition _output
     (send _output :deserialize buf ptr-) (incf ptr- (send _output :serialization-length))
   ;;
   self)
  )

(defclass unity_msgs::Position
  :super ros::object
  :slots ())

(setf (get unity_msgs::Position :md5sum-) "5190f887b70decc2fafe0ae2939b233a")
(setf (get unity_msgs::Position :datatype-) "unity_msgs/Position")
(setf (get unity_msgs::Position :request) unity_msgs::PositionRequest)
(setf (get unity_msgs::Position :response) unity_msgs::PositionResponse)

(defmethod unity_msgs::PositionRequest
  (:response () (instance unity_msgs::PositionResponse :init)))

(setf (get unity_msgs::PositionRequest :md5sum-) "5190f887b70decc2fafe0ae2939b233a")
(setf (get unity_msgs::PositionRequest :datatype-) "unity_msgs/PositionRequest")
(setf (get unity_msgs::PositionRequest :definition-)
      "OrderPickerPosition input

================================================================================
MSG: unity_msgs/OrderPickerPosition
float32 pos_x
float32 pos_y
float32 pos_z
float32 rot_x
float32 rot_y
float32 rot_z
---
OrderPickerPosition output

================================================================================
MSG: unity_msgs/OrderPickerPosition
float32 pos_x
float32 pos_y
float32 pos_z
float32 rot_x
float32 rot_y
float32 rot_z
")

(setf (get unity_msgs::PositionResponse :md5sum-) "5190f887b70decc2fafe0ae2939b233a")
(setf (get unity_msgs::PositionResponse :datatype-) "unity_msgs/PositionResponse")
(setf (get unity_msgs::PositionResponse :definition-)
      "OrderPickerPosition input

================================================================================
MSG: unity_msgs/OrderPickerPosition
float32 pos_x
float32 pos_y
float32 pos_z
float32 rot_x
float32 rot_y
float32 rot_z
---
OrderPickerPosition output

================================================================================
MSG: unity_msgs/OrderPickerPosition
float32 pos_x
float32 pos_y
float32 pos_z
float32 rot_x
float32 rot_y
float32 rot_z
")



(provide :unity_msgs/Position "5190f887b70decc2fafe0ae2939b233a")


