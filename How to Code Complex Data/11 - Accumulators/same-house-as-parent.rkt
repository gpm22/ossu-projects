;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname same-house-as-parent) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; same-house-as-parent.rkt


;PROBLEM:

;In the Harry Potter movies, it is very important which of the four houses a
;wizard is placed in when they are at Hogwarts. This is so important that in 
;most families multiple generations of wizards are all placed in the same family. 

;Design a representation of wizard family trees that includes, for each wizard,
;their name, the house they were placed in at Hogwarts and their children. We
;encourage you to get real information for wizard families from: 
;   http://harrypotter.wikia.com/wiki/Main_Page

;The reason we do this is that designing programs often involves collection
;domain information from a variety of sources and representing it in the program
;as constants of some form. So this problem illustrates a fairly common scenario.

;That said, for reasons having to do entirely with making things fit on the
;screen in later videos, we are going to use the following wizard family tree,
;in which wizards and houses both have 1 letter names. (Sigh)

(define-struct wizard (name house children))
;; Wizard is (make-wizard String House (listof Wizard))
;; House is one of:
;; - G (Gryffindor)
;; - H (Hufflepuff)
;; - R (Ravenclaw)
;; - S (Slytherin)


#;
(define (fn-for-wizard wizard)
  (local [(define (fn-for-wizard wizard)
            (... (wizard-name wizard)
                 (wizard-house wizard)
                 (fn-for-low (wizard-children wizard))))

          (define (fn-for-low low)
            (cond [(empty? low) ...]
                  [else
                   (... (fn-for-wizard (first low))
                        (fn-for-low (rest low)))]))]
    (fn-for-wizard wizard)))


(define VICTORIE (make-wizard
                  "Victorie"
                  "R"
                  empty))

(define DOMINIQUE (make-wizard
                   "Dominique"
                   "G"
                   empty))

(define LOUIS (make-wizard
               "Louis"
               "G"
               empty))

(define WILLIAM (make-wizard
                 "William"
                 "G"
                 (list VICTORIE DOMINIQUE LOUIS)))

(define CHARLES (make-wizard
                 "Charles"
                 "G"
                 empty))


(define MOLLY (make-wizard
               "Molly"
               "G"
               empty))

(define LUCY (make-wizard
              "Lucy"
              "G"
              empty))

(define PERCY (make-wizard
               "Percy"
               "G"
               (list MOLLY LUCY)))

(define FRED (make-wizard
              "Fred"
              "G"
              empty))

(define FRED2 (make-wizard
               "Fred II"
               "G"
               empty))

(define ROXANNE (make-wizard
                 "Roxanne"
                 "G"
                 empty))

(define GEORGE (make-wizard
                "George"
                "G"
                (list FRED2 ROXANNE)))

(define ROSE (make-wizard
              "Rose"
              "G"
              empty))

(define HUGO (make-wizard
              "Hugo"
              "G"
              empty))

(define RONALD (make-wizard
                "Ronald"
                "G"
                (list ROSE HUGO)))

(define JAMES (make-wizard
               "James"
               "G"
               empty))

(define ALBUS (make-wizard
               "Albus"
               "S"
               empty))

(define LILY (make-wizard
              "Lily"
              "G"
              empty))

(define GINEVRA (make-wizard
                 "Ginevra"
                 "G"
                 (list JAMES ALBUS LILY)))


(define ARTHUR (make-wizard
                "Arthur"
                "G"
                (list WILLIAM CHARLES PERCY FRED GEORGE RONALD GINEVRA)))

(define HARRY (make-wizard
               "Harry"
               "G"
               (list JAMES ALBUS LILY)))

(define LILY-M (make-wizard
                "Lily Potter"
                "G"
                (list HARRY)))

;PROBLEM:

;Design a function that consumes a wizard and produces the names of every 
;wizard in the tree that was placed in the same house as their immediate
;parent.


;; Wizard -> (listof String)
;; it consumes a wizard and produces the names of every 
;;    wizard in the tree that was placed in the same house
;;    as their immediate parent.


