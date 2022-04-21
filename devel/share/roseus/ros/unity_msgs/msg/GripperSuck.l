;; Auto-generated. Do not edit!


(when (boundp 'unity_msgs::GripperSuck)
  (if (not (find-package "UNITY_MSGS"))
    (make-package "UNITY_MSGS"))
  (shadow 'GripperSuck (find-package "UNITY_MSGS")))
(unless (find-package "UNITY_MSGS::GRIPPERSUCK")
  (make-package "UNITY_MSGS::GRIPPERSUCK"))

(in-package "ROS")
;;//! \htmlinclude GripperSuck.msg.html


(defclass unity_msgs::GripperSuck
  :super ros::object
  :slots (_suck ))

(defmethod unity_msgs::GripperSuck
  (:init
   (&key
    ((:suck __suck) 0.0)
    )
   (send-super :init)
   (setq _suck (float __suck))
   self)
  (:suck
   (&optional __suck)
   (if __suck (setq _suck __suck)) _suck)
  (:serialization-length
   ()
   (+
    ;; float32 _suck
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _suck
       (sys::poke _suck (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _suck
     (setq _suck (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get unity_msgs::GripperSuck :md5sum-) "99e58236a92fed374f4db00fc52a88ea")
(setf (get unity_msgs::GripperSuck :datatype-) "unity_msgs/GripperSuck")
(setf (get unity_msgs::GripperSuck :definition-)
      "float32 suck
")



(provide :unity_msgs/GripperSuck "99e58236a92fed374f4db00fc52a88ea")


