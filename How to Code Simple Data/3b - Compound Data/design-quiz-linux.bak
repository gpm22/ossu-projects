;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname design-quiz-linux) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;design-quiz.rkt
; PROBLEM:
;
; Design a World Program with Compound Data. You can be as creative as you like,
; but keep it simple. Above all, follow the recipes! You must also stay within
; the scope of the first part of the course. Do not use language features we
; have not seen in the videos.
;
; The program will be a ball that is traped inside a box. It is released from
; the center of the box with a certain velocity and angle in relation to
; the horizon.
;
; If you need inspiration, you can choose to create a program that allows you
; to click on a spot on the screen to create a flower, which then grows over
; time. If you click again the first flower is replaced by a new one at the
; new position.
;
; You should do all your design work in DrRacket. Following the step-by-step
; recipe in DrRacket will help you be sure that you have a quality solution.


(require 2htdp/image)
(require 2htdp/universe)

;; A ball that is traped inside a box. It is released within a certain velocity and angle in relation to the horizon.

;; ===================
;; Constants:

(define WIDTH 400)
(define HEIGHT 400)

(define MTS (empty-scene WIDTH HEIGHT "black"))

(define RADIUS 42)

(define violet-ball (circle RADIUS              "solid" "violet"))
(define indigo-ball (circle (* (/ RADIUS 7) 6)  "solid" "indigo"))
(define blue-ball   (circle (* (/ RADIUS 7) 5)  "solid" "blue"))
(define green-ball  (circle (* (/ RADIUS 7) 4)  "solid" "green"))
(define yellow-ball (circle (* (/ RADIUS 7) 3)  "solid" "yellow"))
(define orange-ball (circle (* (/ RADIUS 7) 2)  "solid" "orange"))
(define red-ball    (circle (/ RADIUS 7)        "solid" "red"))

(define rainbow-ball (overlay red-ball orange-ball yellow-ball green-ball blue-ball indigo-ball violet-ball))

;; ===================
;; Data definitions:

(define-struct ball (x y angle speed))
;; Ball is (make-ball Natural[0, WIDTH], Natural[0, HEIGHT], Natural, Natural)
;; interp. Ball is a ball with coordinate x, coordinate y, angle angle, and speed speed
;;     x is in screen coordinates (pixels)
;;     y is in screen coordinates (pixels)
;;     angle is in radians
;;     speed is in pices per tick

(define B1 (make-ball RADIUS           RADIUS       (inexact->exact (/ pi 4))             10)) ;; ball at the lower left  end with angle    45 and velocity 10 pixels/tick
(define B2 (make-ball RADIUS           (- HEIGHT RADIUS) (inexact->exact (- (/ pi 4)     ))     8)) ;; ball at the upper left  end with angle   -45 and velocity  8 pixels/tick
(define B3 (make-ball (- WIDTH RADIUS) RADIUS      (inexact->exact (/ (* 3 pi) 4))    17))    ;; ball at the lower right end with angle   135 and velocity 17 pixels/tick
(define B4 (make-ball (- WIDTH RADIUS) (- HEIGHT RADIUS) (inexact->exact (/ (* -3 pi) 4))    5))    ;; ball at the upper right end with angle  -135 and velocity  5 pixels/tick

;; Template rules used:
;; - compound: 4 fields

;; ===================
;; Functions:


;; Ball -> Ball
;; start the world with (main angle speed), where angle is the start angle of the ball
;;       and speed is the velocity (integer) of the Ball.

(define (main angle speed)
  (big-bang (make-ball (/ WIDTH 2) (/ HEIGHT 2) (inexact->exact angle) speed)  ;; Ball
    (on-tick   next-ball)                ;; Ball -> Ball
    (to-draw   render-ball)))            ;; Ball -> Image

;; Ball -> Ball
;; produce the next Ball, by advancing it speed pixel(s) to direction defined by the angle

(check-expect (next-ball B1) (make-ball (+ (ball-x B1) (inexact->exact (* (ball-speed B1) (cos (ball-angle B1))))) (+ (ball-y B1) (inexact->exact (* (ball-speed B1) (sin (ball-angle B1))))) (ball-angle B1) (ball-speed B1)))
(check-expect (next-ball B2) (make-ball (+ (ball-x B2) (inexact->exact (* (ball-speed B2) (cos (ball-angle B2))))) (+ (ball-y B2) (inexact->exact (* (ball-speed B2) (sin (ball-angle B2))))) (ball-angle B2) (ball-speed B2)))
(check-expect (next-ball B3) (make-ball (+ (ball-x B3) (inexact->exact (* (ball-speed B3) (cos (ball-angle B3))))) (+ (ball-y B3) (inexact->exact (* (ball-speed B3) (sin (ball-angle B3))))) (ball-angle B3) (ball-speed B3)))
(check-expect (next-ball B4) (make-ball (+ (ball-x B4) (inexact->exact (* (ball-speed B4) (cos (ball-angle B4))))) (+ (ball-y B4) (inexact->exact (* (ball-speed B4) (sin (ball-angle B4))))) (ball-angle B4) (ball-speed B4)))

(check-expect (next-ball (make-ball 60 (- HEIGHT RADIUS -1) 5 5)) (make-ball 60  (- HEIGHT RADIUS) -5 5))
(check-expect (next-ball (make-ball 60 (- HEIGHT RADIUS -1) 4 5)) (make-ball 60  (- HEIGHT RADIUS) -4 5))

