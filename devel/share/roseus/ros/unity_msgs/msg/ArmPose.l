;; Auto-generated. Do not edit!


(when (boundp 'unity_msgs::ArmPose)
  (if (not (find-package "UNITY_MSGS"))
    (make-package "UNITY_MSGS"))
  (shadow 'ArmPose (find-package "UNITY_MSGS")))
(unless (find-package "UNITY_MSGS::ARMPOSE")
  (make-package "UNITY_MSGS::ARMPOSE"))

(in-package "ROS")
;;//! \htmlinclude ArmPose.msg.html


(defclass unity_msgs::ArmPose
  :super ros::object
  :slots (_q1 _q2 _q3 _d4 _q5 _succ ))

(defmethod unity_msgs::ArmPose
  (:init
   (&key
    ((:q1 __q1) 0.0)
    ((:q2 __q2) 0.0)
    ((:q3 __q3) 0.0)
    ((:d4 __d4) 0.0)
    ((:q5 __q5) 0.0)
    ((:succ __succ) 0.0)
    )
   (send-super :init)
   (setq _q1 (float __q1))
   (setq _q2 (float __q2))
   (setq _q3 (float __q3))
   (setq _d4 (float __d4))
   (setq _q5 (float __q5))
   (setq _succ (float __succ))
   self)
  (:q1
   (&optional __q1)
   (if __q1 (setq _q1 __q1)) _q1)
  (:q2
   (&optional __q2)
   (if __q2 (setq _q2 __q2)) _q2)
  (:q3
   (&optional __q3)
   (if __q3 (setq _q3 __q3)) _q3)
  (:d4
   (&optional __d4)
   (if __d4 (setq _d4 __d4)) _d4)
  (:q5
   (&optional __q5)
   (if __q5 (setq _q5 __q5)) _q5)
  (:succ
   (&optional __succ)
   (if __succ (setq _succ __succ)) _succ)
  (:serialization-length
   ()
   (+
    ;; float32 _q1
    4
    ;; float32 _q2
    4
    ;; float32 _q3
    4
    ;; float32 _d4
    4
    ;; float32 _q5
    4
    ;; float32 _succ
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _q1
       (sys::poke _q1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _q2
       (sys::poke _q2 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _q3
       (sys::poke _q3 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _d4
       (sys::poke _d4 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _q5
       (sys::poke _q5 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _succ
       (sys::poke _succ (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _q1
     (setq _q1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _q2
     (setq _q2 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _q3
     (setq _q3 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _d4
     (setq _d4 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _q5
     (setq _q5 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _succ
     (setq _succ (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get unity_msgs::ArmPose :md5sum-) "ffea4f3e3644005bdf0b21e3a7766cb5")
(setf (get unity_msgs::ArmPose :datatype-) "unity_msgs/ArmPose")
(setf (get unity_msgs::ArmPose :definition-)
      "float32 q1
float32 q2
float32 q3
float32 d4
float32 q5
float32 succ
")



(provide :unity_msgs/ArmPose "ffea4f3e3644005bdf0b21e3a7766cb5")


