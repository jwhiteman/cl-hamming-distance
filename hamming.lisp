(in-package #:hamming)

(defun unpack (str)
  (map 'list #'char-code str))

(defun different-right-bit? (byte1 byte2)
  (/= (logand byte1 1) (logand byte2 1)))

(defun byte-distance (byte1 byte2)
  (labels ((_ (b1 b2 i acc)
	     (if (zerop i)
		 acc
		 (_ (ash b1 -1)
		    (ash b2 -1)
		    (1- i)
		    (if (different-right-bit? b1 b2)
			(1+ acc)
			acc)))))
    (_ byte1 byte2 8 0)))

(defun distance (str1 str2)
  "Get the hamming distance between two strings by counting
   the number of different bits in equal length strings."
  (labels ((_ (bytes1 bytes2 acc)
	     (if (null bytes1)
		 acc
		 (_ (cdr bytes1)
		    (cdr bytes2)
		    (+ acc (byte-distance (car bytes1)
					  (car bytes2)))))))
    (_ (unpack str1) (unpack str2) 0)))
