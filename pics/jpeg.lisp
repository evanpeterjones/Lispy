(defpackage :jpeg
    "recognize and load jpeg files")

(in-package :jpeg)

(defparameter *headers* 
    '(SOI APP0 Length Identifier Version Units 
        Xdensity Ydensity XThumbnail Ythumnail))

(defun match-header (head)
    "given list of headers car'd by 'enum'"
    (let (())
        ()))

(defun get-file-as-bytes (file-name)
    "given filename, return list of bytes"
    (with-open-file (stream file-name 
                            :direction :input
                            :if-does-not-exist nil
                            :element-type 'unsigned-byte)
        (if (= (read-byte stream nil))
            

        (if stream
             (lambda (x list) 
               (do ((byte (read-byte stream nil)
	           (read-byte stream nil)))
    	        ((null byte)) collect byte))
             (format t "FILE NOT FOUND"))))

(defun main (fil)
    (match-header (get-file-as-bytes file)))

;; (main "~/Pictures/billi.jpeg") ;; 

()