(ql:quickload '(:hunchentoot :CL-WHO :PARENSCRIPT))

(DEFPACKAGE :MESS
  (:USE :CL :CL-WHO :HUNCHENTOOT :PARENSCRIPT))

(in-package :hunchentoot)

(start (make-instance 'easy-acceptor :port 4242))

(defparameter urls '(doing-stuff ((gmail . "https://www.gmail.com")
                                  (keep . "https://www.keep.google.com")
                                  (asulearn . "https://www.asulearn.appstate.edu/")
                                  (github . "https://www.github.com/evanpeterjones")
                                  (blogger . "https://www.blogger.google.com"))
                                 video ((youtube . "https://www.youtube.com")
                                        (admit-me . "https://www.admitme.tv")
                                        (netflix . "https://www.netflix.com")
                                        (hulu . "https://www.hulu.com"))
                                 browsing ((reddit . "https://www.reddit.com")
                                           (twitter. "https://www.twitter.com/")
                                           (tumblr . "https://www.tumblr.com")
                                           (wikipedia . "https://www.wikipedia.org"))))

(defun get-html ()
  (format nil "<!DOCTYPE html><html><h1>WELCOME</h1></html>"))

(defun get-string (param)
  (format nil "welcome ~A" param))

(define-easy-handler (welcome :uri "/") (param)
  (cond
   (param (setf (content-type*) "text/plain")
          (get-string param))
   (t (setf (content-type*) "text/html")
      (get-html))))
