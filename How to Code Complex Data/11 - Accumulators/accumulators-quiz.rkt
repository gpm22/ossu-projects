;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname accumulators-quiz) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; PROBLEM 1:
; Assuming the use of at least one accumulator, design a function that consumes a list of strings,
; and produces the length of the longest string in the list. 

;; (listof String) -> Number
;; it consumes a list of strings and produces the length of the longest string in the list. 

(check-expect (longest empty) 0)
(check-expect (longest (list "" "" "" "")) 0)
(check-expect (longest (list "1" "" "" "")) 1)
(check-expect (longest (list "1" "11" "" "")) 2)
(check-expect (longest (list "1" "111" "11" "")) 3)
(check-expect (longest (list "1111" "111" "1" "11")) 4)

;(define (longest los) 0) ;stub

(define (longest los0)
  ;; acc: Number; it is the actual longest length
  ;; (longest (list "1111" "111" "1" "11") 0)
  ;; (longest (list        "111" "1" "11") 4)
  ;; (longest (list              "1" "11") 4)
  ;; (longest (list                  "11") 4)
  ;; (longest (list                      ) 4)
  (local [(define (longest los acc)
            (cond [(empty? los) acc]
                  [else
                   (local [(define al (string-length (first los)))]
                     (if (< acc al)
                         (longest (rest los) al)
                         (longest (rest los) acc)))]))]
    (longest los0 0)))

; PROBLEM 2:
 
; The Fibbonacci Sequence https://en.wikipedia.org/wiki/Fibonacci_number is 
; the sequence 0, 1, 1, 2, 3, 5, 8, 13,... where the nth element is equal to 
; n-2 + n-1. 
 
; Design a function that given a list of numbers at least two elements long, 
; determines if the list obeys the fibonacci rule, n-2 + n-1 = n, for every 
; element in the list. The sequence does not have to start at zero, so for 
; example, the sequence 4, 5, 9, 14, 23 would follow the rule. 


;; (listof Natural) -> Boolean
;; it consumes a list of numbers at least two elements long and produces true
;;    if the list obeys the fibonacci rule, n-2 + n-1 = n;

(check-expect (fibonacci? (list 0 0)) true)
(check-expect (fibonacci? (list 1 2)) true)
(check-expect (fibonacci? (list 1000 121213)) true)
(check-expect (fibonacci? (list 0 0 0)) true)
(check-expect (fibonacci? (list 4 5 9 14 23)) true)
(check-expect (fibonacci? (list 1000 121213 121213)) false)
(check-expect (fibonacci? (list 1000 121213 122213 )) true)
(check-expect (fibonacci? (list 0 1 1 2 3 5 8 13 21 34)) true)

;(define (fibonacci? lon) false);stub

(define (fibonacci? lon0)
  ;; n1 is Number; it is the previous number
  ;; n2 is Number; it is the previous previous number
  (local [(define (fibonacci? lon n1 n2)
            (cond [(empty? lon) true]
                  [(= (+ n1 n2) (first lon))
                   (fibonacci? (rest lon) (first lon) n1)]
                  [else false]))]
    (fibonacci? (rest (rest lon0))
                (first (rest lon0))
                (first lon0))))

; PROBLEM 3:
 
; Refactor the function below to make it tail recursive.  
 

;; Natural -> Natural
;; produces the factorial of the given number
(check-expect (fact 0) 1)
(check-expect (fact 3) 6)
(check-expect (fact 5) 120)

#;
(define (fact n)
  (cond [(zero? n) 1]
        [else 
         (* n (fact (sub1 n)))]))

(define (fact n0)
  ;; acc: Number; It is the result of the calculation so far
  (local [(define (fact n acc)
            (cond [(zero? n) acc]
                  [else
                   (fact (sub1 n) (* n acc))]))]
    (fact n0 1)))


; PROBLEM 4:
 
; Recall the data definition for Region from the Abstraction Quiz. Use a worklist 
; accumulator to design a tail recursive function that counts the number of regions 
; within and including a given region. 
; So (count-regions CANADA) should produce 7


(define-struct region (name type subregions))
;; Region is (make-region String Type (listof Region))
;; interp. a geographical region

;; Type is one of:
;; - "Continent"
;; - "Country"
;; - "Province"
;; - "State"
;; - "City"
;; interp. categories of geographical regions

(define VANCOUVER (make-region "Vancouver" "City" empty))
(define VICTORIA (make-region "Victoria" "City" empty))
(define BC (make-region "British Columbia" "Province" (list VANCOUVER VICTORIA)))
(define CALGARY (make-region "Calgary" "City" empty))
(define EDMONTON (make-region "Edmonton" "City" empty))
(define ALBERTA (make-region "Alberta" "Province" (list CALGARY EDMONTON)))
(define CANADA (make-region "Canada" "Country" (list BC ALBERTA)))

#;
(define (fn-for-region r)
  (local [(define (fn-for-region r)
            (... (region-name r)
                 (fn-for-type (region-type r))
                 (fn-for-lor (region-subregions r))))
          
          (define (fn-for-type t)
            (cond [(string=? t "Continent") (...)]
                  [(string=? t "Country") (...)]
                  [(string=? t "Province") (...)]
                  [(string=? t "State") (...)]
                  [(string=? t "City") (...)]))
          
          (define (fn-for-lor lor)
            (cond [(empty? lor) (...)]
                  [else 
                   (... (fn-for-region (first lor))
                        (fn-for-lor (rest lor)))]))]
    (fn-for-region r)))

;; Region -> Natural
;; it consumes a Region and produce the the number of regions within
;;     and including the given region.

;(define VANCOUVER (make-region "Vancouver" "City" empty))
;(define VICTORIA (make-region "Victoria" "City" empty))
;(define BC (make-region "British Columbia" "Province" (list VANCOUVER VICTORIA)))
;(define CALGARY (make-region "Calgary" "City" empty))
;(define EDMONTON (make-region "Edmonton" "City" empty))
;(define ALBERTA (make-region "Alberta" "Province" (list CALGARY EDMONTON)))
;(define CANADA (make-region "Canada" "Country" (list BC ALBERTA)))

(check-expect (count-regions VANCOUVER) 1)
(check-expect (count-regions VICTORIA)  1)
(check-expect (count-regions BC)        3)
(check-expect (count-regions CALGARY)   1)
(check-expect (count-regions EDMONTON)  1)
(check-expect (count-regions ALBERTA)   3)
(check-expect (count-regions CANADA)    7)

;(define (count-regions r) 0) ;stub

(define (count-regions r)
  ;; todo is (listof Region); it is the worklist
  ;; acc is Natural; it is the sum so far
  (local [(define (fn-for-region r todo acc)
                 (fn-for-lor (append (region-subregions r) todo)
                             (add1 acc)))         
          
          (define (fn-for-lor todo acc)
            (cond [(empty? todo) acc]
                  [else 
                   (fn-for-region (first todo) (rest todo) acc)]))]
    (fn-for-region r empty 0)))





