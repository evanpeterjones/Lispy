(ql:quickload '(:usocket :cl-json) :silent t)

(defparameter light-info '(((:system . ((:get-sysinfo . :null) . ((:emeter . (:get-realtime . :null))))))))

(defun send-packet (port client data-buffer)
  (usocket:socket-send socket data-buffer (length buffer)
		       :port port
		       :host client))
   
(defun create-server (port)
  (let* ((socket (usocket:socket-listen "127.0.0.1" port))
	 (connection (usocket:socket-accept socket :element-type 'character)))
    (unwind-protect
	(progn
	  (format (usocket:socket-stream connection) "Hello World~%")
	  (force-output (usocket:socket-stream connection)))
      (progn
	(format t "Closing sockets~%")
	(usocket:socket-close socket)
	(usocket:socket-close connection)))))

(defun create-client (port)
  (let ((socket (usocket:socket-connect "127.0.0.1" port :element-type 'character)))
    (unwind-protect
	(progn
	  (usocket:wait-for-input socket)
	  (format t "~A~%" (read-line (usocket:socket-stream socket))))
      (usocket:socket-close socket))))
