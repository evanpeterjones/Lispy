(ql:quickload '(:dexador :plump) :silent t)

(defpackage page-pull
  (:use :common-lisp))

(defun get-page (url)
  (let ((val (dex:get url)))
    (plump:parse val)))

(get-page "https://reddit.com/robots.txt")

(defvar head (stream)
  (dotimes (0 10) 
