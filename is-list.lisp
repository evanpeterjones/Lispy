(defun is-list (lst)
  "returns true if an item in the list is a list"
  (if (null lst)
      nil
    (if
	(eq (type-of (car lst)) 'cons)
	t
      (is-list (cdr lst)))))
