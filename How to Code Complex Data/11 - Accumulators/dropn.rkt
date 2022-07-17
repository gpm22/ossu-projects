;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname dropn-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; dropn.rkt


;PROBLEM:

;Design a function that consumes a list of elements lox and a natural number
;n and produces the list formed by dropping every nth element from lox.

;(dropn (list 1 2 3 4 5 6 7) 2) should produce (list 1 2 4 5 7)

;; (listof X) Natural -> (listof X)
;; it consumes a list of elements and a natural number n and produces the
;;     list formed by dropping every nth element from lox.

(check-expect (dropn empty 1000) empty)
(check-expect (dropn (list 1 2 3 4 5 6 7) 100) (list 1 2 3 4 5 6 7))
(check-expect (dropn (list 1 2 3 4 5 6 7) 0) empty)
(check-expect (dropn (list 1 2 3 4 5 6 7) 1) (list 1 3 5 7))
(check-expect (dropn (list 1 2 3 4 5 6 7) 2) (list 1 2 4 5 7))
(check-expect (dropn (list 1 2 3 4 5 6 7) 3) (list 1 2 3 5 6 7))
(check-expect (dropn (list 1 2 3 4 5 6 7) 4) (list 1 2 3 4 6 7))
(check-expect (dropn (list 1 2 3 4 5 6 7) 5) (list 1 2 3 4 5 7))
(check-expect (dropn (list 1 2 3 4 5 6 7) 6) (list 1 2 3 4 5 6))
(check-expect (dropn (list 1 2 3 4 5 6 7) 7) (list 1 2 3 4 5 6 7))
(check-expect (dropn (list 1 2 3 4 5 6 7) 8) (list 1 2 3 4 5 6 7))


;(define (dropn lox n) empty) ;stub


(define (dropn lox0 n)
  ;;acc : Number; is the number os steps after the last drop
  (local [(define (dropn lox acc)
            (cond [(empty? lox) empty]
                  [(= acc n)
                   (dropn (rest lox) 0)]
                  [else
                   (cons (first lox) (dropn (rest lox) (add1 acc)))]))]
    (dropn lox0 0)))
                  





            