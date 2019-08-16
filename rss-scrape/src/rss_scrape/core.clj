(ns rss-scrape.core
  (:require [clojure.xml :as xml])
  (:use [rss-scrape.parser :as parser])
  (:gen-class))

(defn -main  [& args]
  (let [podcasts ["http://tinymeatgang.libsyn.com/rssfeed"
             "http://rss.art19.com/startalk-radio"
              "http://wakingup.libsyn.com/rss"]]
    (-> podcasts
        parser/parse
        parser/select)))
  
