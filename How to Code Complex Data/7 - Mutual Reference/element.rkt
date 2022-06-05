;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname element) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Data definitions:

(define-struct elt (name data subs))
;; Element is (make-elt String Integer ListOfElement)
;; interp. 	An element in the file system, with name, and EITHER data or subs.
;;			if data is 0, then subs is considered to be list of sub elements.
;;			if data is not 0, then subs is ignored.

;; ListOfElement if one of:
;;	- empty
;;	- (cons Element ListOfElement)
;; interp.	A list of file system Elements

(define F1 (make-elt "F1" 1 empty))
(define F2 (make-elt "F2" 2 empty))
(define F3 (make-elt "F3" 3 empty))
(define D4 (make-elt "D4" 0 (list F1 F2)))
(define D5 (make-elt "D5" 0 (list F3)))
(define D6 (make-elt "D6" 0 (list D4 D5)))

(define (fn-for-element e)
    (... (elt-name e)				;String
         (elt-data e)				;Integer
         (fn-for-loe (elt-subs e))));ListOfElement

(define (fn-for-loe loe)
    (cond [(empty? loe) (...)]
          [else
           (... (fn-for-element(first loe))	;Element
                (fn-for-loe (rest loe)))]))	;ListOfElement

;; Functions:

;; Element -> Integer
;; ListOfElement -> Integer
;; It consumes an element and produces the sum of all the file data in the tree;
(check-expect (sum-data--element F1) 1)
(check-expect (sum-data--element D4) 3)
(check-expect (sum-data--element D5) 3)
(check-expect (sum-data--element D6) 6)
(check-expect (sum-data--list empty) 0)
(check-expect (sum-data--list (elt-subs F1)) 0)
(check-expect (sum-data--list (elt-subs D4)) 3)

(define (sum-data--element e)
    (+ 	(elt-data e)			;Integer
        (sum-data--list (elt-subs e))))	;ListOfElement

(define (sum-data--list loe)
    (cond [(empty? loe) 0]
          [else
           (+ (sum-data--element(first loe))	;Element
                (sum-data--list (rest loe)))]))	;ListOfElement

;; Element -> ListOfString
;; ListOfElement -> ListOfString
;; It consumes an element and procues a list of the names of all the elements in the tree



(define (names--element e) empty)
(define (names--list loe) empty)