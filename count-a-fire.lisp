;; Evan Jones - program for my bro

;; Takes a text file, in this case, To Build a Fire by Jack London
;; and reads it into a hashmap to count character frequencies
;; in the end will display the 5 most frequent characters in the story
;; which should spell out "E T H A N"

(defpackage :count-a-fire)

(defun file-load (fil)
  "load the alpha characters of a file into a list"
  (let ((file-exists (probe-file fil))
	(file-list '()))
    (if file-exists
	(with-open-file (stream fil
				:direction :input)
			(do ((char (read-char stream nil)
				   (read-char stream nil)))
			    ((null char))
			    (cons char file-list)))
      (format (not file-exists) "File not found~%"))))

(progn
  (format t "~%~%Attempting to run file-load function~%")
  (format t "~D~%" (length (file-load "fire.txt")))
;;  (format t "~A" (read-char (open "to-build-a-fire.txt")))
  (format t "Successfully ran file-load function~%"))
