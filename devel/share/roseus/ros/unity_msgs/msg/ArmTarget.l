;; Auto-generated. Do not edit!


(when (boundp 'unity_msgs::ArmTarget)
  (if (not (find-package "UNITY_MSGS"))
    (make-package "UNITY_MSGS"))
  (shadow 'ArmTarget (find-package "UNITY_MSGS")))
(unless (find-package "UNITY_MSGS::ARMTARGET")
  (make-package "UNITY_MSGS::ARMTARGET"))

(in-package "ROS")
;;//! \htmlinclude ArmTarget.msg.html


(defclass unity_msgs::ArmTarget
  :super ros::object
  :slots (_xTarget _yTarget _zTarget _grabAngle ))

(defmethod unity_msgs::ArmTarget
  (:init
   (&key
    ((:xTarget __xTarget) 0.0)
    ((:yTarget __yTarget) 0.0)
    ((:zTarget __zTarget) 0.0)
    ((:grabAngle __grabAngle) 0.0)
    )
   (send-super :init)
   (setq _xTarget (float __xTarget))
   (setq _yTarget (float __yTarget))
   (setq _zTarget (float __zTarget))
   (setq _grabAngle (float __grabAngle))
   self)
  (:xTarget
   (&optional __xTarget)
   (if __xTarget (setq _xTarget __xTarget)) _xTarget)
  (:yTarget
   (&optional __yTarget)
   (if __yTarget (setq _yTarget __yTarget)) _yTarget)
  (:zTarget
   (&optional __zTarget)
   (if __zTarget (setq _zTarget __zTarget)) _zTarget)
  (:grabAngle
   (&optional __grabAngle)
   (if __grabAngle (setq _grabAngle __grabAngle)) _grabAngle)
  (:serialization-length
   ()
   (+
    ;; float32 _xTarget
    4
    ;; float32 _yTarget
    4
    ;; float32 _zTarget
    4
    ;; float32 _grabAngle
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _xTarget
       (sys::poke _xTarget (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yTarget
       (sys::poke _yTarget (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _zTarget
       (sys::poke _zTarget (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _grabAngle
       (sys::poke _grabAngle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _xTarget
     (setq _xTarget (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yTarget
     (setq _yTarget (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _zTarget
     (setq _zTarget (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _grabAngle
     (setq _grabAngle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get unity_msgs::ArmTarget :md5sum-) "5bd81dd8154876a58e80e524a6eefe6e")
(setf (get unity_msgs::ArmTarget :datatype-) "unity_msgs/ArmTarget")
(setf (get unity_msgs::ArmTarget :definition-)
      "float32 xTarget
float32 yTarget
float32 zTarget
float32 grabAngle
")



(provide :unity_msgs/ArmTarget "5bd81dd8154876a58e80e524a6eefe6e")


