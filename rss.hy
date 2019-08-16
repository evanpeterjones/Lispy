(import [bs4 [BeautifulSoup :as bs]]
        [os.path [isdir exists]]
        requests
        bs4
        os)

(global podcasts)
(setv podcasts "/home/evanpeterjones/Music/podcasts/")

(defn download [url]
  "pull down document at url"
  (if (not url) return)
  (setv page (.get requests url))
  (if (= page.status-code 200)
      page.text
      None))

(defn min [string &optional [file-type ""]]
  "simple string utility"
  (+ (.replace string " " "") "." (str file-type)))

(defn get-content-url [itm attr]
  "return download url of an item/episode"
  (setv url (.find-all bs itm "enclosure"))
  (if (= (type url) bs4.element.ResultSet)
      (.find-all bs (get url 0) attr)
      None))

(defn exists? [item]
  "checks if a podcast title exists"
  (setv title (.find bs item "title"))
  (.exists os.path (+ podcasts (min title.text "mp3"))))

(defn check-dirs [items]
  "parse xml and return a list of urls to download"
  (setv new-episodes [])
  (for [item items]
    (if (exists? item)
        continue
         (.append new-episodes (get-content-url item "url"))))
  new-episodes)

(defn parse [page]
  "parse page to return list of items"
  (setv data (bs page "xml"))
  (setv text "item")
  (.find-all bs data text))

(setv podcasts ["http://tinymeatgang.libsyn.com/rssfeed"
                "http://rss.art19.com/startalk-radio"
                "http://wakingup.libsyn.com/rss"])

(for [i podcasts]
  (-> 
    i
    (download)
    (parse)
    (check-dirs)
    (download)))

