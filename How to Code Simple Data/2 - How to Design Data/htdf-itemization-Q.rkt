;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdf-itemization-Q) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; 2: How to Design Data - HtDF with Itemization

;; Data definitions:

;; 2: How to Design Data: Itemization - Question 3

;; Reservation is one of:
;; - Natural[1, 100]
;; - "standby"
;; interp.
;;   Natural[1, 100] means a guaranteed seat for dinner where the number
;;                   corresponds to which reservation (not which seat)
;;   "standby"      means a standy spot, if all the servations show up
;;                   this person will not be seated

(define R1 "standby")
(define R2 35)
(define R3 100)

#;
(define (fn-for-reservation r)
  (cond [(and (number?)
              (<= 1 r)
              (>= 100 r)) (... r)]
         [else (...)]))

;; Tmeplate rules used:
;; - one of: 2 cases
;; - atomic non-distinct: Natural[1, 100]
;; - atomic distinct: "standby"