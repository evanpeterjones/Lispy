#!/usr/bin/sbcl --script

(defpackage #:rss-scrape.main
  (:use #:cl
        #:dexador
        #:plump
        #:lquery 
        #:cl-ppcre
        #:trivial-download)
  (:export #:run
           #:))

(ql:quickload '(:dexador :plump :lquery :cl-ppcre :trivial-download) :silent t)

(defparameter podcasts '(("tiny-meat-gang" "http://tinymeatgang.libsyn.com/rssfeed")
                         ("startalk" "http://rss.art19.com/startalk-radio")
			 ("waking-up" "http://wakingup.libsyn.com/rss")
                         ("rabbits" "http://rabbits.libsyn.com/rss")
                         ("jre" "http://joeroganexp.joerogan.libsynpro.com/rss")))

(defparameter user "evan")
(defparameter pod-dir "~/Music/")

(defmacro alambda (params &body body)
  `(labels ((self ,params ,@body))
     #'self))

(defmacro shorten (title-name)
;;this needs to be an alambda recursive call
  (let ((replacements '(#\space "-" "_")))
    (lambda (replacements) 
      (self ))))

(defun shorten (title-name)
  "this is horrendous"
  (cl-ppcre:regex-replace-all #\space
  (cl-ppcre:regex-replace-all "-"
  (cl-ppcre:regex-replace-all "_" title-name "") "") ""))

(defun parse-dom (dom-root)
  (let ((titles (coerce (lquery:$ dom-root "item" "title" (text)) 'list))
        (urls (coerce (lquery:$ dom-root "item" "enclosure" (attr "url")) 'list)))
    (loop for title in titles
          for url in urls
          when (and title url)
          collect (list (shorten title) url))))

(defun path-maker (file-name podcast-name file-type)
  "helper function to make the absolute path"
  (make-pathname
   :directory `(:absolute "home" ,user "Music" "podcasts" ,podcast-name)
   :name (first file-name)
   :type file-type))

(defun down (episode podcast-name)
  "wrapper for the trivial-download:download function, return nil if already downloaded"
  (let ((file-name (path-maker episode podcast-name "mp3")))
    (if (probe-file file-name)
	(progn
	  (format t "~S already downloaded, skipping~%" file-name)
	  nil)
	(progn
	  (format t "Downloading ~S~%" file-name)
	  (trivial-download:download (second episode) file-name)))))

(defun download (episode-list podcast-name)
  "recursive function to download episodes until (download %) returns null"
  (if (down (first episode-list) podcast-name)
      (download (rest episode-list) podcast-name)))

(defun run ()
  (loop for pod in podcasts 
     do (let* ((podcast-name (first pod))
	       (rss-feed (second pod))
	       (episodes (parse-dom (plump:parse (dex:get rss-feed)))))
	  (download episodes podcast-name))))

(run)
