;; Auto-generated. Do not edit!


(when (boundp 'unity_msgs::OrderPickerLifter)
  (if (not (find-package "UNITY_MSGS"))
    (make-package "UNITY_MSGS"))
  (shadow 'OrderPickerLifter (find-package "UNITY_MSGS")))
(unless (find-package "UNITY_MSGS::ORDERPICKERLIFTER")
  (make-package "UNITY_MSGS::ORDERPICKERLIFTER"))

(in-package "ROS")
;;//! \htmlinclude OrderPickerLifter.msg.html


(defclass unity_msgs::OrderPickerLifter
  :super ros::object
  :slots (_lifterHeight ))

(defmethod unity_msgs::OrderPickerLifter
  (:init
   (&key
    ((:lifterHeight __lifterHeight) 0.0)
    )
   (send-super :init)
   (setq _lifterHeight (float __lifterHeight))
   self)
  (:lifterHeight
   (&optional __lifterHeight)
   (if __lifterHeight (setq _lifterHeight __lifterHeight)) _lifterHeight)
  (:serialization-length
   ()
   (+
    ;; float32 _lifterHeight
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _lifterHeight
       (sys::poke _lifterHeight (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _lifterHeight
     (setq _lifterHeight (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get unity_msgs::OrderPickerLifter :md5sum-) "6763d9c3a4d73a57831d19dcb37daf6a")
(setf (get unity_msgs::OrderPickerLifter :datatype-) "unity_msgs/OrderPickerLifter")
(setf (get unity_msgs::OrderPickerLifter :definition-)
      "float32 lifterHeight
")



(provide :unity_msgs/OrderPickerLifter "6763d9c3a4d73a57831d19dcb37daf6a")


