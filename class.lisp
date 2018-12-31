(defclass test ()
  ((fname :initarg :fname)
   (lname :initarg :lname))
  (:documentation "this is a test class"))

(defvar b (make-instance 'test
	       :fname "Evan"
	       :lname "Jones"))


(defvar a (make-instance 'test
		      :fname "shit"
		      :lname "face"))

(defun get-name (value)
  (list (

(print 
