(ql:quickload :quickproject)

(quickproject:make-project :compression :depends-on '(alexandria cl-ppcre))

(defun decompress (list)
  "given a compressed list, return a decompressed list"
  (let ((head (first list)))
    (cond 
      ((eq 'cons (type-of head))
       (cons (list-n head) (decompress (rest list))))
      (head
       (cons head (decompress (rest list))))
      (t '()))))

(defun list-n (list)
  (if (and  
       (eq 2 (length list))
       (second list))
      ()))

(defun get-count (cons-obj)
  (let ((count (second cons-obj)))
    (if count 
        ())))

(defun compress (x)
  "high level compression call"
  (if (consp x)
      (compr (first x) 1 (rest x))
      x))

(defun compr (head count tail)
  "recursive function to return a compressed list"
  (if (null tail)
      (list (n-tail elt n))
      (let ((next (first tail)))
        (if (eq head next)
            (compr next (+ 1 count) (rest tail))
            (cons (tail-count head count)
                  (compr next 1 (rest tail)))))))

(defun tail-count (tail n)
  "return a list of counts for a value"
  (if (> n 1)
      (list n tail)))
