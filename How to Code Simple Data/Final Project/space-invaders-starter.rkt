;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname space-invaders-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

;; Space Invaders


;; Constants:

(define WIDTH  300)
(define HEIGHT 500)

(define TANK-SPEED 4)
(define MISSILE-SPEED 10)

(define BACKGROUND (empty-scene WIDTH HEIGHT "black"))

(define INVADER
  (overlay/xy (ellipse 10 15 "outline" "Chartreuse")              ;cockpit cover
              -5 6
              (ellipse 20 10 "solid"   "Chartreuse")))            ;saucer

(define INVADER-WIDTH/2  (image-width  INVADER))
(define INVADER-HEIGHT/2 (image-height INVADER))

(define TANK
  (overlay/xy (overlay (ellipse 28 8 "solid" "Orange Red")       ;tread center
                       (ellipse 30 10 "solid" "Dark Red"))     ;tread outline
              5 -14
              (above (rectangle 5 10 "solid" "Dark Red")       ;gun
                     (rectangle 20 10 "solid" "Orange Red"))))   ;main body

(define TANK-HEIGHT (image-height TANK))
(define TANK-HEIGHT/2 (/ (image-height TANK) 2))

(define TANK-WIDTH/2 (/ (image-width TANK) 2))

(define MISSILE (ellipse 5 15 "solid" " Medium Violet Red"))

(define MISSILE-WIDTH/2  (image-width  MISSILE))
(define MISSILE-HEIGHT/2 (image-height MISSILE))



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
(define I4 (make-invader 80 200 -20))          


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
;; start the world with (main G0)
;; 
(define (main game)
  (big-bang game               ; Game
    (on-tick   next-world)     ; Game -> Game
    (to-draw   render-world)   ; Game -> Image
    (stop-when last-world?)    ; Game -> Boolean
    (on-key    handle-key)))   ; Game KeyEvent -> Game

;; Game -> Game
;; produce the next world state based on the previous one

;(define (next-world game) game) ;stub

(define (next-world game)
  (make-game (next-invaders (game-invaders game) (game-missiles game))
             (next-missiles (game-missiles game) (game-invaders game))
             (next-tank (game-tank game))))

;; ListOfInvader -> LisOfInvader
;; It consumes a list of invaders and return the remaining ones in their next positions

(define (next-invaders loi lom) (add-invaders (surviving-invaders (move-invaders loi) lom)))

;; ListOfInvader -> ListOfInvader
;; It consumes a list of invaders and add randomly new invaders

(define (add-invaders loi)
  (cond [(= 1 (random 100))
         (cons (make-invader (+ (random WIDTH) 1) INVADER-HEIGHT/2 (+ (random 3) 1)) loi)]
        [(= 7 (random 100))
         (cons (make-invader (+ (random WIDTH) 1) INVADER-HEIGHT/2 (-(+ (random 3) 1))) loi)]
        [else loi]))

;; ListOfInvader ListOfMissile -> ListOfInvader
;; It consumes a list of invaders and a list of missiles and return the invaders that were not destroyed
(define (surviving-invaders loi lom)
  (cond [(empty? loi) empty]
        [(empty? lom) loi]
        [(invader-in-missiles? (first loi) lom)
         (surviving-invaders (rest loi) (remove-missile (first loi) lom))]
        [else
         (cons (first loi) (surviving-invaders (rest loi) lom))]))

;; Invader ListOfMissile -> ListOfMissile
;; It consumes an invader and a list of missiles and return the list of missiles without the missiles which overlaps with the invader

(check-expect (remove-missile I1 empty) empty)
(check-expect (remove-missile (make-invader 10 10 10) (list (make-missile 10 10))) empty)
(check-expect (remove-missile (make-invader 10 10 10) (list (make-missile 100 100))) (list (make-missile 100 100)))

;(define (remove-missile invader lom) lom) ;stub

(define (remove-missile invader lom)
  (cond [(empty? lom) empty]
        [(missile-in-invader? (first lom) invader)
         (remove-missile invader (rest lom))]
        [else
         (cons (first lom) (remove-missile invader (rest lom)))]))

