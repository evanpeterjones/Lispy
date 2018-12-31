(defvar h (list 1 2 3 4 5 6))
(defvar x 1)
(defvar ch 'h)
(defvar c h)
(defvar f 6.02)

(format t "ch: ~s ~%"(type-of ch))
(format t "x: ~s ~%" (type-of x))
(format t "f: ~s ~%" (type-of f))
(format t "c: ~s ~%" (type-of c))
(format t "h: ~s ~%" (type-of h))
(format t "last value in h: ~s ~%" (car (last h)))

(defmacro setvalten(val)
  (setq val 10) (print val))

(setq a 40)
(print '( + 5 a ))

(dolist (entry allocation-log)
  (case (first entry)
    (allocate (plot-allocation (second entry)))
    (free (plot-free (second entry)))))
