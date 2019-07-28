(ql:quickload :woo)

(defpackage cap-server
  (:use :woo))

(defun run ()
  (woo:run
   (lambda (env)
     (declare (ignore env))
     '(200 (:content-type "text/plain")
	   ("Hello, World!")))))

