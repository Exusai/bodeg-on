
(cl:in-package :asdf)

(defsystem "unity_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "ArmPose" :depends-on ("_package_ArmPose"))
    (:file "_package_ArmPose" :depends-on ("_package"))
    (:file "ArmTarget" :depends-on ("_package_ArmTarget"))
    (:file "_package_ArmTarget" :depends-on ("_package"))
    (:file "CamImgs" :depends-on ("_package_CamImgs"))
    (:file "_package_CamImgs" :depends-on ("_package"))
    (:file "OrderPickerCameraRotation" :depends-on ("_package_OrderPickerCameraRotation"))
    (:file "_package_OrderPickerCameraRotation" :depends-on ("_package"))
    (:file "OrderPickerDirection" :depends-on ("_package_OrderPickerDirection"))
    (:file "_package_OrderPickerDirection" :depends-on ("_package"))
    (:file "OrderPickerLifter" :depends-on ("_package_OrderPickerLifter"))
    (:file "_package_OrderPickerLifter" :depends-on ("_package"))
    (:file "OrderPickerPosition" :depends-on ("_package_OrderPickerPosition"))
    (:file "_package_OrderPickerPosition" :depends-on ("_package"))
    (:file "OrderPickerVelocity" :depends-on ("_package_OrderPickerVelocity"))
    (:file "_package_OrderPickerVelocity" :depends-on ("_package"))
  ))