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

#;
(define (fn-for-element e)
  (... (elt-name e)				;String
       (elt-data e)				;Integer
       (fn-for-loe (elt-subs e))));ListOfElement

#;
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
;; It consumes an element and produces a list of the names of all the elements in the tree

(check-expect (names--element F1) (list "F1"))
(check-expect (names--element D4) (list "D4" "F1" "F2"))
(check-expect (names--element D6) (list "D6" "D4" "F1" "F2" "D5" "F3"))
(check-expect (names--list empty) empty)
(check-expect (names--list (elt-subs F1)) empty)
(check-expect (names--list (elt-subs D4)) (list "F1" "F2"))
(check-expect (names--list (elt-subs D6)) (list "D4" "F1" "F2" "D5" "F3"))


;(define (names--element e) empty) ;stub
;(define (names--list loe) empty) ;stub

(define (names--element e)
  (cons (elt-name e)		     ;String
        (names--list (elt-subs e)))) ;ListOfElement

(define (names--list loe)
  (cond [(empty? loe) empty]
        [else
         (append (names--element (first loe))	;Element
                 (names--list (rest loe)))]))	;ListOfElement

;; String Element -> Integer or false
;; String ListOfElements -> Integer or false
;; It consumes String and Element and looks for a data element with the given name
;;     If it finds that element it produces the data, otherwise it produces false.

(check-expect (find--element "F1" D5) false)
(check-expect (find--element "F3" D4) false)
(check-expect (find--element "D5" D5) (elt-data D5))
(check-expect (find--element "F1" D4) (elt-data F1))
(check-expect (find--element "F1" F1) (elt-data F1))
(check-expect (find--element "F3" D6) (elt-data F3))
(check-expect (find--element "D4" D6) (elt-data D4))
(check-expect (find--element "F4" D6) false)
(check-expect (find--list "F1" empty) false)
(check-expect (find--list "F3" (elt-subs D6)) (elt-data F3))
(check-expect (find--list "F1" (elt-subs D6)) (elt-data F1))

;(define (find--element name element) false) ;stubs
;(define (find--list name leo) false)

(define (find--element name e)
  (if (string=? name (elt-name e))     ;String
      (elt-data e)		       ;Integer
      (find--list name (elt-subs e)))) ;ListOfElement

(define (find--list name loe)
  (cond [(empty? loe) false]
        [(number? (find--element name (first loe)))
         (find--element name (first loe))]
        [else (find--list name (rest loe))]))