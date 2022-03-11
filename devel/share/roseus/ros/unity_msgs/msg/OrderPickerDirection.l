;; Auto-generated. Do not edit!


(when (boundp 'unity_msgs::OrderPickerDirection)
  (if (not (find-package "UNITY_MSGS"))
    (make-package "UNITY_MSGS"))
  (shadow 'OrderPickerDirection (find-package "UNITY_MSGS")))
(unless (find-package "UNITY_MSGS::ORDERPICKERDIRECTION")
  (make-package "UNITY_MSGS::ORDERPICKERDIRECTION"))

(in-package "ROS")
;;//! \htmlinclude OrderPickerDirection.msg.html


(defclass unity_msgs::OrderPickerDirection
  :super ros::object
  :slots (_orderPickerDirection ))

(defmethod unity_msgs::OrderPickerDirection
  (:init
   (&key
    ((:orderPickerDirection __orderPickerDirection) 0.0)
    )
   (send-super :init)
   (setq _orderPickerDirection (float __orderPickerDirection))
   self)
  (:orderPickerDirection
   (&optional __orderPickerDirection)
   (if __orderPickerDirection (setq _orderPickerDirection __orderPickerDirection)) _orderPickerDirection)
  (:serialization-length
   ()
   (+
    ;; float32 _orderPickerDirection
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _orderPickerDirection
       (sys::poke _orderPickerDirection (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _orderPickerDirection
     (setq _orderPickerDirection (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get unity_msgs::OrderPickerDirection :md5sum-) "83553efb863f0e36f94f0d60ee9c10ce")
(setf (get unity_msgs::OrderPickerDirection :datatype-) "unity_msgs/OrderPickerDirection")
(setf (get unity_msgs::OrderPickerDirection :definition-)
      "float32 orderPickerDirection
")



(provide :unity_msgs/OrderPickerDirection "83553efb863f0e36f94f0d60ee9c10ce")


