;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname max-exits-to-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))

;; max-exits-to.rkt


;PROBLEM:

;Using the following data definition, design a function that produces the room to which the greatest 
;number of other rooms have exits (in the case of a tie you can produce any of the rooms in the tie).


;; Data Definitions: 

(define-struct room (name exits))
;; Room is (make-room String (listof Room))
;; interp. the room's name, and list of rooms that the exits lead to

;A -> B
(define H1 (make-room "A" (list (make-room "B" empty))))

; A <-> B
(define H2 
  (shared ((-0- (make-room "A" (list (make-room "B" (list -0-))))))
    -0-)) 

; A -> B -> C -
; ^-----------|
(define H3
  (shared ((-A- (make-room "A" (list -B-)))
           (-B- (make-room "B" (list -C-)))
           (-C- (make-room "C" (list -A-))))
    -A-))
           

; A -> B <-> C
; ^\    \
; | -> D -> E -> F
; ----------|
(define H4
  (shared ((-A- (make-room "A" (list -B- -D-)))
           (-B- (make-room "B" (list -C- -E-)))
           (-C- (make-room "C" (list -B-)))
           (-D- (make-room "D" (list -E-)))
           (-E- (make-room "E" (list -F- -A-)))
           (-F- (make-room "F" (list))))
    -A-))

; A -> B   <->   C
; ^\    \       / \
; | -> D -> E <    \
; ----------|\-> F <-
(define H5
  (shared ((-A- (make-room "A" (list -B- -D-)))
           (-B- (make-room "B" (list -C- -E-)))
           (-C- (make-room "C" (list -B- -E- -F-)))
           (-D- (make-room "D" (list -E-)))
           (-E- (make-room "E" (list -F- -A-)))
           (-F- (make-room "F" (list))))
    -A-))

;; template: structural recursion, encapsulate w/ local, tail-recursive w/ worklist, 
;;           context-preserving accumulator what rooms have we already visited
#;
(define (fn-for-house r0)
  ;; todo is (listof Room); a worklist accumulator
  ;; visited is (listof String); context preserving accumulator, names of rooms already visited
  (local [(define (fn-for-room r todo visited) 
            (if (member (room-name r) visited)
                (fn-for-lor todo visited)
                (fn-for-lor (append (room-exits r) todo)
                            (cons (room-name r) visited)))) ; (... (room-name r))
          (define (fn-for-lor todo visited)
            (cond [(empty? todo) (...)]
                  [else
                   (fn-for-room (first todo) 
                                (rest todo)
                                visited)]))]
    (fn-for-room r0 empty empty)))


;; Room -> String
;; It consumes a Room and produces the room to which the greatest 
;;     number of other rooms have exits 

(check-expect (max-exits-to H1) "B")
(check-expect (max-exits-to H2) "A")
(check-expect (max-exits-to H3) "A")
(check-expect (max-exits-to H4) "E")
(check-expect (max-exits-to (first (room-exits ;; F
                                  (second (room-exits
                                           (first (room-exits H4)))))))
              "F")
(check-expect (max-exits-to H5) "E")

;(define (max-exits-to r) (room-name r)) ;stub


(define (max-exits-to r0)
  ;; todo is (listof Room); a worklist accumulator
  ;; visited is (listof String); context preserving accumulator, names of rooms already visited
  ;; exits is (listof String); it is all the exits combined
  (local [
          (define (count los s)
            (length (filter (lambda (s1) (string=? s1 s)) los)))

          (define (get-larger los0)
            (local [(define (get-larger los acc room)
                      (cond [(empty? los)
                             (if (string=? room "")
                                 (room-name r0)
                                 room)]
                            [else
                             (local [(define act (count los0 (first los)))]
                               (if (> act acc)
                                   (get-larger (rest los) act (first los))
                                   (get-larger (rest los) acc room)))]))]
            (get-larger los0 0 "")))
            

          (define (fn-for-room r todo visited exits) 
            (if (member (room-name r) visited)
                (fn-for-lor todo visited exits)
                (fn-for-lor (append (room-exits r) todo)
                            (cons (room-name r) visited)
                            (append (map room-name (room-exits r))
                                    exits))))
          
          (define (fn-for-lor todo visited exits)
            (cond [(empty? todo) exits]
                  [else
                   (fn-for-room (first todo) 
                                (rest todo)
                                visited
                                exits)]))]
     (get-larger (fn-for-room r0 empty empty empty))))



