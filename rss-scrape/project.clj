(defproject rss-scraper "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "http://example.com/FIXME"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.8.0"]
                 [http.async.client "1.3.1"]
                 [org.clojure/data.zip "0.1.1"]]
  :main ^:skip-aot rss-scraper.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all}})
