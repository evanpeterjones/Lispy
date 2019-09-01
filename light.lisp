(ql:quickload '(:cl-json :usocket) :silent t)

(defpackage :light
  (:use :cl :cl-json :usocket))

(defun create-socket (buffer &optional (port 9999) (ip "127.0.0.1"))
  (let* ((socket (usocket:socket-connect nil nil
					 :protocol :datagram
					 :element-type 'character
					 :local-host ip
					 :local-port port)))
    (unwind-protect
	 (multiple-value-bind (buffer size client receive-port)
	     (usocket:socket-receive socket buffer 8)
	   (format t "~A~%" buffer)
	   (usocket:socket-send socket (reverse buffer) size
				:port receive-port
				:host client))
      (usocket:socket-close socket))))

(defun encrypt-string (packet)
  "'encryption'"
  (let ((encrypted nil)
	(k 171))
    (setq encrypted (map 'string #'(lambda (char) (code-char (setq k (code-char (logxor (char-code char) k))))) packet))))

(defun decrypt-string (packet)
  ())

(defun make-json (state &optional (hue-value 0) (sat 0) (col-temp 2500) (bright 100))
  "pass me a 0 or 1 to get a json packet to toggle the tplight"
  (cl-json:encode-json
   `((on_off . ,state)
     (dft_on_state . ((mode . normal) (hue . ,hue-value) (saturation . ,sat) (color_temp . ,col-temp) (brightness . ,bright)))
     (err_code . 0))))
