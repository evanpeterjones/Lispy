(ql:quickload :opticl)

(defpackage #:impatient (:use #:cl #:opticl))
(in-package #:impatient)

(let ((img (opticl:read-png-file "~/Pictures/oof.png")))
  (typecase img
	    (8-bit-rgb-image
	     (locally
	      (declare (type 8-bit-rgb-image img))
	      (opticl:with-image-bounds (height width) img
					(time (loop for i below height do
						    (loop for j below width do
							  (multiple-value-bind (r g b)
									       (pixel img i j)
									       (declare (type (unsigned-byte 8) r g b))
									       (if (or (evenp g) (evenp r))
										   (setf (pixel img i j)
											 (values (- 255 r) g b))
										 (setf (pixel img i j)
										       (values r (- 255 g) b)))))))))))
  (write-png-file "out.png" img))
