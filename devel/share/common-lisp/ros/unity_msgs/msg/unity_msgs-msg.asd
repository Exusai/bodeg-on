
(cl:in-package :asdf)

(defsystem "unity_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ArmPose" :depends-on ("_package_ArmPose"))
    (:file "_package_ArmPose" :depends-on ("_package"))
    (:file "OrderPickerPosition" :depends-on ("_package_OrderPickerPosition"))
    (:file "_package_OrderPickerPosition" :depends-on ("_package"))
  ))