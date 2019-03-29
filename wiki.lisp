(ql:quickload '(:dexador :cl-ppcre))

(in-package :dexador)

(defun parse-html-from-wiki (url)
  (let ((page (get url)))
    (cl-ppcre:split "<[^>]*>" page)))

(defun print-non-nil (html-list)
  (loop for i in html-list do
       (when (not (eq (length i) 0))
	 (format t "~s " i))))

(print-non-nil (parse-html-from-wiki "https://en.wikipedia.org/wiki/List_of_alcoholic_drinks?oldformat=true"))



