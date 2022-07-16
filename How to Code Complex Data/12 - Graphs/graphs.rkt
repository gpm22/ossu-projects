;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname graphs) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))

;; graphs.rkt


;PROBLEM: 

;Imagine you are suddenly transported into a mysterious house, in which all
;you can see is the name of the room you are in, and any doors that lead OUT
;of the room.  One of the things that makes the house so mysterious is that
;the doors only go in one direction. You can't see the doors that lead into
;the room.

;Here are some examples of such a house:

;A  -> B

;A <-> B

; A -> B -> C -
; ^-----------|

; A -> B <-> C
; ^\    \
; | -> D -> E -> F
; ----------|


;In computer science, we refer to such an information structure as a directed
;graph. Like trees, in directed graphs the arrows have direction. But in a
;graph it is  possible to go in circles, as in the second example above. It
;is also possible for two arrows to lead into a single node, as in the fourth
;example.

   
;Design a data definition to represent such houses. Also provide example data
;for the four houses above.

;; Data definition:

(define-struct room (name exits))
;; Room is (make-room String (listof Room))

(define H0 (make-room "A" (list (make-room "B" empty))))

(define H1 (shared ((-0- (make-room "A" (list (make-room "B" (list -0-))))))
             -0-))

(define H2 (shared ((-A- (make-room "A" (list -B-)))
                    (-B- (make-room "B" (list -C-)))
                    (-C- (make-room "C" (list -A-))))
             -A-))

; A -> B <-> C
; ^\    \
; | -> D -> E -> F
; ----------|

(define H3 (shared ((-A- (make-room "A" (list -B- -D-)))
                    (-B- (make-room "B" (list -E- -C-)))
                    (-C- (make-room "C" (list -B-)))
                    (-D- (make-room "D" (list -E-)))
                    (-E- (make-room "E" (list -F- -A-)))
                    (-F- (make-room "F" empty)))
             -A-))

#;
(define (fn-for-room room0)
  ;; todo: (listof Room); rooms to be visited by fn-for-room
  ;; done: (listof String); names of rooms already visited (names must be uniques)
  (local [(define (fn-for-room room todo done)
            (if (member (room-name room) done)
                (fn-for-lor todo done)
                (fn-for-lor (append (room-exits room) todo) 
                            (cons (room-name room) done))))
          (define (fn-for-lor todo done)
            (cond [(empty? todo) (...)]
                  [else
                    (fn-for-room (first todo) 
                                 (rest todo) 
                                 done)]))]
         (fn-for-room nod0 empty empty)))

;; Functions

; PROBLEM

; Design a function that consumes a Room and a room name, an produces true if it is possible
; to reach a room with the given name starting at the fiven room. For example:

; (reachable? H0 "A") produces true
; (reachable? H0 "B") produces true
; (reachable? H0 "C") produces false
; (reachable? H3 "F") produces true

;; Room String -> Boolean
;; it consumes a Room and a room name, an produces true if it is possible
;;     to reach a room with the given name starting at the fiven room.

(check-expect (reachable? H0 "A")  true)
(check-expect (reachable? H0 "B")  true)
(check-expect (reachable? H0 "C")  false)
(check-expect (reachable? H3 "F")  true)
(check-expect (reachable? H3 "")   false)
(check-expect (reachable? (first (room-exits H2)) "A") true)
(check-expect (reachable? (first (room-exits H3)) "A") true)
(check-expect (reachable? (first (room-exits ;; F
                                  (first (room-exits
                                          (first (room-exits H3))))))
                          "A")
              false)

;(define (reachable? room name) false) ;stub

(define (reachable? room0 name)
  ;; todo: (listof Room); rooms to be visited by fn-for-room
  ;; done: (listof String); names of rooms already visited (names must be uniques)
  (local [(define (fn-for-room room todo done)
            (cond [(string=? (room-name room) name) true]
                  [(member (room-name room) done)
                   (fn-for-lor todo done)]
                  [else
                   (fn-for-lor (append (room-exits room) todo) 
                            (cons (room-name room) done))]))
          (define (fn-for-lor todo done)
            (cond [(empty? todo) false]
                  [else
                    (fn-for-room (first todo) 
                                 (rest todo) 
                                 done)]))]
         (fn-for-room room0 empty empty)))