(check-expect (same-house LILY) empty)
(check-expect (same-house HARRY) (list "James" "Lily"))
(check-expect (same-house GINEVRA) (list "James" "Lily"))
(check-expect (same-house LILY-M) (list "James" "Lily" "Harry"))
(check-expect (same-house WILLIAM) (list "Dominique" "Louis"))
(check-expect (same-house ARTHUR) (list "Dominique" "Louis" "William" "Charles" "Molly" "Lucy" "Percy" "Fred" "Fred II" "Roxanne" "George" "Rose" "Hugo" "Ronald" "James" "Lily" "Ginevra"))
(check-expect (same-house (make-wizard "a" "G" (list ARTHUR))) (list "Dominique" "Louis" "William" "Charles" "Molly" "Lucy" "Percy" "Fred" "Fred II" "Roxanne" "George" "Rose" "Hugo" "Ronald" "James" "Lily" "Ginevra" "Arthur"))
;(define (same-house wizard) empty) stub


(define (same-house wizard)
  ;;lacc: (listof Wizard); it is the list of wizards accumulated 
  ;;house: House; it is the house of the father ("" for root tree)
  (local [(define (fn-for-wizard wizard lacc house)
            (if (string=? (wizard-house wizard) house)
                (fn-for-low (wizard-children wizard)
                            (cons (wizard-name wizard) lacc)
                            (wizard-house wizard))
                (fn-for-low (wizard-children wizard)
                            lacc
                            (wizard-house wizard))))

          (define (fn-for-low low lacc house)
            (cond [(empty? low) lacc]
                  [else
                   (fn-for-wizard (first low) (fn-for-low (rest low) lacc house) house)]))]
    (fn-for-wizard wizard empty "")))

;; Instructor's solution

(check-expect (same-house-g LILY) empty)
(check-expect (same-house-g HARRY) (list "James" "Lily"))
(check-expect (same-house-g GINEVRA) (list "James" "Lily"))
(check-expect (same-house-g LILY-M) (list "Harry" "James" "Lily"))
(check-expect (same-house-g WILLIAM) (list "Dominique" "Louis"))
(check-expect (same-house-g ARTHUR) (list
                                     "William"
                                     "Dominique"
                                     "Louis"
                                     "Charles"
                                     "Percy"
                                     "Molly"
                                     "Lucy"
                                     "Fred"
                                     "George"
                                     "Fred II"
                                     "Roxanne"
                                     "Ronald"
                                     "Rose"
                                     "Hugo"
                                     "Ginevra"
                                     "James"
                                     "Lily"))
(check-expect (same-house-g (make-wizard "a" "G" (list ARTHUR))) (list
                                                                  "Arthur"
                                                                  "William"
                                                                  "Dominique"
                                                                  "Louis"
                                                                  "Charles"
                                                                  "Percy"
                                                                  "Molly"
                                                                  "Lucy"
                                                                  "Fred"
                                                                  "George"
                                                                  "Fred II"
                                                                  "Roxanne"
                                                                  "Ronald"
                                                                  "Rose"
                                                                  "Hugo"
                                                                  "Ginevra"
                                                                  "James"
                                                                  "Lily"))
;(define (same-house-g wizard) empty) stub


(define (same-house-g wizard)
  ;;house: House; it is the house of the father ("" for root tree)
  ;; (fn-for-wizard LILY-M "" )
  ;; (fn-for-wizard HARRY  "G")
  ;; (fn-for-wizard JAMES  "G")
  ;; (fn-for-wizard ALBUS  "G")
  ;; (fn-for-wizard LILY   "G")
  (local [(define (fn-for-wizard wizard house)
            (if (string=? (wizard-house wizard) house)
                (cons (wizard-name wizard)
                      (fn-for-low (wizard-children wizard) (wizard-house wizard)))
                (fn-for-low (wizard-children wizard)
                            (wizard-house wizard))))

          (define (fn-for-low low house)
            (cond [(empty? low) empty]
                  [else
                   (append (fn-for-wizard (first low) house)
                           (fn-for-low (rest low) house))]))]
    (fn-for-wizard wizard "")))

;PROBLEM:

;Design a function that consumes a wizard and produces the number of wizards 
;in that tree (including the root). Your function should be tail recursive.

;; Wizard -> Natural
;; it consumes a wizard and produces the number of wizards (including the root) 

(check-expect (number-of-wizards ALBUS) 1)
(check-expect (number-of-wizards HARRY) 4)
(check-expect (number-of-wizards LILY-M) 5)


