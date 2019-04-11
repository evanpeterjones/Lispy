(ql:quickload "restas")

(restas:define-module #:serve
		      (:use :cl :restas))

(in-package #:serve)

(define-route serve ("")
  "Hello World")

(start '#:serve :port 8080)
