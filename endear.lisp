(defpackage :little-endian
  (:use :common-lisp))

(in-package :little-endian)

;;; this cannot be the way to do this
(ps-html ((:a :href "foobar") "bork"))

(defparameter *html-tags* '((html)(head)(title)(body)
			    (b)(h)(ul)(li)(br)(p)(img)(a)))

(defun make-tag (tag)
  (cons `(<,(tag)>) `(</,(tag)>)))

(defun create-html-element (line tag-type)
  (let ((tag (make-tag tag-type)))))

(defun get-page-content (filename)
  (with-open-file (stream filename)
    (loop for line = (read-line stream nil)
       while line
	 (collect line))))

(defun create-html (file)
  (let ((page (get-page-content file)))
    (mapcar #'create-html-element (page))))

(defvar a (get-page-content "lispy/blogpost"))
