(ql:quickload '(:dexador :plump :lquery :cl-ppcre :trivial-download) :silent t)

(defparameter podcasts '("http://tinymeatgang.libsyn.com/rssfeed"
                         "http://rss.art19.com/startalk-radio"
                         "http://wakingup.libsyn.com/rss"))

(defun shorten (title-name)
  "this is horrendous"
  (cl-ppcre:regex-replace-all #\space
  (cl-ppcre:regex-replace-all "-"
  (cl-ppcre:regex-replace-all "_" title-name "") "") ""))

(defun parse-dom (dom-root)
  "return the list of items"
  (let ((titles (coerce (lquery:$ dom-root "title" (text)) 'list))
        (urls (coerce (lquery:$ dom-root "enclosure" (attr "url")) 'list)))
    (loop for title in titles
          for url in urls
          when (and title url)
          collect (list (shorten title) url))))

(defun path-maker (file-name file-type)
  (make-pathname
   :directory '(:absolute "home" "evanpeterjones" "Music" "podcasts")
   :name file-name
   :type file-type))

(loop for pod in podcasts 
      do (let ((episodes (parse-dom (plump:parse (dex:get pod)))))
           (loop for which in '(third fourth fifth)
		do (let ((episode (eval `(,which episodes))))
                      (format t "Downloading episode: ~S" (first episode))
                      (trivial-download:download (second episode) (path-maker (first episode) "mp3"))))))
