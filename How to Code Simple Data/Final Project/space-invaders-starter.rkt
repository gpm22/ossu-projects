;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname space-invaders-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

;; Space Invaders


;; Constants:

(define WIDTH  300)
(define HEIGHT 500)

(define INVADER-X-SPEED 1.5)  ;speeds (not velocities) in pixels per tick
(define INVADER-Y-SPEED 1.5)
(define TANK-SPEED 2)
(define MISSILE-SPEED 10)

(define HIT-RANGE 10)

(define INVADE-RATE 100)

(define BACKGROUND (empty-scene WIDTH HEIGHT "black"))

(define INVADER
  (overlay/xy (ellipse 10 15 "outline" "Chartreuse")              ;cockpit cover
              -5 6
              (ellipse 20 10 "solid"   "Chartreuse")))            ;saucer

(define TANK
  (overlay/xy (overlay (ellipse 28 8 "solid" "Orange Red")       ;tread center
                       (ellipse 30 10 "solid" "Dark Red"))     ;tread outline
              5 -14
              (above (rectangle 5 10 "solid" "Dark Red")       ;gun
                     (rectangle 20 10 "solid" "Orange Red"))))   ;main body

(define TANK-HEIGHT/2 (/ (image-height TANK) 2))

(define MISSILE (ellipse 5 15 "solid" " Medium Violet Red"))



;; Data Definitions:

(define-struct game (invaders missiles tank))
;; Game is (make-game  (listof Invader) (listof Missile) Tank)
;; interp. the current state of a space invaders game
;;         with the current invaders, missiles and tank position

;; Game constants defined below Missile data definition

#;
(define (fn-for-game s)
  (... (fn-for-loinvader (game-invaders s))
       (fn-for-lom (game-missiles s))
       (fn-for-tank (game-tank s))))



(define-struct tank (x dir))
;; Tank is (make-tank Number Integer[-1, 1])
;; interp. the tank location is x, HEIGHT - TANK-HEIGHT/2 in screen coordinates
;;         the tank moves TANK-SPEED pixels per clock tick left if dir -1, right if dir 1

(define T0 (make-tank (/ WIDTH 2) 1))   ;center going right
(define T1 (make-tank 50 1))            ;going right
(define T2 (make-tank 50 -1))           ;going left

#;
(define (fn-for-tank t)
  (... (tank-x t) (tank-dir t)))



(define-struct invader (x y dx))
;; Invader is (make-invader Number Number Number)
;; interp. the invader is at (x, y) in screen coordinates
;;         the invader along x by dx pixels per clock tick

(define I1 (make-invader 150 100 12))           ;not landed, moving right
(define I2 (make-invader 150 HEIGHT -10))       ;exactly landed, moving left
(define I3 (make-invader 150 (+ HEIGHT 10) 10)) ;> landed, moving right


#;
(define (fn-for-invader invader)
  (... (invader-x invader) (invader-y invader) (invader-dx invader)))


(define-struct missile (x y))
;; Missile is (make-missile Number Number)
;; interp. the missile's location is x y in screen coordinates

(define M1 (make-missile 150 300))                               ;not hit I1
(define M2 (make-missile (invader-x I1) (+ (invader-y I1) 10)))  ;exactly hit I1
(define M3 (make-missile (invader-x I1) (+ (invader-y I1)  5)))  ;> hit I1
(define M4 (make-missile 100 200))

#;
(define (fn-for-missile m)
  (... (missile-x m) (missile-y m)))



(define G0 (make-game empty empty T0))
(define G1 (make-game empty empty T1))
(define G2 (make-game empty empty T2))
(define G3 (make-game empty (list M1) T1))
(define G4 (make-game empty (list M1 M4) T1))
(define G5 (make-game (list I1) empty T1))
(define G6 (make-game (list I1 I2) empty T1))
(define G7 (make-game (list I1) (list M1) T1))
(define G8 (make-game (list I1 I2) (list M1 M2) T1))

;; Functions

;; Game -> Game
;; start the world with ...
;; 
(define (main game)
  (big-bang game                       ; Game
    (on-tick   next-world)     ; Game -> Game
    (to-draw   render-world)   ; Game -> Image
    (stop-when last-world?)    ; Game -> Boolean
    (on-key    handle-key)))   ; Game KeyEvent -> Game

;; Game -> Game
;; produce the next world state based on the previous one
;; !!!
(check-expect (next-world G0)
              (make-game empty empty (make-tank (+ (tank-x T0) (*(tank-dir T0) TANK-SPEED)) (tank-dir T0))))

(check-expect (next-world G1)
              (make-game empty empty (make-tank (+ (tank-x T1) (*(tank-dir T1) TANK-SPEED)) (tank-dir T1))))

(check-expect (next-world G2)
              (make-game empty empty (make-tank (+ (tank-x T2) (*(tank-dir T2) TANK-SPEED)) (tank-dir T2))))

