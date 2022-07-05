;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname cantor) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; cantor.rkt


;PROBLEM:

;A Cantor Set is another fractal with a nice simple geometry.
;The idea of a Cantor set is to have a bar (or rectangle) of
;a certain width w, then below that are two recursive calls each
;of 1/3 the width, separated by a whitespace of 1/3 the width.

;So this means that the
;  width of the whitespace   wc  is  (/ w 3)
;  width of recursive calls  wr  is  (/ (- w wc) 2)

; So as it goes it gets wider and taller of course.


;PROBLEM A:

;Design a function that consumes a width and produces a cantor set of 
;the given width.

(define CUTOFF 1)
(define HEIGHT 10)
(define COLOR "green")
(define COLOR-BLK "black")

;; Number -> Image
;; it consumes a number and produces a cantor set of the given width.

(check-expect (cantor CUTOFF) (rectangle CUTOFF HEIGHT "solid" COLOR))

(check-expect (cantor (* 3 CUTOFF))
              (local [(define sub (rectangle CUTOFF HEIGHT "solid" COLOR))
                      (define blk (rectangle CUTOFF HEIGHT "solid" COLOR-BLK))]
                (above (rectangle (* 3 CUTOFF) HEIGHT "solid" COLOR)
                       (beside sub blk sub))))

(check-expect (cantor (* 9 CUTOFF))
              (local [(define sub (local [(define sub (rectangle CUTOFF HEIGHT "solid" COLOR))
                                          (define blk (rectangle CUTOFF HEIGHT "solid" COLOR-BLK))]
                                    (above (rectangle (* 3 CUTOFF) HEIGHT "solid" COLOR)
                                           (beside sub blk sub))))
                      (define blk (rectangle (* 3 CUTOFF) HEIGHT "solid" COLOR-BLK))]
                (above (rectangle (* 9 CUTOFF) HEIGHT "solid" COLOR)
                       (beside sub blk sub))))

;(define (cantor w) empty-image) ;stub

(define (cantor w)
  (if (<= w CUTOFF)
      (rectangle CUTOFF HEIGHT "solid" COLOR)
      (local [(define sub (cantor (/ w 3)))
                      (define blk (rectangle (/ w 3) HEIGHT "solid" COLOR-BLK))]
                (above (rectangle w HEIGHT "solid" COLOR)
                       (beside sub blk sub)))))

;PROBLEM B:

;Add a second parameter to your function that controls the percentage 
;of the recursive call that is white each time. Calling your new function
;with a second argument of 1/3 would produce the same images as the old 
;function.

;; Number Number -> Number
;; it consumes the proportion and the number of interactions and produces the initial width

(check-expect (initial-width (/ 1 4) 2) (/ (* 64 CUTOFF) 9))  

(define (initial-width s n)
  (* CUTOFF (expt (/ 2 (- 1 s)) n)))

;; Number Number -> Image
;; it consumes a number and produces a cantor set of the given width and void area proportion.
;; w must be w =(* CUTOFF (expt (/ 2 (- 1 s)) n)), where s is the proportion and n is the number of interactions

(check-expect (cantor-step CUTOFF (/ 1 3) ) (rectangle CUTOFF HEIGHT "solid" COLOR))

(check-expect (cantor-step (* 3 CUTOFF) (/ 1 3))
              (local [(define sub (rectangle CUTOFF HEIGHT "solid" COLOR))
                      (define blk (rectangle CUTOFF HEIGHT "solid" COLOR-BLK))]
                (above (rectangle (* 3 CUTOFF) HEIGHT "solid" COLOR)
                       (beside sub blk sub))))

(check-expect (cantor-step (* 9 CUTOFF) (/ 1 3))
              (local [(define sub (local [(define sub (rectangle CUTOFF HEIGHT "solid" COLOR))
                                          (define blk (rectangle CUTOFF HEIGHT "solid" COLOR-BLK))]
                                    (above (rectangle (* 3 CUTOFF) HEIGHT "solid" COLOR)
                                           (beside sub blk sub))))
                      (define blk (rectangle (* 3 CUTOFF) HEIGHT "solid" COLOR-BLK))]
                (above (rectangle (* 9 CUTOFF) HEIGHT "solid" COLOR)
                       (beside sub blk sub))))


(check-expect (cantor-step CUTOFF (/ 1 2) ) (rectangle CUTOFF HEIGHT "solid" COLOR))

