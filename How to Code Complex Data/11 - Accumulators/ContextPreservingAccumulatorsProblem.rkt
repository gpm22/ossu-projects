;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ContextPreservingAccumulatorsProblem) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;You are asked to design a function that numbers a list of strings
;by inserting a number and a colon before each element of the list
;based on its position. So for example:

;(number-list (list "first" "second" "third")) would produce (list "1: first" "2: second" "3: third")

;Here is a partially completed design of this function:

;; (listof String) -> (listof String)
;; append each string's position in the list to the front of the string to number the list
(check-expect (number-list empty) empty)
(check-expect (number-list (list "first" "second" "third")) 
              (list "1: first" "2: second" "3: third"))
;(define (number-list los) los)   ;stub

(define (number-list lox0)
  ;; index: Natural; 1-based index of (first lox) in lox0
  ;; (skip1 (list "a" "b" "c") 1)
  ;; (skip1 (list     "b" "c") 2)
  ;; (skip1 (list         "c") 3) 
  (local [(define (number-list lox index)
            (cond [(empty? lox) empty]
                  [else
                   (cons
                    (string-append (number->string index) ": " (first lox))
                    (number-list (rest lox) (add1 index)))]))]
  (number-list lox0 1)))