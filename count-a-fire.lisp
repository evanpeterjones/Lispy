;; Evan Jones - program for my bro

;; Takes a text file, in this case, To Build a Fire by Jack London
;; and reads it into a hashmap to count character frequencies
;; in the end will display the 5 most frequent characters in the story
;; which should spell out "E T H A N"

(ql:quickload :cl-ppcre)
(defpackage :count-a-fire
  (:use :cl-ppcre))

(in-package :cl-ppcre)

(defparameter number-of-characters 0)
(defparameter file "~/Documents/lisp/to-build-a-fire.txt")

(defun is-alpha (ch)
  "simple regex scanner, returns true if string is only alpha characters"
  (let ((ptrn (create-scanner "(a-zA-Z)*")))
    (scan ptrn ch)))

(defun file-read (f size)
  (let ((arr (make-array size :type 'integer)))
    (with-open-file (stream f)
		    (loop for line = (read-line stream nil)
			  while line
			  ()))))

(defun main (file)
  "call methods to loop back through hashtable and print most common values"
  ;;(defvar *table* (load-file-to-array file 256))
  ;;(print number-of-characters))
  (if (is-alpha "a")
      ()
      nil)

(main "to-build-a-fire.txt")


