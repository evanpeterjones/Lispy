(defun show-squares (start end)
  (if (> start end)
      'done
    (progn
      (format t "~A : ~A ~%" start (* start start))
      (show-squares (1+ start) end))))

(show-squares 2 5)
