;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname skip1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; skip1.rkt


;PROBLEM:

;Design a function that consumes a list of elements and produces the list
;consisting of only the 1st, 3rd, 5th and so on elements of its input. 

;   (skip1 (list "a" "b" "c" "d")) should produce (list "a" "c")

;; (listof X) -> (listof X)
;; it consumes a list and produces a list with the odd positioned elements,
;;     considering the position to be 1-based;

(check-expect (skip1 (list "a" "b" "c" "d")) (list "a" "c"))

(define (skip1 lox0)
  ;; index: Natural; 1-based index of (first lox) in lox0
  ;; (skip1 (list "a" "b" "c") 1)
  ;; (skip1 (list     "b" "c") 2)
  ;; (skip1 (list         "c") 3) 
  (local [(define (skip1 lox index)
            (cond [(empty? lox) empty]
                  [(odd? index)
                   (cons (first lox) (skip1 (rest lox) (add1 index)))]
                  [else
                   (skip1 (rest lox) (add1 index))]))]
  (skip1 lox0 1)))

