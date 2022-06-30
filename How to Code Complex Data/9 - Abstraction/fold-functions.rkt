;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname fold-functions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; fold-functions.rkt

;; At this point in the course, the type (listof X) means:

;; ListOfX is one of:
;; - empty
;; - (cons X ListOfX)
;; interp. a list of X

;; and the template for (listof X) is:

(define (fn-for-lox lox)
  (cond [(empty? lox) (...)]
        [else
         (... (first lox)
              (fn-for-lox (rest lox)))]))

;PROBLEM:

;Design an abstract fold function for (listof X).

;; (X Y -> Y) Y (listof X) -> Y
;; the abstract fold function for (listof X)

(check-expect (fold + 0 (list 1 4 5)) 10)
(check-expect (fold * 2 (list 1 3 4)) 24)
(check-expect (fold string-append "" (list "a" "bb" "ccc")) "abbccc")
(check-expect (fold append empty (list (list "a") (list 2) (list 10) (list 5) (list true))) (list "a" 2 10 5 true))

(define (fold fn b lox)
  (cond [(empty? lox) b]
        [else
         (fn  (first lox)
              (fold fn b (rest lox)))]))



;PROBLEM:

;Complete the function definition for sum using fold. 


;; (listof Number) -> Number
;; add up all numbers in list
(check-expect (sum empty) 0)
(check-expect (sum (list 2 3 4)) 9)

;(define (sum lon) 0) ;stub

(define (sum lon)
  (fold + 0 lon))


;PROBLEM:

;Complete the function definition for juxtapose using foldr. 


;; (listof Image) -> Image
;; juxtapose all images beside each other
(check-expect (juxtapose empty) (square 0 "solid" "white"))
(check-expect (juxtapose (list (triangle 6 "solid" "yellow")
                               (square 10 "solid" "blue")))
              (beside (triangle 6 "solid" "yellow")
                      (square 10 "solid" "blue")
                      (square 0 "solid" "white")))

;(define (juxtapose loi) (square 0 "solid" "white")) ;stub

(define (juxtapose loi)
  (fold beside empty-image loi))

;PROBLEM:

;Complete the function definition for copy-list using foldr. 


;; (listof X) -> (listof X)
;; produce copy of list
(check-expect (copy-list empty) empty)
(check-expect (copy-list (list 1 2 3)) (list 1 2 3))

;(define (copy-list lox) empty) ;stub
(define (copy-list lox)
  (fold cons empty lox))

;; ======================


;PROBLEM:

;Design an abstract fold function for Element (and (listof Element)). 


(define-struct elt (name data subs))
;; Element is (make-elt String Integer ListOfElement)
;; interp. An element in the file system, with name, and EITHER data or subs.
;;         If data is 0, then subs is considered to be list of sub elements.
;;         If data is not 0, then subs is ignored.

;; ListOfElement is one of:
;;  - empty
;;  - (cons Element ListOfElement)
;; interp. A list of file system Elements

;;       D6
;;      /  \
;;    D4    D5
;;   /  \    |
;; F1    F2  F3

(define F1 (make-elt "F1" 1 empty))
(define F2 (make-elt "F2" 2 empty))
(define F3 (make-elt "F3" 3 empty))
(define D4 (make-elt "D4" 0 (list F1 F2)))
(define D5 (make-elt "D5" 0 (list F3)))
(define D6 (make-elt "D6" 0 (list D4 D5)))
#;
(define (fn-for-element e)
  (local [(define (fn-for-element e)
            (... (elt-name e)    ;String
                 (elt-data e)    ;Integer
                 (fn-for-loe (elt-subs e))))

          (define (fn-for-loe loe)
            (cond [(empty? loe) (...)]
                  [else
                   (... (fn-for-element (first loe))
                        (fn-for-loe (rest loe)))]))]
    (fn-for-element e)))


;; ( String Integer Y -> X ) (X Y -> Y) Y Element -> X 
;; it is an anbstract fold for the element type

(check-expect (local [(define (c1 n d los) (cons n los))]
                (fold-for-element c1 append empty D6))
              (list "D6" "D4" "F1" "F2" "D5" "F3"))

