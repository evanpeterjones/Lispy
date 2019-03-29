(ql:quickload '(:dexador :plump) :silent t)

(defpackage :fun
  (:use :dexador :common-lisp))

(defun get-page (url)
  (let ((val (dex:get url)))
    (plump:parse val)))

(get-page "https://reddit.com/robots.txt")
