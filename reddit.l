(ql:quickload '(:cl-reddit))

(defpackage :reddit
  (:use :common-lisp :cl-reddit))

(in-package :cl-reddit)

(let ((user (get-user "strranger101")))
  (dexador))
