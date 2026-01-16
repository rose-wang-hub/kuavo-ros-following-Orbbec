
(cl:in-package :asdf)

(defsystem "kuavo_person_follow-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "PersonState" :depends-on ("_package_PersonState"))
    (:file "_package_PersonState" :depends-on ("_package"))
  ))