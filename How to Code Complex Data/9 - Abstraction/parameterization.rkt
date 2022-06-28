;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname parameterization) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; parameterization.rkt


(define (circle-area radius)
  (* pi (sqr radius)))

(* pi (sqr 4)) ;area of circle radius 4
(circle-area 4)
(* pi (sqr 6)) ;area of circle radius 6
(circle-area 6)





;; ====================

;; ListOfString -> Boolean
;; produce true if los includes "UBC"
(check-expect (contains-ubc? empty) false)
(check-expect (contains-ubc? (cons "McGill" empty)) false)
(check-expect (contains-ubc? (cons "UBC" empty)) true)
(check-expect (contains-ubc? (cons "McGill" (cons "UBC" empty))) true)

;(define (contains-ubc? los) false) ;stub

;<template from ListOfString>

#;
(define (contains-ubc? los)
  (cond [(empty? los) false]
        [else
         (if (string=? (first los) "UBC")
             true
             (contains-ubc? (rest los)))]))

(define (contains-ubc? los)
  (contains-name? los "UBC"))

;; ListOfString -> Boolean
;; produce true if los includes "McGill"
(check-expect (contains-mcgill? empty) false)
(check-expect (contains-mcgill? (cons "UBC" empty)) false)
(check-expect (contains-mcgill? (cons "McGill" empty)) true)
(check-expect (contains-mcgill? (cons "UBC" (cons "McGill" empty))) true)

;(define (contains-mcgill? los) false) ;stub

;<template from ListOfString>

#;
(define (contains-mcgill? los)
  (cond [(empty? los) false]
        [else
         (if (string=? (first los) "McGill")
             true
             (contains-mcgill? (rest los)))]))


(define (contains-mcgill? los)
  (contains-name? los "McGill"))


;; (listof String) String -> Boolean
;; consumnes a list of string and a string produce true if the list includes the given string

(check-expect (contains-name? empty "AAA") false)
(check-expect (contains-name? (cons "AAA" empty) "AAA") true)
(check-expect (contains-name? (list "A" "AA" "BBB") "AAA") false)
(check-expect (contains-name? (list "A" "AA" "AAA" "BBB") "AAA") true)


(define (contains-name? los name)
  (cond [(empty? los) false]
        [else
         (if (string=? (first los) name)
             true
             (contains-name? (rest los) name))]))

;; ====================

;; ListOfNumber -> ListOfNumber
;; produce list of sqr of every number in lon
(check-expect (squares empty) empty)
(check-expect (squares (list 3 4)) (list 9 16))

;(define (squares lon) empty) ;stub

;<template from ListOfNumber>

#;
(define (squares lon)
  (cond [(empty? lon) empty]
        [else
         (cons (sqr (first lon))
               (squares (rest lon)))]))

(define (squares lon) (map2 sqr lon))

;; ListOfNumber -> ListOfNumber
;; produce list of sqrt of every number in lon
(check-expect (square-roots empty) empty)
(check-expect (square-roots (list 9 16)) (list 3 4))

;(define (square-roots lon) empty) ;stub

;<template from ListOfNumber>

#;
(define (square-roots lon)
  (cond [(empty? lon) empty]
        [else
         (cons (sqrt (first lon))
               (square-roots (rest lon)))]))

(define (square-roots lon) (map2 sqrt lon))

;; (X -> Y) (listof X) -> (listof Y)
;; it consumes a function and a list and produces a list
;;     where each element is the element of the given list 
;;     after being applied by the given function 

(check-expect (map2 sqrt empty) empty)
(check-expect (map2 sqrt (list 9 16)) (list 3 4))
(check-expect (map2 sqr (list 3 4)) (list 9 16))
(check-expect (map2 abs (list -1 -5 -4 -6)) (list 1 5 4 6))
(check-expect (map2 string-length (list "AA" "a" "" "AAAA")) (list 2 1 0 4))

(define (map2 func lon)
    (cond [(empty? lon) empty]
        [else
         (cons (func (first lon))
               (map2 func (rest lon)))]))


;; ====================

;; ListOfNumber -> ListOfNumber
;; produce list with only positive? elements of lon
(check-expect (positive-only empty) empty)
(check-expect (positive-only (list 1 -2 3 -4)) (list 1 3))

;(define (positive-only lon) empty) ;stub

;<template from ListOfNumber>

#;
(define (positive-only lon)
  (cond [(empty? lon) empty]
        [else
         (if (positive? (first lon))
             (cons (first lon)
                   (positive-only (rest lon)))
             (positive-only (rest lon)))]))

(define (positive-only lon) (filter2 positive? lon))


;; ListOfNumber -> ListOfNumber
;; produce list with only negative? elements of lon
(check-expect (negative-only empty) empty)
(check-expect (negative-only (list 1 -2 3 -4)) (list -2 -4))

;(define (negative-only lon) empty) ;stub

;<template from ListOfNumber>

#;
(define (negative-only lon)
  (cond [(empty? lon) empty]
        [else
         (if (negative? (first lon))
             (cons (first lon)
                   (negative-only (rest lon)))
             (negative-only (rest lon)))]))

(define (negative-only lon) (filter2 negative? lon))

;; (X -> Boolean) (listof X) -> (listof X)
;; it consumes a predicate and a list and apply that predicate
;;     to each of the elements in the given list, producing a
;;     list which each element has a truth proposition
      
(check-expect (filter2 positive? empty) empty)
(check-expect (filter2 positive? (list 1 -2 3 -4)) (list 1 3))
(check-expect (filter2 negative? (list 1 -2 3 -4)) (list -2 -4))
(check-expect (filter2 negative? (list 1 -2 3 -4)) (list -2 -4))
(check-expect (filter2 exact? (list 1 -2 3 -4 (* 2 pi))) (list 1 -2 3 -4))
(check-expect (filter2 even? (list 1 3 5 6 9 11 22)) (list 6 22))
(check-expect (filter2 zero? (list 1 9 2 9 0 0 129 0 212 0 4343 0 12 0)) (list 0 0 0 0 0 0))

(define (filter2 pred lon)
  (cond [(empty? lon) empty]
        [else
         (if (pred (first lon))
             (cons (first lon)
                   (filter2 pred (rest lon)))
             (filter2 pred (rest lon)))]))

;; ==================

;; ListOfNumber -> Boolean
;; produce true if every number in lon is positive
(check-expect (all-positive? empty) true)
(check-expect (all-positive? (list 1 -2 3)) false)
(check-expect (all-positive? (list 1 2 3)) true)

(define (all-positive? lon) (andmap2 positive? lon))

;; ListOfNumber -> Boolean
;; produce true if every number in lon is negative
(check-expect (all-negative? empty) true)
(check-expect (all-negative? (list 1 -2 3)) false)
(check-expect (all-negative? (list -1 -2 -3)) true)

(define (all-negative? lon) (andmap2 negative? lon))

;; (X -> Boolean) (listof X) -> Boolean
;;produce true if pred produces true for every element of the list
(check-expect (andmap2 positive? empty) true)
(check-expect (andmap2 positive? (list 1 -2 3)) false)
(check-expect (andmap2 positive? (list 1 2 3)) true)
(check-expect (andmap2 negative? (list -1 -2 -3)) true)

(define (andmap2 pred lst)
  (cond [(empty? lst) true]
        [else 
         (and (pred (first lst))
              (andmap2 pred (rest lst)))]))