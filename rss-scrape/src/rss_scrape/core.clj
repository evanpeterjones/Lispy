(ns rss-scraper.core
  (:require [http.async.client :as http]
            [clojure.java.io :as io])
  (:use [rss-scraper.parser :as parser])
  (:gen-class))

(def rss-feeds ["http://tinymeatgang.libsyn.com/rssfeed"
                "http://rss.art19.com/startalk-radio"
                "http://wakingup.libsyn.com/rss"])

(def directory "~/Music/podcasts/")

(defn -main [& args]
  (doseq [url rss-feeds]
    (with-open [client  (http/create-client)]
      (let [response (http/GET client url)]
        (-> response
            http/await
            http/string
            parser/parse
            parser/download)))
