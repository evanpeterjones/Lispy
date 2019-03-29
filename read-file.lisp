(defun read-file (file-name)
  (with-open-file (stream filename)
		  (loop for line = (read-line stream nil)
			while line
			(collect line))))


