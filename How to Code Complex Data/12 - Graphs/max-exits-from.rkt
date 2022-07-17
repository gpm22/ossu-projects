;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname max-exits-from) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))

;; max-exits-from.rkt


;PROBLEM:

;Using the following data definition, design a function that produces the room with the most exits 
;(in the case of a tie you can produce any of the rooms in the tie).


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
;; it consumes a room and produces the name of the room with the most exits;

(check-expect (most-exits H1) "A")
(check-expect (most-exits H2) "A")
(check-expect (most-exits H3) "A")
(check-expect (most-exits H4) "A")
(check-expect (most-exits (first (room-exits ;; F
                                  (second (room-exits
                                           (first (room-exits H4)))))))
              "F")
(check-expect (most-exits H5) "C")
 
;(define (most-exits r) r) ;stub

(define (most-exits r0)
  ;; todo is (listof Room); a worklist accumulator
  ;; visited is (listof String); context preserving accumulator, names of rooms already visited
  ;; acc is Room; is the actual Room with most exits
  (local [(define (fn-for-room r todo visited acc) 
            (if (member (room-name r) visited)
                (fn-for-lor todo visited acc)
                (fn-for-lor (append (room-exits r) todo)
                            (cons (room-name r) visited)
                            (if (> (length (room-exits r)) (length (room-exits acc)))
                                r
                                acc))))
          (define (fn-for-lor todo visited acc)
            (cond [(empty? todo) acc]
                  [else
                   (fn-for-room (first todo) 
                                (rest todo)
                                visited
                                acc)]))]
    (room-name (fn-for-room r0 empty empty r0)))) 




