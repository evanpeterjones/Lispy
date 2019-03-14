;; Evan Jones - program for my bro

;; Takes a text file, in this case, To Build a Fire by Jack London
;; and reads it into a hashmap to count character frequencies
;; in the end will display the 5 most frequent characters in the story
;; which should spell out "E T H A N"

;; (defvar *table* nil)

;;(defvar number-of-characters 0)

;;(defvar arr (make-array '(26)))

;;(let ((in-file (open file :if-does-not-exist nil)))
;;  (when in-file
;;    (
;;(with-open-file (in file)
;;  (map ' #'(lambda (x)
;;		   (char 
(defvar number-of-characters 0)
(defvar arr (make-array '(26)))
(defvar file "~/Documents/lisp/to-build-a-fire.txt")

(with-open-file (stream file)
  (let ((content (make-string (file-length stream))))
    (read-sequence contents stream)
    (print content)
    content))



(defun load-file (file size)
  "create a hashtable keyed by characters in a file to count occurrences"
  (let ((*table* (make-hash-table :size size)))
    (with-open-file (in file)
		    (loop for word = (read-char in nil) while word do
			  (if (gethash word *table*)
			      (setf (gethash word *table*) (+ 1 (gethash word *table*)))
			    (setf (gethash word *table*) 1))
			  (setf number-of-characters (+ 1 number-of-characters)))) *table*))

(defun main (file)
  (setf *table* (load-file file 128))
  ;; call methods to loop back through hashtable and print most common values
  (print number-of-characters))

(main "to-build-a-fire.txt")


