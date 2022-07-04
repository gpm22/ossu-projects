;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname circle-fractal) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; circle-fractal-starter.rkt


;PROBLEM :

;Design a function that will create the a fractal where each circle is
; surrounded by circles that are two-fifths smaller. 

;You can build these images using the convenient beside and above functions
;if you make your actual recursive function be one that just produces the
;top leaf shape. You can then rotate that to produce the other three shapes.

;You don't have to use this structure if you are prepared to use more
;complex place-image functions and do some arithmetic. But the approach
;where you use the helper is simpler.

;Include a termination argument for your design.

;; =================
;; Constants:

(define STEP (/ 2 5))
(define TRIVIAL-SIZE 5)
(define COLOR "white")


;; Number -> Image
;; it consumes a number and produces the circle fract withe the center
;;     circle with radius s


(check-expect (frac-circ TRIVIAL-SIZE) (circle TRIVIAL-SIZE "outline" COLOR))

(check-expect (frac-circ (/ TRIVIAL-SIZE STEP))
              (local [(define central (circle (/ TRIVIAL-SIZE STEP) "outline" COLOR))
                      (define sub (circle TRIVIAL-SIZE "outline" COLOR))]
                (above sub
                       (beside (rotate 90 sub) central (rotate -90 sub) )
                       (rotate 180 sub))))


(check-expect (frac-circ (/ TRIVIAL-SIZE STEP STEP))
              (local [(define central (circle (/ TRIVIAL-SIZE STEP STEP) "outline" COLOR))
                      (define sub (local [ (define central (circle (/ TRIVIAL-SIZE STEP) "outline" COLOR))
                                           (define sub (circle TRIVIAL-SIZE "outline" COLOR))]
                                    (above sub
                                           (beside (rotate 90 sub) central (rotate -90 sub)))))
                      ]
                (above sub
                       (beside (rotate 90 sub) central (rotate -90 sub) )
                       (rotate 180 sub))))


(check-expect (frac-circ (/ TRIVIAL-SIZE STEP STEP STEP))
              (local [(define central (circle (/ TRIVIAL-SIZE STEP STEP STEP) "outline" COLOR))
                      (define sub (local [ (define central (circle (/ TRIVIAL-SIZE STEP STEP) "outline" COLOR))
                                           (define sub (local [ (define central (circle (/ TRIVIAL-SIZE STEP) "outline" COLOR))
                                                                (define sub (circle TRIVIAL-SIZE "outline" COLOR))]
                                                         (above sub
                                                                (beside (rotate 90 sub) central (rotate -90 sub)))))]
                                    (above sub
                                           (beside (rotate 90 sub) central (rotate -90 sub)))))
                      ]
                (above sub
                       (beside (rotate 90 sub) central (rotate -90 sub) )
                       (rotate 180 sub))))  


;(define (frac-circ s) empty-image) ;stub


(define (frac-circ s)
  (if (<= s TRIVIAL-SIZE)
      (circle TRIVIAL-SIZE "outline" COLOR)
      (local [(define (create-frac s)
                (if (<= s TRIVIAL-SIZE)
                    (circle TRIVIAL-SIZE "outline" COLOR)
                    (local [(define central (circle s "outline" COLOR))
                            (define sub (create-frac (* s STEP)))]
                      (above sub
                             (beside (rotate 90 sub) central (rotate -90 sub) )))))]
        (local [(define central (circle s "outline" COLOR))
                      (define sub (create-frac (* s STEP)))]
                (above sub
                       (beside (rotate 90 sub) central (rotate -90 sub) )
                       (rotate 180 sub))))))   




