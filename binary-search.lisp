(defun find (tree item)
  (cond
   ((= (car tree) item)
    item)
   ((< (car tree) item)
    (find (
