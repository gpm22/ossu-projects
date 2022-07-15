;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname skipn) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; skipn.rkt


;PROBLEM:

;Design a function that consumes a list of elements lox and a natural number
;n and produces the list formed by including the first element of lox, then 
;skipping the next n elements, including an element, skipping the next n 
;and so on.

; (skipn (list "a" "b" "c" "d" "e" "f") 2) should produce (list "a" "d")


;; (listof X) Natural -> (listof X)
;; It consumes a list and a number and produces a new list cotaining
;;     the first element, 1+n+1 element, 2+n+1 element, and so on.

(check-expect (skipn empty 15) empty)
(check-expect (skipn (list "a" "b" "c" "d" "e" "f") 0)  (list "a" "b" "c" "d" "e" "f"))
(check-expect (skipn (list "a" "b" "c" "d" "e" "f") 1)  (list "a" "c" "e"))
(check-expect (skipn (list "a" "b" "c" "d" "e" "f") 2)  (list "a" "d"))
(check-expect (skipn (list "a" "b" "c" "d" "e" "f") 3)  (list "a" "e"))
(check-expect (skipn (list "a" "b" "c" "d" "e" "f") 4)  (list "a" "f"))
(check-expect (skipn (list "a" "b" "c" "d" "e" "f") 5)  (list "a"))


;(define (skipn l n) empty) ;stub

(define (skipn lox0 n)
  ;;aindex: Natural; it is the actual index of the elemenbt
  ;; (skipn (list "a" "b" "c" "d") 1)
  ;; (skipn (list     "b" "c" "d") 2)
  ;; (skipn (list         "c" "d") 3)
  ;; (skipn (list             "d") 4)
  ;;nindex: Natural; it is the next index to be added to the new list
  ;; (skipn (list "a" "b" "c" "d") 1)
  ;; (skipn (list     "b" "c" "d") 1+n+1)
  (local [(define (skipn lox aindex nindex)
            (cond [(empty? lox) empty]
                  [(= aindex nindex)
                   (cons (first lox) (skipn (rest lox) (add1 aindex) (+ nindex 1 n)))]
                  [else
                   (skipn (rest lox) (add1 aindex) nindex)]))]
  (cond [(zero? n) lox0]
        [(= (sub1 (length lox0)) n) (list (first lox0))]
        [else
         (skipn lox0 1 1)])))


;; Instructor Solution

;; (listof X) Natural -> (listof X)
;; It consumes a list and a number and produces a new list cotaining
;;     the first element, 1+n+1 element, 2+n+1 element, and so on.

(check-expect (skipn2 empty 15) empty)
(check-expect (skipn2 (list "a" "b" "c" "d" "e" "f") 0)  (list "a" "b" "c" "d" "e" "f"))
(check-expect (skipn2 (list "a" "b" "c" "d" "e" "f") 1)  (list "a" "c" "e"))
(check-expect (skipn2 (list "a" "b" "c" "d" "e" "f") 2)  (list "a" "d"))
(check-expect (skipn2 (list "a" "b" "c" "d" "e" "f") 3)  (list "a" "e"))
(check-expect (skipn2 (list "a" "b" "c" "d" "e" "f") 4)  (list "a" "f"))
(check-expect (skipn2 (list "a" "b" "c" "d" "e" "f") 5)  (list "a"))
                   
(define (skipn2 lox0 n)
  ;; acc: Natural; the number of elements to skip before including the next one
  ;; (skipn (list "a" "b" "c" "d") 2) ;outer call
  ;;
  ;; (skipn (list "a" "b" "c" "d") 0) ;include
  ;; (skipn (list     "b" "c" "d") 2) ;don't include
  ;; (skipn (list         "c" "d") 1) ;don't include
  ;; (skipn (list             "d") 0) ;include
  ;; (skipn (list                ) 2)
  (local [(define (skipn lox acc)
            (cond [(empty? lox) empty]
                  [else
                   (if (zero? acc)
                       (cons (first lox)
                             (skipn (rest lox) n))
                       (skipn (rest lox) (sub1 acc)))]))]
    (skipn lox0 0)))
