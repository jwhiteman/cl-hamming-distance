(in-package #:hamming)

(defun unpack (str)
  (map 'list #'char-code str))

(defun byte-distance (byte1 byte2)
  "Iterate through the xor of the two bytes, shifting each
  time. If the result is odd, then we can count it as a
  differing bit"
  (labels ((_ (xor i acc)
              (if (zerop i)
                acc
                (_ (ash xor -1)
                   (1- i)
                   (if (= 1 (logand xor 1))
                     (1+ acc)
                     acc)))))
    (_ (logxor byte1 byte2) 8 0)))

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