;; Invader ListOfMissile -> Boolean
;; It consumes an invader and a list of missiles and verify if the invader overlaps with any of the missiles

;(define (invader-in-missiles? invader lom) true);stub

(define (invader-in-missiles? invader lom)
  (cond [(empty? lom) false]
        [(missile-in-invader?  (first lom) invader)
         true]
        [else
         (invader-in-missiles? invader (rest lom))]))

;; ListOfInvader -> LisOfInvader
;; It consumes a list of invaders and return them in their next positions

(check-expect (move-invaders empty) empty)
(check-expect (move-invaders (list I1 I4))
              (list (make-invader ( + (invader-x I1) (invader-dx I1)) ( + (invader-y I1) (abs (invader-dx I1))) (invader-dx I1))
                    (make-invader ( + (invader-x I4) (invader-dx I4)) ( + (invader-y I4) (abs (invader-dx I4))) (invader-dx I4))))
(check-expect (move-invaders (list (make-invader WIDTH 40 10) (make-invader 0 40 -10)))
              (list (make-invader 290 40 -10) (make-invader 10 40 10)))

;(define (move-invaders loi) loi) ;stub

(define (move-invaders loi)
  (cond [(empty? loi) empty]
        [else
         (cons
          (move-invader (first loi))
          (move-invaders (rest loi)))]))

;; Invader -> Invader
;; It consumes a invader and return it in its next position

(define (move-invader invader)
  (if (or (>= (invader-x invader) WIDTH) (<= (invader-x invader) 0))
      (make-invader
       (- (invader-x invader) (invader-dx invader))
       (invader-y invader)
       (- (invader-dx invader)))
      (make-invader
       ( + (invader-x invader) (invader-dx invader))
       ( + (invader-y invader) (abs (invader-dx invader)))
       (invader-dx invader))))

;; ListOfMissile ListOfInvader -> LisOfMissile
;; It consumes a list of missiles and a list of invaders and return the remaining missiles in their next positions

(define (next-missiles lom loi) (filter-missiles (intact-missiles (move-missiles lom) loi)))

;; ListOfMissile -> ListOfMissile
;; It consumes a list of missiles and return the ones wich are inside the screen

(check-expect (filter-missiles empty) empty)
(check-expect (filter-missiles (list (make-missile 10 10))) (list (make-missile 10 10)))
(check-expect (filter-missiles (list (make-missile 10 -10))) empty)

(define (filter-missiles lom)
  (cond [(empty? lom) empty]
        [(>= (missile-y (first lom)) 0)
         (cons (first lom) (filter-missiles (rest lom)))]
        [else (filter-missiles (rest lom))]))

;; ListOfMissile ListOfInvader -> ListOfMissile
;; It consumes a list of missiles and a list of invaders and return the missile that not hit a invader

(check-expect (intact-missiles empty empty) empty)
(check-expect (intact-missiles empty (list I1)) empty)
(check-expect (intact-missiles (list M1) empty) (list M1))
(check-expect (intact-missiles
               (list (make-missile 10 10))
               (list (make-invader 10 10 10)))
              empty)
(check-expect (intact-missiles
               (list (make-missile 11 10))
               (list (make-invader 100 10 10)))
              (list (make-missile 11 10)))
(check-expect (intact-missiles
               (list (make-missile 10 10))
               (list (make-invader 12 11 10) (make-invader 10 10 10)))
              empty)
(check-expect (intact-missiles
               (list (make-missile 11 10))
               (list (make-invader 120 11 10) (make-invader 100 10 10)))
              (list (make-missile 11 10)))
(check-expect (intact-missiles
               (list (make-missile 11 10) (make-missile 120 11))
               (list (make-invader 120 11 10) (make-invader 100 10 10)))
              (list (make-missile 11 10)))

(check-expect (intact-missiles
               (list (make-missile 10 10) (make-missile 12 11))
               (list (make-invader 12 11 10) (make-invader 10 10 10)))
              (list (make-missile 12 11)))

(check-expect (intact-missiles
               (list (make-missile 10 10) (make-missile 120 11))
               (list (make-invader 120 11 10) (make-invader 10 10 10)))
              empty)

