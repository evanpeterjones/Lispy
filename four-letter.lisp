;; idfk why i needed to make this

(ql:quickload cl-ppcre)

(defun is-vowel (word)
  (let ((ptrn (cl-ppcre:create-scanner "(I)*")))
    (if (and (= 4 (length word))
             (cl-ppcre:scan ptrn word))
        word nil)))

(is-vowel "asdf")

(defun four-letter-list ()
  "return a list of every four letter combination")
