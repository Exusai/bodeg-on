;; Auto-generated. Do not edit!


(when (boundp 'unity_msgs::OrderPickerVelocity)
  (if (not (find-package "UNITY_MSGS"))
    (make-package "UNITY_MSGS"))
  (shadow 'OrderPickerVelocity (find-package "UNITY_MSGS")))
(unless (find-package "UNITY_MSGS::ORDERPICKERVELOCITY")
  (make-package "UNITY_MSGS::ORDERPICKERVELOCITY"))

(in-package "ROS")
;;//! \htmlinclude OrderPickerVelocity.msg.html


(defclass unity_msgs::OrderPickerVelocity
  :super ros::object
  :slots (_orderPickerSpeed ))

(defmethod unity_msgs::OrderPickerVelocity
  (:init
   (&key
    ((:orderPickerSpeed __orderPickerSpeed) 0.0)
    )
   (send-super :init)
   (setq _orderPickerSpeed (float __orderPickerSpeed))
   self)
  (:orderPickerSpeed
   (&optional __orderPickerSpeed)
   (if __orderPickerSpeed (setq _orderPickerSpeed __orderPickerSpeed)) _orderPickerSpeed)
  (:serialization-length
   ()
   (+
    ;; float32 _orderPickerSpeed
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _orderPickerSpeed
       (sys::poke _orderPickerSpeed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _orderPickerSpeed
     (setq _orderPickerSpeed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get unity_msgs::OrderPickerVelocity :md5sum-) "b771032ad1d53adf5c692218acbd5c7b")
(setf (get unity_msgs::OrderPickerVelocity :datatype-) "unity_msgs/OrderPickerVelocity")
(setf (get unity_msgs::OrderPickerVelocity :definition-)
      "float32 orderPickerSpeed
")



(provide :unity_msgs/OrderPickerVelocity "b771032ad1d53adf5c692218acbd5c7b")


