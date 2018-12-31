(defun write-file (file value)
  (with-open-file (str file
		  :direction :output
		  :if-does-not-exist :create
		  :if-exists :append)
  (format str value)))

(write-file "~/Desktop/test.txt" "THIS IS A TEST FILE WRITTEN IN COMMON LISP")

(defun test(value) (format t (concatenate 'string "test " value)))

;;(test "value")

(load "quicklisp.lisp")