;(define (number-of-wizards wizard) 0) ;stub

(define (number-of-wizards wizard)
  ;acc: Natural; the number of wizards seen so far
  (local [(define (fn-for-wizard wizard acc )
            (fn-for-low (wizard-children wizard) (add1 acc)))

          (define (fn-for-low low acc)
            (cond [(empty? low) acc]
                  [else
                   (fn-for-low (rest low) (fn-for-wizard (first low) acc))]))]
    (fn-for-wizard wizard 0)))

;; Instructor - The correct one

(check-expect (number-of-wizards-g ALBUS) 1)
(check-expect (number-of-wizards-g HARRY) 4)
(check-expect (number-of-wizards-g LILY-M) 5)


;(define (number-of-wizards-g wizard) 0) ;stub

(define (number-of-wizards-g wizard)
  ;;rsf: Natural; the number of wizards seen so far
  ;;todo: (listof Wizards); list of wizards fn-for-wizards still needs to visit
  (local [(define (fn-for-wizard wizard todo rsf )
            (fn-for-low (append (wizard-children wizard) todo) (add1 rsf)))

          (define (fn-for-low todo rsf)
            (cond [(empty? todo) rsf]
                  [else
                   (fn-for-wizard (first todo) (rest todo) rsf)]))]
    (fn-for-wizard wizard empty 0)))

;PROBLEM:

;Design a new function definition for same-house-as-parent that is tail 
;recursive. You will need a worklist accumulator.

(check-expect (same-house2 LILY) empty)
(check-expect (same-house2 HARRY) (list "Lily" "James" ))
(check-expect (same-house2 GINEVRA) (list "Lily" "James" ))
(check-expect (same-house2 LILY-M) (list "Lily" "James" "Harry"))
(check-expect (same-house2 WILLIAM) (list "Louis" "Dominique"))
(check-expect (same-house2 ARTHUR) (list
                                    "Lily"
                                    "James"
                                    "Ginevra"
                                    "Hugo"
                                    "Rose"
                                    "Ronald"
                                    "Roxanne"
                                    "Fred II"
                                    "George"
                                    "Fred"
                                    "Lucy"
                                    "Molly"
                                    "Percy"
                                    "Charles"
                                    "Louis"
                                    "Dominique"
                                    "William"))
(check-expect (same-house2 (make-wizard "a" "G" (list ARTHUR))) (list
                                                                 "Lily"
                                                                 "James"
                                                                 "Ginevra"
                                                                 "Hugo"
                                                                 "Rose"
                                                                 "Ronald"
                                                                 "Roxanne"
                                                                 "Fred II"
                                                                 "George"
                                                                 "Fred"
                                                                 "Lucy"
                                                                 "Molly"
                                                                 "Percy"
                                                                 "Charles"
                                                                 "Louis"
                                                                 "Dominique"
                                                                 "William"
                                                                 "Arthur"))
;(define (same-house2 wizard) empty) stub



(define (same-house2 wizard)
  ;;lacc: (listof Wizard); it is the list of wizards accumulated
  ;;todo: (listof mpair); Wizards and their parent's house that fn-for-wizard needs to process
  (local [(define-struct mpair (wizard fhouse))
          ;; MPAIR is (make-mpair Wizard House)
          ;; interp. a worklist entry pair with the wizard to pass to fn-for-wizard
          ;;         and the house to compare
          
          (define (get-pairs low house)
            (cond [(empty? low) empty]
                  [else
                   (cons (make-mpair (first low) house)
                         (get-pairs (rest low) house))]))

          (define (fn-for-wizard pair todo lacc)
            
            (fn-for-low (append (get-pairs (wizard-children (mpair-wizard pair))
                                           (wizard-house (mpair-wizard pair)))
                                todo)
                        (if (string=? (wizard-house (mpair-wizard pair)) (mpair-fhouse pair))
                            (cons (wizard-name (mpair-wizard pair)) lacc)
                            lacc)))

          (define (fn-for-low todo lacc)
            (cond [(empty? todo) lacc]
                  [else
                   (fn-for-wizard (first todo) (rest todo) lacc)]))]
    (fn-for-wizard (make-mpair wizard "") empty empty)))