(defpackage :exp
  (:export :func))

(defun func (val)
  (format t "output: ~S ~%" val))
