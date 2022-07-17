;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname contains-key-tr-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; bt-contains-tr.rkt

;Problem:

;Starting with the following data definition for a binary tree (not a binary search tree) 
;design a tail-recursive function called contains? that consumes a key and a binary tree 
;and produces true if the tree contains the key.


(define-struct node (k v l r))
;; BT is one of:
;;  - false
;;  - (make-node Integer String BT BT)
;; Interp. A binary tree, each node has a key, value and 2 children
(define BT1 false)
(define BT2 (make-node 1 "a"
                       (make-node 6 "f"
                                  (make-node 4 "d" false false)
                                  false)
                       (make-node 7 "g" false false)))


;; key BT -> Boolean
;; it  consumes a key and a binary tree and produces true if the tree contains the key.

(check-expect (contains? BT1 0) false)
(check-expect (contains? BT2 1) true)
(check-expect (contains? BT2 0) false)
(check-expect (contains? BT2 6) true)
(check-expect (contains? BT2 7) true)
(check-expect (contains? BT2 4) true)


;(define (contains? BT key) false) ;stub

(define (contains? BT0 key)
  ;; todo: (listof BT); the BTs to be visited
  (local [(define (contains? BT todo)
           (cond [(false? BT)
                  (fn-for-lon todo)]
                 [(= (node-k BT) key) true]
                 [else
                  (fn-for-lon (append (list (node-r BT) (node-l BT)) todo))]))
          (define (fn-for-lon todo)
            (cond [(empty? todo) false]
                  [else
                   (contains? (first todo) (rest todo))]))]
  (contains? BT0 empty)))