;(define (intact-missiles lom loi) lom) ;stub

(define (intact-missiles lom loi)
  (cond [(empty? lom) empty]
        [(empty? loi) lom]
        [(missile-in-invaders? (first lom) loi)
         (intact-missiles (rest lom) (destroy-invader (first lom) loi))]
        [else
         (cons (first lom) (intact-missiles (rest lom) loi))]))

;; Missile ListOfInvader -> ListOfInvader
;; It consumes a missile and a list of invaders and return the list of invaders without the invader which overlaps with the missile

(check-expect (destroy-invader M1 empty) empty)
(check-expect (destroy-invader (make-missile 10 10) (list (make-invader 10 10 10))) empty)
(check-expect (destroy-invader (make-missile 10 10) (list (make-invader 100 100 10))) (list (make-invader 100 100 10)))

;(define (destroy-invader missile loi) loi) ;stub

(define (destroy-invader missile loi)
  (cond [(empty? loi) empty]
        [(missile-in-invader? missile (first loi))
         (destroy-invader missile (rest loi))]
        [else
         (cons (first loi) (destroy-invader missile (rest loi)))]))


;; Missile ListOfInvader -> Boolean
;; It consumes a missile and a list of invaders and verify if the missile overlaps with any of the invaders

;(define (missile-in-invaders? missile loi) true);

(define (missile-in-invaders? missile loi)
  (cond [(empty? loi) false]
        [(missile-in-invader? missile (first loi))
         true]
        [else
         (missile-in-invaders? missile (rest loi))]))

;; Missile Invader -> Boolean
;; It consumes a missile and an invader and verifys if they are overlapping

(check-expect (missile-in-invader? (make-missile 10 10) (make-invader 10 10 10)) true)
(check-expect (missile-in-invader? (make-missile 10 10) (make-invader (+ 10 MISSILE-WIDTH/2) (+ 10 MISSILE-HEIGHT/2) 10)) true)
(check-expect (missile-in-invader? (make-missile (+ 10 INVADER-WIDTH/2) (+ 10 INVADER-HEIGHT/2)) (make-invader 10 10 10)) true)

(check-expect (missile-in-invader? (make-missile 10 10) (make-invader 100 10 10)) false)
(check-expect (missile-in-invader? (make-missile 10 10) (make-invader (+ 100 MISSILE-WIDTH/2) (+ 10 MISSILE-HEIGHT/2) 10)) false)
(check-expect (missile-in-invader? (make-missile (+ 10 INVADER-WIDTH/2) (+ 100 INVADER-HEIGHT/2)) (make-invader 10 10 10)) false)

;(define (missile-in-invader? missile invader) true) ;stub

(define (missile-in-invader? missile invader)
  (and
   (and
    (>= (+ (missile-x missile) MISSILE-WIDTH/2) (- (invader-x invader) INVADER-WIDTH/2 ))
    (<= (- (missile-x missile) MISSILE-WIDTH/2) (+ (invader-x invader) INVADER-WIDTH/2 )))
   (and
    (>= (+ (missile-y missile) MISSILE-HEIGHT/2) (- (invader-y invader) INVADER-HEIGHT/2 ))
    (<= (- (missile-y missile) MISSILE-HEIGHT/2) (+ (invader-y invader) INVADER-HEIGHT/2 )))))

;; ListOfMissile -> LisOfMissile
;; It consumes a list of missiles and return them in their next positions

(check-expect (move-missiles empty) empty)
(check-expect (move-missiles (list M1 M4)) (list (make-missile (missile-x M1) (- (missile-y M1) MISSILE-SPEED))
                                                 (make-missile (missile-x M4) (- (missile-y M4) MISSILE-SPEED))))

;(define (move-missiles lom) lom) ;stub

(define (move-missiles lom)
  (cond [(empty? lom) empty]
        [else
         (cons
          (move-missile (first lom))
          (move-missiles (rest lom)))]))

;; Missile -> Missile
;; It consumes a missile and return it in its next position

