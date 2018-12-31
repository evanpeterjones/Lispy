;; Evan Jones - program for my bro

;; Takes a text file, in this case, To Build a Fire by Jack London
;; and reads it into a hashmap to count character frequencies
;; in the end will display the 5 most frequent characters in the story
;; which should spell out "E T H A N"

(defvar *table* nil)

(defun main (file)
  (setf *table (load-file file 128)))
  ;; call methods to loop back through hashtable

(defun load-file (file size)
  "create a hashtable keyed by characters in a file to count occurrences"
  (let ((*table* (make-hash-table :test #'eql :size size)))
    (with-open-file (in file)
		    (loop for word = (read-char in nil) while word do
			  (cond (*table*)
				(setf (gethash word *table*) 1)	
				(setf (gethash word *table*) (+ 1 (gethash word *table*))))))
    *table*))

;;(print (gethash 'c' *table*))

(defun print-db ()
  (dolist (cd *table*)
    (format t "~{~a:~10t~a~%~}~%" cd)))

(main "to-build-a-fire.txt")
