(ql:quickload '(:dexador :plump :lquery) :silent t)

(defpackage :pie
  (:use :common-lisp))

(defparameter *url* "http://nuforc.org/webreports/")
(defparameter *dir* '("ndxshape"))

;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; scraping functions ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun all-urls (url dirs)
  "converts uri directories into complete urls"
  (loop for u in dirs
     collect (concatenate 'string url u ".html")))

(defun parse-url (url)
  "Parse HTTP request response to PLUMP:DOM objects"
  (let ((response (dex:get url)))
    (plump:parse response)))

(defun collect-pages (url dirs)
  "return a list of html strings"
  (let ((pg (all-urls url dirs)))
    (mapcar #'parse-url pg)))

;;;;;;;;;;;;;;;;;;;;;;;;;
;;; parsing functions ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;

(defun collect-table-data (data which sub)
  (let ((header (lquery:$ data which)))
    (if header
        (lquery:$ header sub (text)))))

(defun get-url-tags (data)
  (lquery:$ data "tbody" "a" (attr :href)))

(defun vector-to-string (vec len)
  (let ((new-string " "))
    (loop for index from 0 to (- (length vec) 1) by len
       do
	 (loop for column from 0 to len 
	    do 
	      (setq new-string (format t "~S~C~S" new-string #\tab
				       (if (eq (aref vec (+ index column)) "")
					   " "
					   (aref vec (+ index column)))))
	      (setq new-string (format t "~S~%" new-string)))) new-string))

;;;;;;;;;;;;
;;; main ;;;
;;;;;;;;;;;;

(defparameter page-data (get-url-tags (parse-url (concatenate 'string *url* (first *dir*) ".html"))))

(with-open-file (out "data.tsv" 
                     :direction :output 
                     :if-exists :supersede
                     :if-does-not-exist :create)
  (let ((out-string nil))
    (loop for i from 0 to (length page-data)
       do
	 (setq out-string (concatenate 'string "~S~S" 
                                       out-string 
                                       (let* ((parsed-data (parse-url (concatenate 'string *url* (aref page-data i))))
                                              (header (collect-table-data parsed-data "thead" "th"))
                                              (body (collect-table-data parsed-data "tbody" "td")))
                                         (format out "~S~S" 
                                                 (if (eq i 0)
                                                     (vector-to-string header (length header))
                                                     "")
                                                 (vector-to-string body (length body)))))))))

(with-open-file (out "~/Desktop/data.tsv"
		     :direction :output
		     :if-does-not-exist :create
		     :if-exists :supersede)
  (let ((head (collect-table-data page "thead" "th"))
	(page-strings (collect-table-data page "tbody" "td")))
    (loop for i from 0 to 7 do
	 (format out "~S~C" (aref head i) #\Tab))
    (format out "~%")
    (loop for x from 0 to (length page-strings) by 7
	 do
	 (loop for y from 0 to 7
	    do (format out "~S~C" (aref page-strings (+ x y)) #\Tab))
	 (format out "~%"))))
