(load "~/quicklisp/setup.lisp")

(ql:quickload :woo)

(woo:run
 (lambda (env)
   (declare (ignore env))
   '(200 (:content-type "text/plain")
	 ("Hello, World!"))))

