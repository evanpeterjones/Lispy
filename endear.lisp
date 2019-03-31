(ql:quickload :parenscript)

(defpackage #:endear
  (:use :common-lisp :parenscript))
(in-package #:endear)

(ps-html ((:a :href "foobar") "bork"))