(check-expect (cantor-step (* 4 CUTOFF) (/ 1 2))
              (local [(define sub (rectangle (/ (- (* 4 CUTOFF) (* 4 CUTOFF (/ 1 2))) 2) HEIGHT "solid" COLOR))
                      (define blk (rectangle (* 4 CUTOFF (/ 1 2))  HEIGHT "solid" COLOR-BLK))]
                (above (rectangle (* 4 CUTOFF) HEIGHT "solid" COLOR)
                       (beside sub blk sub))))

(check-expect (cantor-step (* 16 CUTOFF) (/ 1 2))
              (local [(define sub (local [(define sub (rectangle (* 16 CUTOFF (/ 1 16)) HEIGHT "solid" COLOR))
                                          (define blk (rectangle (* 16 CUTOFF (/ 1 8)) HEIGHT "solid" COLOR-BLK))]
                                    (above (rectangle (* 16 CUTOFF (/ 1 4)) HEIGHT "solid" COLOR)
                                           (beside sub blk sub))))
                      (define blk (rectangle (* 16 CUTOFF (/ 1 2)) HEIGHT "solid" COLOR-BLK))]
                (above (rectangle (* 16 CUTOFF) HEIGHT "solid" COLOR)
                       (beside sub blk sub))))


(check-expect (cantor-step CUTOFF (/ 1 4) ) (rectangle CUTOFF HEIGHT "solid" COLOR))

(check-expect (cantor-step (/ (* 8 CUTOFF) 3) (/ 1 4))
              (local [(define sub (rectangle (/ (- (/ (* 8 CUTOFF) 3) (*(/ (* 8 CUTOFF) 3)(/ 1 4))) 2) HEIGHT "solid" COLOR))
                      (define blk (rectangle (* (/ (* 8 CUTOFF) 3) (/ 1 4))  HEIGHT "solid" COLOR-BLK))]
                (above (rectangle (/ (* 8 CUTOFF) 3) HEIGHT "solid" COLOR)
                       (beside sub blk sub))))

(check-expect (cantor-step ( / (* 64 CUTOFF) 9) (/ 1 4))
              (local [(define sub (local [(define sub (rectangle CUTOFF HEIGHT "solid" COLOR))
                                          (define blk (rectangle (* 2 CUTOFF (/ 1 3)) HEIGHT "solid" COLOR-BLK))]
                                    (above (rectangle ( / (* 8 CUTOFF) 3) HEIGHT "solid" COLOR)
                                           (beside sub blk sub))))
                      (define blk (rectangle (* ( / (* 64 CUTOFF) 9) (/ 1 4)) HEIGHT "solid" COLOR-BLK))]
                (above (rectangle ( / (* 64 CUTOFF) 9) HEIGHT "solid" COLOR)
                       (beside sub blk sub))))


;(define (cantor-step w s) empty-image) ;stub

(define (cantor-step w s)
  (if (<= w CUTOFF)
      (rectangle CUTOFF HEIGHT "solid" COLOR)
      (local [(define sub (cantor-step (/ (- w (* w s)) 2) s))
                      (define blk (rectangle (* w s) HEIGHT "solid" COLOR-BLK))]
                (above (rectangle w HEIGHT "solid" COLOR)
                       (beside sub blk sub)))))

;PROBLEM C:

;Now you can make a fun world program that works this way:
;  The world state should simply be the most recent x coordinate of the mouse.
  
;  The to-draw handler should just call your new cantor function with the
;  width of your MTS as its first argument and the last x coordinate of
;  the mouse divided by that width as its second argument.

;; My world program  (make this more specific)

;; =================
;; Constants:

(define MTS-HEIGHT 400)
(define MTS-WIDTH  400)

(define MTS (empty-scene MTS-WIDTH MTS-HEIGHT "black"))

;; =================
;; Data definitions:

;; X-Mouse is Natural
;; .It is the mouse's x coordinate

;; =================
;; Functions:

;; WS -> WS
;; start the world with (main (/ 1 3))
;; 
(define (main ws)
  (big-bang ws                   ; WS
            (to-draw   render)   ; WS -> Image
            (on-mouse  handle-mouse)))    ; WS Integer Integer MouseEvent -> WS


;; WS -> Image
;; render ... 
;; !!!
(define (render ws)
  (overlay (cantor-step MTS-WIDTH (/ ws MTS-WIDTH)) MTS))



; WS Integer Integer MouseEvent -> WS
(define (handle-mouse ws x y me)
  (cond [(mouse=? me "button-down") x]
        [else ws]))