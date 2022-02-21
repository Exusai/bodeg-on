
(cl:in-package :asdf)

(defsystem "unity_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :unity_msgs-msg
)
  :components ((:file "_package")
    (:file "Imgserv" :depends-on ("_package_Imgserv"))
    (:file "_package_Imgserv" :depends-on ("_package"))
    (:file "Pose" :depends-on ("_package_Pose"))
    (:file "_package_Pose" :depends-on ("_package"))
    (:file "Position" :depends-on ("_package_Position"))
    (:file "_package_Position" :depends-on ("_package"))
  ))