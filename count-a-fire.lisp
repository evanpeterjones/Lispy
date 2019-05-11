;; Evan Jones - program for my bro

;; Takes a text file, in this case, To Build a Fire by Jack London
;; and reads it into a hashmap to count character frequencies
;; in the end will display the 5 most frequent characters in the story
;; which should spell out "E T H A N"

(ql:quickload :cl-ppcre)
(defpackage :count-a-fire
  (:use :cl-ppcre))

(defparameter *number-of-characters* 0)

(defun is-alpha (ch)
  "regex scanner, returns true if string is only alpha characters"
  (let ((ptrn (cl-ppcre:create-scanner "(a-zA-Z)*")))
    (cl-ppcre:scan ptrn ch)))

(defun remove-char (char s-list)
  "given a list, traverse and remove a character"
  (let ((head (car s-list)))
    (cond ((char-equal char head) (cdr s-list))
	  (t (cons head (remove-char cdr s-list))))))

(defun update-list-arr (char arr)
  "increase character count"
  (loop for list in arr do 
    (cond 
      ((remove-char char list) (

(defun insert (character list s-list)
  "insert into hash-table and sorted-list"
  (cond (gethash character list)
	((setf (gethash character list)                         ; update hashmap
	       (+ 1 (gethash character list)))                  
	((setf (gethash character list) 1)                      ; insert init into hashmap
	 (cons character s-list))))                             ; insert init in sorted list

(defun file-load (fil)
  (with-open-file (stream fil)
    (do ((char (read-char stream nil)
	       (read-char stream nil)))
	((null char))
     collect char)))

(defun main (file)
  "call methods to loop back through hashtable and print most common values"
    (file-load file))

(main "to-build-a-fire.txt")
