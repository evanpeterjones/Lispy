#!/usr/bin/sbcl --script

;; Evan Jones - program for my bro

;; Takes a text file, in this case, To Build a Fire by Jack London
;; and reads it into a hashmap to count character frequencies
;; in the end will display the 5 most frequent characters in the story
;; which coincidentally spell out "E T H A N"

(defpackage :count-a-fire
  (:use :cl))

(defun count-char (stream character)
  "count the number of characters in a file"
  (let ((cased-char (string-upcase character))
        (count 0))
    (if stream
        (loop for curr-char = (read-char stream nil :eof)
           until (eq curr-char :eof)
           do (if (string= (string-upcase curr-char) cased-char) 
                  (setq count (+ 1 count))))) count))

(defun append-count (count-list character count)
  "recursively create a sorted list with the given character and count"
  (let ((head (first count-list))
        (tail (rest count-list)))
    (if (and head (< count (second head)))        
        (cons head (append-count tail character count))
        (cons `(,character ,count) count-list))))

(defun file-load (fil)
  "load the alpha characters of a file into a list"
  (let ((character-counts nil))
    (loop for char from 65 to 90
       do (with-open-file (stream fil)
            (setq character-counts (append-count character-counts (code-char char) (count-char stream (code-char char)))))) character-counts))

(progn
  (defvar data nil "a variable to hold our data")
  (format t "~%~%Attempting to run file-load function~%")
  (format t "Total, collected ~D points~%" (length  (setq data (file-load "fire.txt"))))
  (format t "Successfully ran file-load function~%")
  (format t "Top 5 Occuring Characters: ~E~E~E~E~E~% ~%:)" 
          (first (first data))
          (first (second data))
          (first (third data))
          (first (fourth data))
          (first (fifth data))))