(define (move-missile missile)
  (make-missile (missile-x missile) (- (missile-y missile) MISSILE-SPEED)))

;; Tank -> Tank
;; It consumes a tank and produces the tank in the next position

(check-expect (next-tank T0) (make-tank (+ (tank-x T0) (*(tank-dir T0) TANK-SPEED)) (tank-dir T0)))
(check-expect (next-tank T1) (make-tank (+ (tank-x T1) (*(tank-dir T1) TANK-SPEED)) (tank-dir T1)))
(check-expect (next-tank T2) (make-tank (+ (tank-x T2) (*(tank-dir T2) TANK-SPEED)) (tank-dir T2)))
(check-expect (next-tank (make-tank WIDTH 1)) (make-tank (+ (- WIDTH TANK-WIDTH/2) TANK-SPEED) 1))
(check-expect (next-tank (make-tank 0 -1)) (make-tank (+ TANK-WIDTH/2 (- TANK-SPEED)) -1))

;(define (next-tank tank) tank) ;stub

(define (next-tank tank)
  (cond [ (>= (tank-x tank) (- WIDTH TANK-WIDTH/2))
          (make-tank (+ (- WIDTH TANK-WIDTH/2) (*(tank-dir tank) TANK-SPEED)) (tank-dir tank))]
        [ (<= (tank-x tank) TANK-WIDTH/2)
          (make-tank (+ TANK-WIDTH/2 (*(tank-dir tank) TANK-SPEED)) (tank-dir tank))]
        [else
         (make-tank (+ (tank-x tank) (*(tank-dir tank) TANK-SPEED)) (tank-dir tank))]))

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

(check-expect (handle-key G0 "left")
              (make-game (game-invaders G0) (game-missiles G0) (make-tank (tank-x (game-tank G0)) -1)))
(check-expect (handle-key G0 "right")
              (make-game (game-invaders G0) (game-missiles G0) (make-tank (tank-x (game-tank G0)) 1)))
(check-expect (handle-key G1 "left")
              (make-game (game-invaders G1) (game-missiles G1) (make-tank (tank-x (game-tank G1)) -1))) 
(check-expect (handle-key G1 "right")
              (make-game (game-invaders G1) (game-missiles G1) (make-tank (tank-x (game-tank G1)) 1)))
(check-expect (handle-key G8 "left")
              (make-game (game-invaders G8) (game-missiles G8) (make-tank (tank-x (game-tank G8)) -1))) 
(check-expect (handle-key G8 "right")
              (make-game (game-invaders G8) (game-missiles G8) (make-tank (tank-x (game-tank G8)) 1)))

(check-expect (handle-key G0 " ")
              (make-game (game-invaders G0)
                         (cons (make-missile
                                (tank-x (game-tank G0))
                                ( - HEIGHT TANK-HEIGHT) )
                               (game-missiles G0))
                         (game-tank G0)))
(check-expect (handle-key G1 " ")
              (make-game (game-invaders G1)
                         (cons (make-missile
                                (tank-x (game-tank G1))
                                ( - HEIGHT TANK-HEIGHT) )
                               (game-missiles G1))
                         (game-tank G1))) 
(check-expect (handle-key G8 " ")
              (make-game (game-invaders G8)
                         (cons (make-missile
                                (tank-x (game-tank G8))
                                ( - HEIGHT TANK-HEIGHT) )
                               (game-missiles G8))
                         (game-tank G8)))
(check-expect (handle-key G8 "a") G8) 

;(define (handle-key game ke) game) ;stub

(define (handle-key game ke)
  (cond [(key=? ke " ")
         (make-game
          (game-invaders game)
          (cons
           (make-missile
            (tank-x (game-tank game))
            ( - HEIGHT TANK-HEIGHT) )
           (game-missiles game))
          (game-tank game))]
        [(key=? ke "left")
         (make-game
          (game-invaders game)
          (game-missiles game)
          (make-tank
           (tank-x (game-tank game)) -1))]
        [(key=? ke "right")
         (make-game
          (game-invaders game)
          (game-missiles game)
          (make-tank (tank-x (game-tank game)) 1))]
        [else 
         game]))

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