;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname sum-tr) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; sum-tr.rkt


;PROBLEM:

;(A) Consider the following function that consumes a list of numbers and produces
;    the sum of all the numbers in the list. Use the stepper to analyze the behavior 
;    of this function as the list gets larger and larger. 

; It creates the + for each element of the list, then it goes back summing from the
;    last element

;(B) Use an accumulator to design a tail-recursive version of sum.


;; (listof Number) -> Number
;; produce sum of all elements of lon
(check-expect (sum empty) 0)
(check-expect (sum (list 2 4 5)) 11)
(check-expect (sum (list 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1)) 36)

#;
(define (sum lon)
  (cond [(empty? lon) 0]
        [else
         (+ (first lon)
            (sum (rest lon)))]))

(define (sum lon0)
  ;; acc: Number; is the value of the sum of the previous elements
  ;; (sum (list 2 4 5)) 0)
  ;; (sum (list   4 5)) 2)
  ;; (sum (list     5)) 6)
  ;; (sum (list      )) 11)
  (local [(define (sum lon acc)
            (cond [(empty? lon) acc]
                  [else
                   (sum (rest lon) (+ acc (first lon) ))]))]
    (sum lon0 0)))


;; (listof Number) -> Number
;; produce avg of all elements of lon
(check-expect (avg empty) 0)
(check-expect (avg (list 2 4 6)) 4)
(check-expect (avg (list 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1)) 1)

;(define (avg lon) 0) ;stub

(define (avg lon0)
  ;; sum: Natural. is the sum of the previous elements
  ;; n: Natural. is the number os past elements
  ;; (avg (list 2 4 6))  0 0)
  ;; (avg (list   4 6))  2 1)
  ;; (avg (list     6))  6 2)
  ;; (avg (list      )) 12 3)
  (local [(define (avg lon sum n)
            (cond [(empty? lon)
                   (if (zero? n)
                       0
                       (/ sum n))]
                  [else
                   (avg (rest lon) (+ sum (first lon)) (add1 n))]))]
    (avg lon0 0 0)))