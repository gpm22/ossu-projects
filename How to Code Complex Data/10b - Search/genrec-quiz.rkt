;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname genrec-quiz) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

 ;PROBLEM 1:
 
 ;In the lecture videos we designed a function to make a Sierpinski triangle fractal. 
 
 ;Here is another geometric fractal that is made of circles rather than triangles


 ; img of two circles inside a circle;
 
 ;Design a function to create this circle fractal of size n and colour c.
 

(define CUT-OFF 5)

;; Natural String -> Image
;; produce a circle fractal of size n and colour c

(check-expect (circle-fractal CUT-OFF "green") (circle CUT-OFF "outline" "green"))
(check-expect (circle-fractal (* 2 CUT-OFF) "green")
              (local [(define sub (circle CUT-OFF "outline" "green") )]
                (overlay (circle (* 2 CUT-OFF) "outline" "green")
                         (beside sub sub))))

(check-expect (circle-fractal (* 4 CUT-OFF) "green")
              (local [(define sub (local [(define sub (circle CUT-OFF "outline" "green") )]
                                    (overlay (circle (* 2 CUT-OFF) "outline" "green")
                                             (beside sub sub))) )]
                (overlay (circle (* 4 CUT-OFF) "outline" "green")
                         (beside sub sub))))

;(define (circle-fractal n c) empty-image) ;stub

(define (circle-fractal n c)
  (cond [(<= n CUT-OFF) (circle CUT-OFF "outline" c)]
        [else
         (local [(define sub (circle-fractal (/ n 2) c) )]
                (overlay (circle n "outline" c)
                         (beside sub sub)))]))





 ;PROBLEM 2:
 
 ;Below you will find some data definitions for a tic-tac-toe solver. 
 
 ;In this problem we want you to design a function that produces all 
 ;possible filled boards that are reachable from the current board. 
 
 ;In actual tic-tac-toe, O and X alternate playing. For this problem
 ;you can disregard that. You can also assume that the players keep 
 ;placing Xs and Os after someone has won. This means that boards that 
 ;are completely filled with X, for example, are valid.
 
 ;Note: As we are looking for all possible boards, rather than a winning 
 ;board, your function will look slightly different than the solve function 
 ;you saw for Sudoku in the videos, or the one for tic-tac-toe in the 
 ;lecture questions. 
 

;; Value is one of:
;; - false
;; - "X"
;; - "O"
;; interp. a square is either empty (represented by false) or has and "X" or an "O"

#;
(define (fn-for-value v)
  (cond [(false? v) (...)]
        [(string=? v "X") (...)]
        [(string=? v "O") (...)]))

;; Board is (listof Value)
;; a board is a list of 9 Values
(define B0 (list false false false
                 false false false
                 false false false))

(define B1 (list false "X"   "O"   ; a partly finished board
                 "O"   "X"   "O"
                 false false "X")) 

(define B2 (list "X"  "X"  "O"     ; a board where X will win
                 "O"  "X"  "O"
                 "X" false "X"))

(define B3 (list "X" "O" "X"       ; a board where Y will win
                 "O" "O" false
                 "X" "X" false))

#;
(define (fn-for-board b)
  (cond [(empty? b) (...)]
        [else 
         (... (fn-for-value (first b))
              (fn-for-board (rest b)))]))

;; Board -> (listof Board)
;; it consumes a board and produces a list of possible fully boards

(check-expect (create-boards B3) (list (list "X" "O" "X"       
                                             "O" "O" "X"
                                             "X" "X" "X")
                                       (list "X" "O" "X"       
                                             "O" "O" "X"
                                             "X" "X" "O")
                                       (list "X" "O" "X"       
                                             "O" "O" "O"
                                             "X" "X" "X")
                                       (list "X" "O" "X"       
                                             "O" "O" "O"
                                             "X" "X" "O")))

(check-expect (create-boards B2) (list (list "X"  "X"  "O"     
                                             "O"  "X"  "O"
                                             "X"  "X" "X")
                                       (list "X"  "X"  "O"    
                                             "O"  "X"  "O"
                                             "X"  "O" "X")))
                                  

;(define (create-boards bd) empty) ;stub

(define (create-boards bd)
  (local [(define (create-boards--bd bd)
            (if (full? bd)
                (list bd)
                 (create-boards--lobd (next-boards bd))))

          (define (create-boards--lobd lobd)
            (cond [(empty? lobd) empty]
                  [else
                   (local [(define try (create-boards--bd (first lobd)))]
                     (if (not (false? try))
                        (append try (create-boards--lobd (rest lobd)))
                         (create-boards--lobd (rest lobd))))]))]
    (create-boards--lobd (list bd))))


