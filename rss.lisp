(ql:quickload '(:dexador :plump :lquery :cl-ppcre) :silent t)

(defparameter podcasts '("http://tinymeatgang.libsyn.com/rssfeed"
                         "http://rss.art19.com/startalk-radio"
                         "http://wakingup.libsyn.com/rss"))

(defun shorten (title-name)
  (cl-ppcre:regex-replace-all #\space
  (cl-ppcre:regex-replace-all "-"
  (cl-ppcre:regex-replace-all "_" title-name "") "") ""))

(defun parse-dom (dom-root)
  (let ((titles (coerce (lquery:$ dom-root "title" (text)) 'list))
        (urls (coerce (lquery:$ dom-root "enclosure" (attr "url")) 'list)))
    (loop for title in titles
          for url in urls
          when (and title url)
          collect (list (shorten title) url))))

(defun download (episode)
  (let ((file-name (concatenate 'string (first episode) ".mp3")))
    (with-open-file (stream file-name :direction :output :if-exists nil)
                    (format stream "~S" (dex:get (second episode))))))

(loop for pod in podcasts 
      do (let ((urls (parse-dom (plump:parse (dex:get pod)))))
           (loop for val in '(first second third)
                 do (progn 
                      (format t "Downloading episode: ~S" (val urls))
                      (download (val urls))))))


