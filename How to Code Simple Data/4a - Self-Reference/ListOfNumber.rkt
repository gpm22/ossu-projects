;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ListOfNumber) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; ListOfNumber is one of:
;; - empty
;; (cons Number ListOfNumber)
;; interp. a list of numbers
(define LON1 empty)
(define LON2 (cons 1 empty))
(define LON3 (cons -1 empty))
(define LON4 (cons 1 (cons -1 empty)))

#;
(define (fn-for-lon lon)
  (cond [(empty? lon) (...)]              ;BASE CASE
        [else
         (... (first lon)                 ;Number
              (fn-for-lon (rest lon)))])) ;ListOfNumber

;; Template Rules Used:
;; - one of: 2 cases
;; - atomic distinct: empty
;; - compound: (cons Number ListOfNumber)
;; - self-reference: (rest los) is ListOfNumber

; Design a function that consumes a list of numbers an produces
;      true if that list contains a negative number

;; ListOfNumber -> Boolean
;; Receives a List Of Numbers and return true if the list has a negative number

(check-expect (contains-negative? LON1) false)
(check-expect (contains-negative? LON2) false)
(check-expect (contains-negative? LON3) true)
(check-expect (contains-negative? LON4) true)


;(define (contains-negative? LON) false) ;stub

(define (contains-negative? lon)
  (cond [(empty? lon) false]
        [else
         (if (< (first lon) 0)
             true
             (contains-negative? (rest lon)))]))