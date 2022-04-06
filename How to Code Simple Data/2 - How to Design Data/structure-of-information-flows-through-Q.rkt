;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname structure-of-information-flows-through-Q) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; 2: How to Design Data - Structure of Information Flows Trough

;; Data definitions:

;; CarSpeed is Number[0, 200]
;; interp. the speed of a car in km/h: 0 means stopped, 200 is the maximum speed

(define CS1 0) ; car is stopped
(define CS2 100) ; car is moving
(define CS3 200) ; car is at maximum speed

#;
(define (fn-for-car-speed cs)
  (... cs))

;; Template rules used:
;; - atomic non-distinct: Number[0, 200]

;; Functions:

;; CarSpeed -> Boolean
;; It checks if a car's speed is over the speed limit of 110 km/hr

(check-expect (speeding? 0) false)
(check-expect (speeding? 110) false)
(check-expect (speeding? 200) true)


(define speed-limit 110)

;(define (speeding? cs) false) ;stub

(define (speeding? cs)
  (> cs speed-limit))