(check-expect (next-world G3)
              (make-game
               empty
               (list (make-missile (missile-x M1) (+ (missile-y M1) MISSILE-SPEED)))
               (make-tank (+ (tank-x T1) (*(tank-dir T1) TANK-SPEED)) (tank-dir T1))))

(check-expect (next-world G4)
              (make-game
               empty
               (list (make-missile (missile-x M1) (+ (missile-y M1) MISSILE-SPEED))
                     (make-missile (missile-x M4) (+ (missile-y M4) MISSILE-SPEED)))
               (make-tank (+ (tank-x T1) (*(tank-dir T1) TANK-SPEED)) (tank-dir T1))))

(define (next-world game) game)


;; Game -> Image
;; render the actual game state 
;; !!!
(check-expect (render-world G0)
              (place-image empty-image 0 0
                           (place-image empty-image 0 0
                                        (place-image TANK (tank-x T0) ( - HEIGHT TANK-HEIGHT/2) BACKGROUND))))

(check-expect (render-world G1)
              (place-image empty-image 0 0
                           (place-image empty-image 0 0
                                        (place-image TANK (tank-x T1) ( - HEIGHT TANK-HEIGHT/2) BACKGROUND))))

(check-expect (render-world G2)
              (place-image empty-image 0 0
                           (place-image empty-image 0 0
                                        (place-image TANK (tank-x T2) ( - HEIGHT TANK-HEIGHT/2) BACKGROUND))))

(check-expect (render-world G3)
              (place-image empty-image 0 0
                           (place-image MISSILE (missile-x M1) (missile-y M1)
                                        (place-image TANK (tank-x T1) ( - HEIGHT TANK-HEIGHT/2) BACKGROUND))))

(check-expect (render-world G4)
              (place-image empty-image 0 0
                           (place-image MISSILE (missile-x M1) (missile-y M1)
                                        (place-image MISSILE (missile-x M4) (missile-y M4)
                                                     (place-image TANK (tank-x T1) ( - HEIGHT TANK-HEIGHT/2) BACKGROUND)))))


(check-expect (render-world G5)
              (place-image INVADER (invader-x I1) (invader-y I1)
                           (place-image empty-image 0 0
                                        (place-image TANK (tank-x T2) ( - HEIGHT TANK-HEIGHT/2) BACKGROUND))))

(check-expect (render-world G6)
              (place-image INVADER (invader-x I1) (invader-y I1)
                           (place-image INVADER (invader-x I2) (invader-y I2)
                                        (place-image empty-image 0 0
                                                     (place-image TANK (tank-x T2) ( - HEIGHT TANK-HEIGHT/2) BACKGROUND)))))

;(define (render-world game) BACKGROUND) ;stub

(define (render-world s)
  (render-invaders (game-invaders s)
                   (render-missiles (game-missiles s)
                                    (render-tank (game-tank s)))))

;; ListOfInvader Image -> Image
;; Consumes a list of invaders and render them above the given image

(define (render-invaders loi img)
  (cond [(empty? loi) img]
        [else
         (place-image
          INVADER
          (invader-x (first loi))
          (invader-y (first loi))
          (render-invaders (rest loi) img))]))

;; ListOfMissile Image -> Image
;; Consumes a list of missiles and render them above the given image

(define (render-missiles lom img)
  (cond [(empty? lom) img]
        [else
         (place-image
          MISSILE
          (missile-x (first lom))
          (missile-y (first lom))
          (render-missiles (rest lom) img))]))

;; Tank-> Image
;; Consumes a tank and render it above the BACKGROUND

(define (render-tank tank)
  (place-image TANK (tank-x tank) ( - HEIGHT TANK-HEIGHT/2) BACKGROUND))


;; Game KeyEvent -> Game
;; Handle keys
;; !!!
(define (handle-key game ke)
  (cond [(key=? ke " ") (... game)]
        [else 
         (... Game)]))

;; Game -> Boolean
;; It produces true when an invader reaches the bottom of the screen, which will cause the end of the game.
;; !!!
(check-expect (last-world? G0) false)
(check-expect (last-world? G1) false)
(check-expect (last-world? G2) false)
(check-expect (last-world? G3) false)
(check-expect (last-world? G4) false)
(check-expect (last-world? G5) false)
(check-expect (last-world? G6) true)
               
;(define (last-world? game) false) ;stub

(define (last-world? s)
  (invader-landed? (game-invaders s)))

;; ListOfInvader -> Boolean
;; It consumes a list of invaders and produces true when the y-coordinate of any invader is >= HEIGHT

(check-expect (invader-landed? empty) false)
(check-expect (invader-landed? (list I1)) false)
(check-expect (invader-landed? (list I2)) true)
(check-expect (invader-landed? (list I1 I2)) true)

;(define (invader-landed? loi) false) ;stub

(define (invader-landed? loi)
  (cond [(empty? loi) false]
        [else
         (if (>= (invader-y (first loi)) HEIGHT)
             true
             (invader-landed? (rest loi)))]))