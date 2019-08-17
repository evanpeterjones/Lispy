(ns rss-scraper.parser
  (:use [clojure.data.zip.xml :only (attr text xml->)])
  (:require [clojure.xml :as xml]
            [clojure.zip :as zip])
  (:gen-class))

(defn parse [xml-file]
  (let [parsed (zip/xml-zip (xml/parse xml-file))]
    (println (get :title parsed))))

(defn download [uri file]
  "pull last three episodes, check if they already exist, download them"
  ())
  
(defn -down [uri file]
  "Download a file from a non-redirecting url"
  (if uri
    (with-open [in (io/input-stream uri)
                out (io/output-stream file)]
      (io/copy in out))))