(check-expect (next-ball (make-ball 60 (- RADIUS 1) 1 5)) (make-ball 60  RADIUS -1 5))
(check-expect (next-ball (make-ball 60 (- RADIUS 1) 2 5)) (make-ball 60  RADIUS -2 5))

(check-expect (next-ball (make-ball (- WIDTH RADIUS -1) 60 5 5)) (make-ball (- WIDTH RADIUS) 60 (inexact->exact (- (+ 5 pi))) 5))
(check-expect (next-ball (make-ball (- WIDTH RADIUS -1) 60 1 5)) (make-ball (- WIDTH RADIUS) 60 (inexact->exact (- pi 1)) 5))

(check-expect (next-ball (make-ball (- RADIUS 1) 60 2 5)) (make-ball RADIUS 60 (inexact->exact (- pi 2)) 5))
(check-expect (next-ball (make-ball (- RADIUS 1) 60 4 5)) (make-ball RADIUS 60 (inexact->exact (- (+ 4 pi))) 5))

;(define (next-ball b) b) ; stub

;<use template from Ball>

(define (next-ball b)
  (cond [(> (ball-y b) (- HEIGHT RADIUS))
         (make-ball (ball-x b) (- HEIGHT RADIUS)  (inexact->exact (- (ball-angle b)))    (ball-speed b))]
        [(< (ball-y b) RADIUS)
         (make-ball (ball-x b)  RADIUS            (inexact->exact (- (ball-angle b)))    (ball-speed b))]
        [(> (ball-x b) (- WIDTH RADIUS))
         (if (=  (get-quadrant (ball-angle b)) 1)
             (make-ball (- WIDTH RADIUS) (ball-y b) (inexact->exact (- pi (ball-angle b))) (ball-speed b))
             (make-ball (- WIDTH RADIUS) (ball-y b) (inexact->exact (- (+ (ball-angle b) pi))) (ball-speed b)))]
        [(< (ball-x b) RADIUS)
         (if (= (get-quadrant (ball-angle b)) 2)
             (make-ball RADIUS           (ball-y b) (inexact->exact (- pi (ball-angle b)))          (ball-speed b))
             (make-ball RADIUS           (ball-y b) (inexact->exact (- (+ (ball-angle b) pi)))         (ball-speed b)))]
        [else (move-ball b)]))


;; Radian -> Quadrant
;; Receive a radian angle and return its quadrant

(check-expect (get-quadrant 1) 1)
(check-expect (get-quadrant 2) 2)
(check-expect (get-quadrant 4) 3)
(check-expect (get-quadrant 5) 4)

;(define (get-quadrant angle) 1) ;stub

(define (get-quadrant angle)
  (cond [(and (>= (cos angle) 0) (>= (sin angle) 0)) 1]
        [(and (<= (cos angle) 0) (>= (sin angle) 0)) 2]
        [(and (<= (cos angle) 0) (<= (sin angle) 0)) 3]
        [(and (>= (cos angle) 0) (<= (sin angle) 0)) 4]))

;; Ball -> Ball
;; return a ball that has moved

(check-expect (move-ball B1) (make-ball (+ (ball-x B1) (inexact->exact (* (ball-speed B1) (cos (ball-angle B1))))) (+ (ball-y B1) (inexact->exact (* (ball-speed B1) (sin (ball-angle B1))))) (ball-angle B1) (ball-speed B1)))
(check-expect (move-ball B2) (make-ball (+ (ball-x B2) (inexact->exact (* (ball-speed B2) (cos (ball-angle B2))))) (+ (ball-y B2) (inexact->exact (* (ball-speed B2) (sin (ball-angle B2))))) (ball-angle B2) (ball-speed B2)))
(check-expect (move-ball B3) (make-ball (+ (ball-x B3) (inexact->exact (* (ball-speed B3) (cos (ball-angle B3))))) (+ (ball-y B3) (inexact->exact (* (ball-speed B3) (sin (ball-angle B3))))) (ball-angle B3) (ball-speed B3)))
(check-expect (move-ball B4) (make-ball (+ (ball-x B4) (inexact->exact (* (ball-speed B4) (cos (ball-angle B4))))) (+ (ball-y B4) (inexact->exact (* (ball-speed B4) (sin (ball-angle B4))))) (ball-angle B4) (ball-speed B4)))



(define (move-ball b)
  (make-ball (+ (ball-x b) (inexact->exact (* (ball-speed b) (cos (ball-angle b))))) (+ (ball-y b) (inexact->exact (* (ball-speed b) (sin (ball-angle b))))) (inexact->exact (ball-angle b)) (ball-speed b)))
 
;(make-ball (+ (ball-x b) (inexact->exact (* (ball-speed b) (cos (ball-angle b))))) (+ (ball-y b) (inexact->exact (* (ball-speed b) (sin (ball-angle b))))) (ball-angle b) (ball-speed b))
;; Ball -> image
;; render the ball image in the given coordinate

(check-expect (render-ball B1) (place-image rainbow-ball (ball-x B1) (ball-y B1) MTS))
(check-expect (render-ball B2) (place-image rainbow-ball (ball-x B2) (ball-y B2) MTS))
(check-expect (render-ball B3) (place-image rainbow-ball (ball-x B3) (ball-y B3) MTS))
(check-expect (render-ball B4) (place-image rainbow-ball (ball-x B4) (ball-y B4) MTS))


;(define (render-ball b) MTS) ;stub

;<use template from ball>

(define (render-ball b)
  (place-image rainbow-ball (ball-x b) (ball-y b) MTS))