(check-expect (local [(define (c1 n d r) (+ d r))
                      (define (c2 f r) (+ f r))]
                (fold-for-element c1 c2 0 D6))
              6)

(define (fold-for-element c1 c2 b e)
  (local [(define (fold-element e)
            (c1  (elt-name e)    ;String
                 (elt-data e)    ;Integer
                 (fold-loe (elt-subs e))))

          (define (fold-loe loe)
            (cond [(empty? loe) b]
                  [else
                   (c2 (fold-element (first loe))
                        (fold-loe (rest loe)))]))]
    (fold-element e)))


;PROBLEM

;Complete the design of sum-data that consumes Element and producs
;the sum of all the data in the element and its subs

;; Element -> Integer
;; produce the sum of all the data in element (and its subs)
(check-expect (sum-data F1) 1)
(check-expect (sum-data D5) 3)
(check-expect (sum-data D4) (+ 1 2))
(check-expect (sum-data D6) (+ 1 2 3))

;(define (sum-data e) 0) ;stub

(define (sum-data e)
  (local [(define (c1 n d r) (+ d r))
                      (define (c2 f r) (+ f r))]
    (fold-for-element c1 c2 0 e)))

;PROBLEM

;Complete the design of all-names that consumes Element and produces a list of the
;names of all the elements in the tree. 

;; Element       -> ListOfString
;; produce list of the names of all the elements in the tree
(check-expect (all-names F1) (list "F1"))
(check-expect (all-names D5) (list "D5" "F3"))
(check-expect (all-names D4) (list "D4" "F1" "F2"))
(check-expect (all-names D6) (list "D6" "D4" "F1" "F2" "D5" "F3"))
               
;(define (all-names e) empty) ;stub

(define (all-names e)
  (local [(define (c1 n d los) (cons n los))]
    (fold-for-element c1 append empty e)))

;PROBLEM

;If the tree is very large, then fold-element is not a good way to implement the find 
;function from last week.  Why? If you aren't sure then discover the answer by implementing
;find using fold-element and then step the two versions with different arguments.

;; ANSWER

;; That is not a good idea, as the fold version will always execute both combination functions,
;; so it would be less efficient; 

;; Original

;; String Element -> Integer or false
;; String ListOfElements -> Integer or false
;; It consumes String and Element and looks for a data element with the given name
;;     If it finds that element it produces the data, otherwise it produces false.

(check-expect (find "F1" D5) false)
(check-expect (find "F3" D4) false)
(check-expect (find "D5" D5) (elt-data D5))
(check-expect (find "F1" D4) (elt-data F1))
(check-expect (find "F1" F1) (elt-data F1))
(check-expect (find "F3" D6) (elt-data F3))
(check-expect (find "D4" D6) (elt-data D4))
(check-expect (find "F4" D6) false)

(define (find n e)
  (local [(define (find--element n e)
            (if (string=? (elt-name e) n)
                (elt-data e) 
                (find--loe n (elt-subs e))))
          
          (define (find--loe n loe)
            (cond [(empty? loe) false]
                  [else
                     (local [(define try (find--element n (first loe)))]               
                          (if (not (false? try))
                             try 
                             (find--loe n (rest loe))))]))]
    
    (find--element n e)))

;; With Fold

(check-expect (find-fold "F1" D5) false)
(check-expect (find-fold "F3" D4) false)
(check-expect (find-fold "D5" D5) (elt-data D5))
(check-expect (find-fold "F1" D4) (elt-data F1))
(check-expect (find-fold "F1" F1) (elt-data F1))
(check-expect (find-fold "F3" D6) (elt-data F3))
(check-expect (find-fold "D4" D6) (elt-data D4))
(check-expect (find-fold "F4" D6) false)

(define (find-fold nameToBeFound element)
  (local [(define (firstHelper name data resultOfSecondFunction)
            (if (string=? nameToBeFound name)
                data
                resultOfSecondFunction))
          (define (secondHelper resultOfFirstFunction resultOfSecondFunction)
            (if (number? resultOfFirstFunction)
                resultOfFirstFunction
                resultOfSecondFunction))]
    (fold-for-element firstHelper secondHelper false element)))