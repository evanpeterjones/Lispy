(require '[clojure.java.io :as io])

(defn is-alpha [ch]
  (let [ptrn (re-pattern "[a-zA-Z ]*")]
    (re-matches ptrn ch)))

(defn read-file-name [a]
  (if (.exists (io/as-file a))
    (slurp a)))

(defn text-to-vector [text-file]
  (let [char-map []]
    (map (fn [^Character c]
           (let [key (keyword (clojure.string/lower-case c))
                 inc (key char-map)]
             (if (not (= inc nil))
               (def char-map (assoc char-map key (+ inc 1)))
               (def char-map (assoc char-map key 1))))) text-file)))

(println (text-to-vector "this is a test"))

(defn print-most-common [charmap]
  (reduce-kv #(println %2 %1) {} charmap))

(defn main [file]
  (if-let [text (read-file-name file)]
    (print-most-common (text-to-vector text))
    (println "error occurred reading file")))

                                        ;(main "fire.txt")
