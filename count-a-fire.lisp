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
  (let ((head (first s-list)))
    (cond ((char-equal char head) (rest s-list))
          (t (cons head (remove-char (rest s-list)))))))

(defun update-count (char arr)
  "increase character count"
  (loop for list in arr do
        (remove-char char list) ()))

(defun insert (character list s-list)
  "insert into hash-table and sorted-list"
  (if (is-alpha character)
      (update-count character s-list)
    nil))

(defun file-load (fil)
  (let ((file-exists (probe-file fil))
        (file-list '()))
    (if file-exists
        (with-open-file (stream fil)
                        (do ((char (read-char stream nil)
                                   (read-char stream nil)))
                            ((null char))
                          (append char file-list)))
      (format (not file-exists) "File not found"))))

(defun main (file)
  "call methods to loop back through hashtable and print most common values"
  (file-load file))

(main "to-build-a-fire.txt")