;; Board -> Boolean
;; produces if the Board is full or not

(check-expect (full? B0) false)
(check-expect (full? B1) false)
(check-expect (full? B2) false)
(check-expect (full? B3) false)

(check-expect (full? (list "X" "O" "X"       
                           "O" "O" "X"
                           "X" "X" "X")) true)
(check-expect (full? (list "X" "O" "X"       
                           "O" "O" "X"
                           "X" "X" "O")) true)
(check-expect (full? (list "X" "O" "X"       
                           "O" "O" "O"
                           "X" "X" "X")) true)
(check-expect (full? (list "X" "O" "X"       
                           "O" "O" "O"
                           "X" "X" "X")) true)

;(define (full? bd) false) ;stub

(define (full? bd)
  (andmap string? bd))

;; Board -> (listof Board)
;; procude the next boards

(check-expect (next-boards B3) (list (list "X" "O" "X"       
                                           "O" "O" "X"
                                           "X" "X" false)
                                     (list "X" "O" "X"       
                                           "O" "O" "O"
                                           "X" "X" false)))

(check-expect (next-boards B2) (list (list "X"  "X"  "O"     
                                           "O"  "X"  "O"
                                           "X"  "X" "X")
                                     (list "X"  "X"  "O"    
                                           "O"  "X"  "O"
                                           "X"  "O" "X")))

;(define (next-boards bd) empty)

(define (next-boards bd)
  (local [(define (next-boards bd p)
            (cond [(> p 8) empty]
                  [(false? (read-square bd p))
                   (map (lambda (v)
                          (fill-square bd p v))
                        (list "X" "O"))]
                  [else
                   (next-boards bd (+ p 1))]))]
    (next-boards bd 0)))

;; Board Pos Val -> Board
;; produce new board with val at given position
(check-expect (fill-square B1 0 "x")
              (cons "x" (rest B1)))

(define (fill-square bd p nv)  
  (cond [(zero? p) (cons nv (rest bd))]
        [else
         (cons (first bd)
               (fill-square (rest bd) (sub1 p) nv))]))

;; Board Pos -> Val or false
;; Produce value at given position on board.
(check-expect (read-square B2 5) "O")
(check-expect (read-square B3 7) "X")

(define (read-square bd p)  
  (cond [(zero? p) (first bd)]
        [else
         (read-square (rest bd) (sub1 p))]))

 ;PROBLEM 3:
 
 ;Now adapt your solution to filter out the boards that are impossible if 
 ;X and O are alternating turns. You can continue to assume that they keep 
 ;filling the board after someone has won though. 
 
 ;You can assume X plays first, so all valid boards will have 5 Xs and 4 Os.
 
 ;NOTE: make sure you keep a copy of your solution from problem 2 to answer 
 ;the questions on edX.
 


;; (listof Board) -> (listof Board)
;; it consumes a list of boards and return the valid ones,
;;    which are the ones with 5Xs and 4 Os

(check-expect (filter-boards (list (list "X" "O" "X"       
                                           "O" "O" "X"
                                           "X" "X" false)
                                     (list "X" "O" "X"       
                                           "O" "O" "O"
                                           "X" "X" false))) empty)

(check-expect (filter-boards (list (list "X" "O" "X"       
                                             "O" "O" "X"
                                             "X" "X" "X")
                                       (list "X" "O" "X"       
                                             "O" "O" "X"
                                             "X" "X" "O")
                                       (list "X" "O" "X"       
                                             "O" "O" "O"
                                             "X" "X" "X")
                                       (list "X" "O" "X"       
                                             "O" "O" "O"
                                             "X" "X" "O")))
              (list (list "X" "O" "X"       
                          "O" "O" "X"
                          "X" "X" "O")
                    (list "X" "O" "X"       
                          "O" "O" "O"
                          "X" "X" "X")))

;(define (filter-boards lobd) empty) ;stub

(define (filter-boards lobd)
  (filter valid? lobd))

;; Board -> Boolean
;; verify if a board is valid, which means it has 5Xs and 4 Os

(check-expect (valid? (list "X" "O" "X"       
                            "O" "O" "X"
                            "X" "X" "O")) true)

(check-expect (valid? (list "X" "O" "X"       
                            "O" "O" "X"
                            "X" "X" "X")) false)


;(define (valid? bd) false) ;stub

(define (valid? bd)
  (and
   (full? bd)
   (= 5 (length (filter (lambda (s) (string=? s "X")) bd)))
   (= 4 (length (filter (lambda (s) (string=? s "O")) bd)))))

