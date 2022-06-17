;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname merge) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; merge.rkt

;Problem:

;Design the function merge. It consumes two lists of numbers, which it assumes are 
;each sorted in ascending order. It produces a single list of all the numbers, 
;also sorted in ascending order. 

;Your solution should explicitly show the cross product of type comments table, 
;filled in with the values in each case. Your final function should have a cond 
;with 3 cases. You can do this simplification using the cross product table by 
;recognizing that there are subtly equal answers. 

;Hint: Think carefully about the values of both lists. You might see a way to 
;change a cell content so that 2 cells have the same value.

;; Data Types:

;; ListOfNumber is one of
;; - empty
;; - (cons Number ListOfNumber)
;; invariant:
;;           - the list is always in the ascending order

(define L0 empty)
(define L1 (list 10))
(define L2 (list 1 2 3 4 5))
(define L3 (list 2 8 10 12))
(define L4 (list 10 44 48 63))

;; Functions:

;; ListOfNumber ListOfNumber -> ListOfNumber
;; It consumes two list of numbers ordered in the ascending order and produces the merged version also in ascending order.

;; Cross Product

;;         list1 \ list2      |  empty  | (cons Number ListOfNumber)
;; ---------------------------|---------|---------------------------
;;            empty           |  empty  |          list2
;; ---------------------------|---------|---------------------------
;; (cons Number ListOfNumber) |  list 1 |          merged version


(check-expect (merge L0 L0) empty)
(check-expect (merge L0 L2) L2)
(check-expect (merge L2 L0) L2)
(check-expect (merge L2 L2) (list 1 1 2 2 3 3 4 4 5 5))
(check-expect (merge L2 L1) (list 1 2 3 4 5 10))
(check-expect (merge L1 L2) (list 1 2 3 4 5 10))
(check-expect (merge L2 L3) (list 1 2 2 3 4 5 8 10 12))


;(define (merge list1 list2) empty) ;stub

(define (merge list1 list2)
  (cond [(empty? list1) list2]
        [(empty? list2) list1]
        [else (if (< (first list1) (first list2))
                  (cons (first list1) (merge (rest list1) list2))
                  (cons (first list2) (merge list1 (rest list2))))]))
