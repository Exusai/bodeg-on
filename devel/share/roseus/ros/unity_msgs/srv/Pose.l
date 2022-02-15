;; Auto-generated. Do not edit!


(when (boundp 'unity_msgs::Pose)
  (if (not (find-package "UNITY_MSGS"))
    (make-package "UNITY_MSGS"))
  (shadow 'Pose (find-package "UNITY_MSGS")))
(unless (find-package "UNITY_MSGS::POSE")
  (make-package "UNITY_MSGS::POSE"))
(unless (find-package "UNITY_MSGS::POSEREQUEST")
  (make-package "UNITY_MSGS::POSEREQUEST"))
(unless (find-package "UNITY_MSGS::POSERESPONSE")
  (make-package "UNITY_MSGS::POSERESPONSE"))

(in-package "ROS")





(defclass unity_msgs::PoseRequest
  :super ros::object
  :slots (_input ))

(defmethod unity_msgs::PoseRequest
  (:init
   (&key
    ((:input __input) (instance unity_msgs::ArmPose :init))
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
    ;; unity_msgs/ArmPose _input
    (send _input :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; unity_msgs/ArmPose _input
       (send _input :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; unity_msgs/ArmPose _input
     (send _input :deserialize buf ptr-) (incf ptr- (send _input :serialization-length))
   ;;
   self)
  )

(defclass unity_msgs::PoseResponse
  :super ros::object
  :slots (_output ))

(defmethod unity_msgs::PoseResponse
  (:init
   (&key
    ((:output __output) (instance unity_msgs::ArmPose :init))
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
    ;; unity_msgs/ArmPose _output
    (send _output :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; unity_msgs/ArmPose _output
       (send _output :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; unity_msgs/ArmPose _output
     (send _output :deserialize buf ptr-) (incf ptr- (send _output :serialization-length))
   ;;
   self)
  )

(defclass unity_msgs::Pose
  :super ros::object
  :slots ())

(setf (get unity_msgs::Pose :md5sum-) "b83998b949202c6834b3ab9d4bd151b4")
(setf (get unity_msgs::Pose :datatype-) "unity_msgs/Pose")
(setf (get unity_msgs::Pose :request) unity_msgs::PoseRequest)
(setf (get unity_msgs::Pose :response) unity_msgs::PoseResponse)

(defmethod unity_msgs::PoseRequest
  (:response () (instance unity_msgs::PoseResponse :init)))

(setf (get unity_msgs::PoseRequest :md5sum-) "b83998b949202c6834b3ab9d4bd151b4")
(setf (get unity_msgs::PoseRequest :datatype-) "unity_msgs/PoseRequest")
(setf (get unity_msgs::PoseRequest :definition-)
      "ArmPose input

================================================================================
MSG: unity_msgs/ArmPose
float32 q1
float32 q2
float32 q3
float32 d4
float32 q5
---
ArmPose output

================================================================================
MSG: unity_msgs/ArmPose
float32 q1
float32 q2
float32 q3
float32 d4
float32 q5
")

(setf (get unity_msgs::PoseResponse :md5sum-) "b83998b949202c6834b3ab9d4bd151b4")
(setf (get unity_msgs::PoseResponse :datatype-) "unity_msgs/PoseResponse")
(setf (get unity_msgs::PoseResponse :definition-)
      "ArmPose input

================================================================================
MSG: unity_msgs/ArmPose
float32 q1
float32 q2
float32 q3
float32 d4
float32 q5
---
ArmPose output

================================================================================
MSG: unity_msgs/ArmPose
float32 q1
float32 q2
float32 q3
float32 d4
float32 q5
")



(provide :unity_msgs/Pose "b83998b949202c6834b3ab9d4bd151b4")


