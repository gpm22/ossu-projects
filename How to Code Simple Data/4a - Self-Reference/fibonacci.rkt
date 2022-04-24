;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname fibonacci) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (fibonacci n)
  (cond [(<= n 0) 0]
        [(= n 1)  1]
        [(= n 2)  1]
        [else
         (+ (fibonacci (- n 1))
            (fibonacci (- n 2)))]))

(fibonacci 1)
(fibonacci 2)
(fibonacci 20)