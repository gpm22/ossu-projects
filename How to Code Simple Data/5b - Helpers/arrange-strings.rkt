;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname arrange-strings) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Data Definitions:

;; ListOfString is one of:
;; - empty
;; - (cons String ListOfString)
;; interp. a list of strings

(define LOS1 empty)
(define LOS2 (cons "ola" LOS1))
(define LOS3 (cons "hello" LOS2))

#;
(define (fn-for-los los)
  (cond [(empty?) (...)]
        [else
         (... (first los)
              (fn-for-los (rest los)))]))


;; Functions: