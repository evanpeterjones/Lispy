(defun make-record (ti a ra ri)
  (list :title ti :artist a :rating ra :ripped ri))

(defvar *db* nil)

(defun add-record (cd)
  (push cd *db*))

(add-record (make-record "Mylo Xyloto" "Coldplay" 8 t))
(add-record (make-record "El Camino" "The Black Keys" 10 t))

(defun dump-db ()
  (dolist (cd *db*)
    (format t "~{~a:~10t~a~%~}~%" cd)))

(dump-db)

