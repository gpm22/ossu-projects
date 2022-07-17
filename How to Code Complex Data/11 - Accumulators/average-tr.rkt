;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname average-tr) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; average-tr.rkt


;PROBLEM:

;Design a function called average that consumes (listof Number) and produces the
;average of the numbers in the list.

;; (listof Number) -> Number
;; it consumes (listof Number) and produces the
;;          average of the numbers in the list.

(check-expect (avg empty) 0)
(check-expect (avg (list 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1)) 1)
(check-expect (avg (list 4 6 8 10)) 7)

;(define (avg lon) 0);stub

(define (avg lon0)
  ;; sum: Number; It is the sum of the previous numbers
  ;;  qn: Number; It is the quantity of visited numbers
  ;; (avg (list 4 6 8 10)  0 0)
  ;; (avg (list   6 8 10)  4 1)
  ;; (avg (list     8 10) 10 2)
  ;; (avg (list       10) 18 3)
  ;; (avg (list         ) 28 4)
  (local [(define (avg lon sum qn)
            (cond [(empty? lon)
                   (if (zero? qn)
                       0
                       (/ sum qn))]
                  [else
                   (avg (rest lon)
                        (+ sum (first lon))
                        (add1 qn))]))]
    (avg lon0 0 0)))
                  





              