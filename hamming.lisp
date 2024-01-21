(in-package #:hamming)

(defun unpack (str)
  (map 'list #'char-code str))

(defun byte-distance (byte1 byte2)
  "Iterate through the xor of the two bytes, shifting each
  time. Use 1 as a mask and add the value of the last bit to
  the counter - it will be 1 if they were different, 0 if they were not."
  (labels ((_ (xor i acc)
              (if (zerop i)
                acc
                (_ (ash xor -1)
                   (1- i)
                   (+ acc (logand xor 1))))))
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
