;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname NewNatural) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; NewNatural is one of:
;; - empty
;; - (cons "!" NewNatural)
;; interp. a natural number, the number of "!" in the list is the number itself
(define N0 empty)
(define N1 (cons "!" empty)) ;1
(define N2 (cons "!" (cons "!" empty))) ;2
(define N3 (cons "!" N2)) ;3
(define N4 (cons "!" N3)) ;4
(define N5 (cons "!" N4)) ;5
(define N6 (cons "!" N5)) ;6
(define N7 (cons "!" N6)) ;7
(define N8 (cons "!" N7)) ;8
(define N9 (cons "!" N8)) ;9


;; These are the primitives that operate NewNatural:
(define (new-zero? n) ; Any -> Boolean
  (empty? n))

(define (new-add1 n) ; NewNatural -> NewNatural
  (cons "!" n))

(define (new-sub1 n) ; Natural[>0] -> Natural
  (rest n))

#;
(define (fn-for-new-natural n)
  (cond [(new-zero? n) (...)]
        [else
         (... n
              (fn-for-new-natural (new-sub1 n)))]))


;; NewNatural NewNatural -> NewNatural
;; It consumes 2 new naturals and produces a sum of these
(check-expect (new-add N2 N0) N2)
(check-expect (new-add N0 N3) N3)
(check-expect (new-add N2 N5) N7)

(define (new-add n1 n2)
  (cond [(new-zero? n1) n2]
        [(new-zero? n2) n1]
        [else
         (new-add (new-add1 n1) (new-sub1 n2))]))

;; NewNatural Newnatural -> NewNatural
;; It consumes 2 new naturals and produces a substraticon of these
(check-expect (new-sub N2 N0) N2)
(check-expect (new-sub N2 N2) N0)
(check-expect (new-sub N0 N3) "Erro, n1 não pode ser menor que n2")
(check-expect (new-sub N2 N5) "Erro, n1 não pode ser menor que n2")
(check-expect (new-sub N5 N3) N2)

(define (new-sub n1 n2)
  (cond [(new-zero? n2) n1]
        [(new-zero? n1) "Erro, n1 não pode ser menor que n2"]
        [else
         (new-sub (new-sub1 n1) (new-sub1 n2))]))

;; NewNatural NewNatural -> NewNatural
;; It consumes 2 new naturals and produces a multiplication of these
(check-expect (new-times N2 N0) N0)
(check-expect (new-times N0 N3) N0)
(check-expect (new-times N1 N3) N3)
(check-expect (new-times N3 N1) N3)
(check-expect (new-times N2 N3) N6)
(check-expect (new-times N3 N2) N6)
(check-expect (new-times N2 N2) N4)
(check-expect (new-times N3 N3) N9)
(check-expect (new-times N3 N6) (new-times N9 N2))
(check-expect (new-times N3 N4) (new-add N9 N3))

(define (new-times n1 n2)
  (cond [(new-zero? n1) n1]
        [(new-zero? n2) n2]
        [(new-zero? (new-sub1 n1)) n2]
        [(new-zero? (new-sub1 n2)) n1]
        [else (add-repeatedly n1 n1 n2)]))


;; NewNatural NewNatural NewNatural -> NewNatural
;; It consumes 3 new naturals: the initial value, the number to be repeated added, and the number of repetitions

(define (add-repeatedly added-value value-to-add repetitions)
  (cond [(new-zero? (new-sub1 repetitions)) added-value]
        [else
         (add-repeatedly
          (new-add added-value value-to-add)
          value-to-add
          (new-sub1 repetitions))]))


;; NewNatural -> NewNatural
;; It consumes a new natural and produces the factorial of it

(check-expect (new-factorial N0) N1)
(check-expect (new-factorial N1) N1)
(check-expect (new-factorial N3) N6)

(define (new-factorial n)
  (cond [(new-zero? n) N1]
        [else
         (new-times n (new-factorial (new-sub1 n)))]))

