(ns rss-scrape.parser
  (:require [http.async.client :as http]
            [clojure.xml :as xml]
            [clojure.zip :as zip])
  (:gen-class))

(defn parse [urls]
  (for [url urls]
    (-> url
        xml/parse
        zip/xml-zip)))

(defn select [data]
  (loop for [index 0]
        (if (count ))
        (recur 

(:content (get (:content (get data 0)) (inc index))))))
