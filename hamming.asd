(asdf:defsystem #:hamming
  :author "jim w."
  :depends-on (#:prove)
  :components ((:file "package")
	       (:file "hamming")
	       (:file "hamming-test")))
