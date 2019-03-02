(ql:quickload :opticl)

(defpackage #:impatient (:use #:cl #:opticl))
(in-package #:impatient)

(let ((img (read-jpeg-file "~/Pictures/oof.png")))
  (typecase img
	    (8-bit-rgb-image
	     (locally
	      (declare (type 8-bit-rgb-image img))
	      (with-image-bound (height width)
				img
				(time
				 (loop for i below height
				       do (loop for j below width
						do
						(multiple-value-bind (r g b)
								     (pixel img i j)
								     (declare (type (unsigned-byte 8) r g b ))
								     (setf (pixel img i j)
									   (values (- 255 r) g b))))))))))
  (write-jpeg-file "img.png" img))
