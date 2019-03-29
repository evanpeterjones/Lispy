(defun buy-case (style)
  (case style
	((handbag) "you want a handbag?")
	((purse)   "a purse? the worst,")
	((reg)     "nice choice...")))

(defun find-in (first second)
  "return a list starting at the first item or nil"
  (member first second))

(print (find-in 3 '(1 2 3 4)))
(print (buy-case 'reg))
