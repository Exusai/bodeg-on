;; Auto-generated. Do not edit!


(when (boundp 'unity_msgs::OrderPickerCameraRotation)
  (if (not (find-package "UNITY_MSGS"))
    (make-package "UNITY_MSGS"))
  (shadow 'OrderPickerCameraRotation (find-package "UNITY_MSGS")))
(unless (find-package "UNITY_MSGS::ORDERPICKERCAMERAROTATION")
  (make-package "UNITY_MSGS::ORDERPICKERCAMERAROTATION"))

(in-package "ROS")
;;//! \htmlinclude OrderPickerCameraRotation.msg.html


(defclass unity_msgs::OrderPickerCameraRotation
  :super ros::object
  :slots (_orderPickerCameraRotation ))

(defmethod unity_msgs::OrderPickerCameraRotation
  (:init
   (&key
    ((:orderPickerCameraRotation __orderPickerCameraRotation) 0.0)
    )
   (send-super :init)
   (setq _orderPickerCameraRotation (float __orderPickerCameraRotation))
   self)
  (:orderPickerCameraRotation
   (&optional __orderPickerCameraRotation)
   (if __orderPickerCameraRotation (setq _orderPickerCameraRotation __orderPickerCameraRotation)) _orderPickerCameraRotation)
  (:serialization-length
   ()
   (+
    ;; float32 _orderPickerCameraRotation
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _orderPickerCameraRotation
       (sys::poke _orderPickerCameraRotation (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _orderPickerCameraRotation
     (setq _orderPickerCameraRotation (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get unity_msgs::OrderPickerCameraRotation :md5sum-) "d0b74d1f759a1fb713ba4af444bedb4b")
(setf (get unity_msgs::OrderPickerCameraRotation :datatype-) "unity_msgs/OrderPickerCameraRotation")
(setf (get unity_msgs::OrderPickerCameraRotation :definition-)
      "float32 orderPickerCameraRotation
")



(provide :unity_msgs/OrderPickerCameraRotation "d0b74d1f759a1fb713ba4af444bedb4b")


