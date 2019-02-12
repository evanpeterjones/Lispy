(defclass test ()
  ((fname :initarg :fname)
   (lname :initarg :lname))
  (:documentation "this is a test class"))

(defvar b (make-instance 'test
	       :fname "Evan"
	       :lname "Jones"))


(defvar a (make-instance 'test
		      :fname "mr."
		      :lname "face"))

(defun get-name ()
  (car (list "dumb" "list")))

(print (cddr '(lisp evaluation test)))
(print (car (list lisp evaluation test)))
