;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname final-project) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; final-project.rkt

(require racket/list) ;gets list-ref, take and drop

;  PROBLEM 1:
;
;  Consider a social network similar to Twitter called Chirper. Each user has a name, a note about
;  whether or not they are a verified user, and follows some number of people.
;
;  Design a data definition for Chirper, including a template that is tail recursive and avoids
;  cycles.
;
;  Then design a function called most-followers which determines which user in a Chirper Network is
;  followed by the most people.
;

(define-struct user (name verified? following))
;; User is (make-user String Boolean (listof user)
;; User is a Chirper user, where name is the user name, verified? is true if user is a verified 
;;    user and false is it is not, and following is the list of users followed by user

(define A (make-user "A" true empty))

(define C0 (make-user "B" false (list A)))

(define C1 (shared ((-B- (make-user "B" false (list -C- A)))
                    (-C- (make-user "C" false (list -B- A))))
             -B-))
             
             
(define C2 (shared ((-B- (make-user "B" true (list A -C- )))
                    (-C- (make-user "C" true (list A -B- -D-)))
                    (-D- (make-user "D" true (list A -B- -C-)))
                    (-E- (make-user "E" true (list A -B- -D- -F-)))
                    (-F- (make-user "F" true (list -B- -C- -D-))))
             -B-))


;; template: structural recursion, encapsulate w/ local, tail-recursive w/ worklist, 
;;           context-preserving accumulator what users have we already visited
#;
(define (fn-for-chirper user0)
  ;; todo is (listof User); a worklist accumulator
  ;; visited is (listof String); context preserving accumulator, names of users already visited
  (local [(define (fn-for-user user todo visited) 
            (if (member (user-name user) visited)
                (fn-for-lor todo visited)
                (fn-for-lor (append (user-following user) todo)
                            (cons (user-name user) visited)))) ; (... (user-name user)) (... (user-verified? user)
          (define (fn-for-lor todo visited)
            (cond [(empty? todo) (...)]
                  [else
                   (fn-for-user (first todo) 
                                (rest todo)
                                visited)]))]
    (fn-for-user user0 empty empty))) 

;; User -> String
;; it consumes a User and produces the user name followed by the most people in the given Network.

;(check-expect (most-followers A) "A")
;(check-expect (most-followers C0) "A")
;(check-expect (most-followers C1) "A")
;(check-expect (most-followers C2) "A")

;(define (most-followers user) (user-name user)) ;stub

(define (most-followers user0)
  ;; todo is (listof User); a worklist accumulator
  ;; visited is (listof String); context preserving accumulator, names of users already visited
  (local [(define (count los s)
            (length (filter (lambda (s1) (string=? s1 s)) los)))

          (define (get-larger los0)
            (local [(define (get-larger los acc user)
                      (cond [(empty? los)
                             (if (string=? user "")
                                 ( user-name user0)
                                 user)]
                            [else
                             (local [(define act (count los0 (first los)))]
                               (if (> act acc)
                                   (get-larger (rest los) act (first los))
                                   (get-larger (rest los) acc user)))]))]
              (get-larger los0 0 "")))


          (define (fn-for-user user todo visited followers) 
            (if (member (user-name user) visited)
                (fn-for-lor todo visited followers)
                (fn-for-lor (append (user-following user) todo)
                            (cons (user-name user) visited)
                            (append (map user-name (user-following user))
                                    followers)))) 
          (define (fn-for-lor todo visited followers)
            (cond [(empty? todo) followers]
                  [else
                   (fn-for-user (first todo) 
                                (rest todo)
                                visited
                                followers)]))]
    (get-larger (fn-for-user user0 empty empty empty)))) 
  


;  PROBLEM 2:
;
;  In UBC's version of How to Code, there are often more than 800 students taking
;  the course in any given semester, meaning there are often over 40 Teaching Assistants.
;
;  Designing a schedule for them by hand is hard work - luckily we've learned enough now to write
;  a program to do it for us!
;
;  Below are some data definitions for a simplified version of a TA schedule. There are some
;  number of slots that must be filled, each represented by a natural number. Each TA is
;  available for some of these slots, and has a maximum number of shifts they can work.
;
;  Design a search program that consumes a list of TAs and a list of Slots, and produces one
;  valid schedule where each Slot is assigned to a TA, and no TA is working more than their
;  maximum shifts. If no such schedules exist, produce false.
;
;  You should supplement the given check-expects and remember to follow the recipe!

;; DATA DEFINITION

;; Slot is Natural
;; interp. each TA slot has a number, is the same length, and none overlap

(define-struct ta (name max avail))
;; TA is (make-ta String Natural (listof Slot))
;; interp. the TA's name, number of slots they can work, and slots they're available for

(define SOBA (make-ta "Soba" 2 (list 1 3)))
(define UDON (make-ta "Udon" 1 (list 3 4)))
(define RAMEN (make-ta "Ramen" 1 (list 2)))

(define NOODLE-TAs (list SOBA UDON RAMEN))

(define-struct assignment (ta slot))
;; Assignment is (make-assignment TA Slot)
;; interp. the TA is assigned to work the slot

;; Schedule is (listof Assignment)

;; FUNCTIONS DEFINITION

;; (listof TA) (listof Slot) -> Schedule or false
;; produce valid schedule given TAs and Slots; false if impossible

(check-expect (schedule-tas empty empty) empty)
(check-expect (schedule-tas empty (list 1 2)) false)
(check-expect (schedule-tas (list SOBA) empty) empty)

(check-expect (schedule-tas (list SOBA) (list 1)) (list (make-assignment SOBA 1)))
(check-expect (schedule-tas (list SOBA) (list 2)) false)
(check-expect (schedule-tas (list SOBA) (list 1 3)) (list (make-assignment SOBA 3)
                                                          (make-assignment SOBA 1)))

(check-expect (schedule-tas NOODLE-TAs (list 2 3)) 
              (list
               (make-assignment SOBA 3)
               (make-assignment RAMEN 2)))

(check-expect (schedule-tas NOODLE-TAs (list 2 3 4)) 
              (list
               (make-assignment UDON 4)
               (make-assignment SOBA 3)
               (make-assignment RAMEN 2)))

(check-expect (schedule-tas NOODLE-TAs (list 1 2 3 4)) 
              (list
               (make-assignment UDON 4)
               (make-assignment SOBA 3)
               (make-assignment RAMEN 2)
               (make-assignment SOBA 1)))

(check-expect (schedule-tas NOODLE-TAs (list 1 2 3 4 5)) false)


;(define (schedule-tas tas slots) false) ;

;; tas/slots    | empty | (listof slot)
;; --------------------------------------
;; empty        | empty |    false
;;---------------------------------------
;; (listof TA)  | empty |    Schedule or false




(define (schedule-tas tas0 slots0)
  ;; ans is Schedule; It is the actual answer for the problem
  (local [(define (full? ans)
            (andmap (lambda (n) (not (false? n))) ans))

          (define (count-ta ta0 ans0)
            (local [(define (count-ta ta ans acc)
                      (cond [(empty? ans) acc]
                            [(false? (first ans))
                             (count-ta ta (rest ans) acc)]
                            [(string=?
                              (ta-name ta)
                              (ta-name (assignment-ta (first ans))))
                             (count-ta ta (rest ans) (add1 acc))]
                            [else
                             (count-ta ta (rest ans) acc)]))]
              (count-ta ta0 ans0 0)))
                            

          (define (get-tas tas slot ans)
            (filter (lambda (ta) (and (> (ta-max ta) (count-ta ta ans))
                                      (member? slot (ta-avail ta)))) tas))
            
          (define (create-ans slots)
            (cond [(empty? slots) empty]
                  [else
                   (cons false (create-ans (rest slots)))]))


          (define (get-next-slot slots ans)
            (local [(define ans-filtered (filter (lambda (n) (not (false? n))) ans))]
              (cond [(empty? slots) false]
                    [(ormap (lambda (n)
                              (= (assignment-slot n)  (first slots)))  ans-filtered)
                     (get-next-slot (rest slots) ans)]
                    [else
                     (first slots)])))
                   
                   
          ;;acc is Schedule; it is the previous Assignments
          
          (define (next-schedules tas0 slots0 ans0)
            (local [(define (next-schedules tas slots ans acc)
                      (cond [(empty? ans) false]
                            [(false? (first ans))
                             (map (lambda (ta)
                                    (append (list (make-assignment ta (get-next-slot slots ans0)))
                                            acc
                                            (rest ans)))
                                  (get-tas tas (get-next-slot slots ans0) ans0))]
                            [else
                             (next-schedules tas slots (rest ans)
                                             (append acc (list (first ans))))]))]
              (next-schedules tas0 slots0 ans0 empty)))            
            
 
          (define (schedule-tas ans)
            (if (full? ans)
                ans 
                (solve--lobd (next-schedules tas0 slots0 ans))))

          (define (solve--lobd lobd)
            (cond [(empty? lobd) false]
                  [else
                   (local [(define try (schedule-tas (first lobd)))]
                     (if (not (false? try))
                         try
                         (solve--lobd (rest lobd))))]))]
    (cond [(empty? slots0) empty]
          [(empty? tas0) false]
          [else (schedule-tas (create-ans slots0))])))
