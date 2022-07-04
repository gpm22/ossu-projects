;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname fractals) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(require 2htdp/image)

;; fractals.rkt

;PROBLEM 1: 

;Design a function that consumes a number and produces a Sierpinski
;triangle of that size. Your function should use generative recursion.

;One way to draw a Sierpinski triangle is to:

; - start with an equilateral triangle with side length s


;    /\
;   /  \
;  /    \
; /______\

; - inside that triangle are three more Sierpinski triangles

;    /\
;   /__\
;  /\  /\
; /__\/__\

; - and inside each of those... and so on

;So that you end up with something that looks like this:

;                   /\
;                  /  \
;                 /    \
;                /      \
;               /________\
;              /\        /\
;             /  \      /  \
;            /    \    /    \
;           /      \  /      \
;          /________\/________\
;         /\                  /\
;        /  \                /  \
;       /    \              /    \
;      /      \            /      \
;     /________\          /________\
;    /\        /\        /\        /\
;   /  \      /  \      /  \      /  \
;  /    \    /    \    /    \    /    \
; /      \  /      \  /      \  /      \
;/________\/________\/________\/________\

;Note that the center upside down triangle is not an explicit
;triangle, it is simply formed from the other triangles.


(define CUTOFF 1)

;; Natural -> Image
;; .it consumes a number and produces a Sierpinski triangle of that size.

(check-expect (stri CUTOFF) (triangle CUTOFF "outline" "green"))
(check-expect (stri (* CUTOFF 2))
              (local [(define sub (triangle CUTOFF "outline" "green"))]
                (above sub
                       (beside sub sub))))

(check-expect (stri (* CUTOFF 4)) 
              (local [(define sub 
                        (local [(define sub (triangle CUTOFF "outline" "green"))]
                          (above sub
                                 (beside sub sub))))]
                (above sub
                       (beside sub sub))))

(check-expect (stri (* CUTOFF 8)) 
              (local [(define sub 
                        (local [(define sub
                                  (local [(define sub (triangle CUTOFF "outline" "green"))]
                                    (above sub
                                           (beside sub sub))))]
                          (above sub
                                 (beside sub sub))))]
                (above sub
                       (beside sub sub))))

(check-expect (stri (* CUTOFF 16)) 
              (local [(define sub 
                        (local [(define sub 
                                  (local [(define sub 
                                            (local [(define sub (triangle CUTOFF "outline" "green"))]
                                              (above sub
                                                     (beside sub sub))))]
                                    (above sub
                                           (beside sub sub))))]
                          (above sub
                                 (beside sub sub))))]
                (above sub
                       (beside sub sub))))

;(define (stri s) empty-image) ;stub

(define (stri s)
  (cond [(<= s CUTOFF) (triangle CUTOFF "outline" "green")]
        [else
         (local [(define sub (stri (/ s 2)))]
           (above sub
                  (beside sub sub)))]))

;PROBLEM 2:

;Design a function to produce a Sierpinski carpet of size s.

;Here is an example of a larger Sierpinski carpet.

; Example:

; _ _ _ _ _ _ _ _ _
;|_|_|_|_|_|_|_|_|_|
;|_|_|_|_|_|_|_|_|_|
;|_|_|_|_|_|_|_|_|_|
;|_|_|_|     |_|_|_|
;|_|_|_|     |_|_|_|
;|_|_|_|_ _ _|_|_|_|
;|_|_|_|_|_|_|_|_|_|
;|_|_|_|_|_|_|_|_|_|
;|_|_|_|_|_|_|_|_|_|

