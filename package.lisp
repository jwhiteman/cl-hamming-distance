(defpackage #:hamming
  (:use #:cl)
  (:export #:distance))

(defpackage #:hamming-test
  (:use #:cl #:prove #:hamming))
