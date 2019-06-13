(DEFUN SUM-LIST (LST SUM)
  "sum of a list with tail recursion"
  (IF (NULL LST)
      SUM
      (SUM-LIST (CDR LST) (+ (CAR LST) SUM))))

(FORMAT T "tail recursive sum of list is: ~d" (SUM-LIST '(1 2 3 4 5) 0))
