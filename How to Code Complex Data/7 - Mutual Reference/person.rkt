;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname person) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct person (name gender age children))
;;  Person is (make-person String Gender Natural ListOfPerson)
;;  interp. a person with first name, gender, age, and a list of their children

;;  ListOfPerson is one of:
;;  - empty
;;  - (cons Person ListOfPerson)
;;  interp. a list of persons

;; Gender is one of:
;;  - "M"
;;  - "F"
;; interp.  "M" means male, "F" means female

(define (fn-for-person p)
  (... (person-name   p)   ;String
       (person-gender p)   ;Gender
       (person-age    p)   ;Natural
       (fn-for-lop (person-children p))))

(define (fn-for-lop lop)
  (cond [(empty? lop) (...)]
        [else
         (... (fn-for-person (first lop))
              (fn-for-lop (rest lop)))]))

(define P1 (make-person "Robert" "M" 18 empty))
(define P2 (make-person "Marie"  "F" 17 empty))
(define P3 (make-person "Anne"   "F" 45 (list P1 P2)))
(define P4 (make-person "Louis"  "M" 47 (list P1 P2)))
(define P5 (make-person "N5" "M" 5 empty))
(define P6 (make-person "N6" "F" 25 (list P5)))
(define P7 (make-person "N7" "F" 15 empty))
(define P8 (make-person "N8" "M" 45 (list P6 P7)))

;; Functions:

;; Person -> ListOfString
;; ListOfPerson -> ListOfString
;; It consumes a person and produces a list of the names of the persons under 20

(check-expect (names-under-20--person P1) (list "Robert"))
(check-expect (names-under-20--person P3) (list "Robert" "Marie"))
(check-expect (names-under-20--person P5) (list "N5"))
(check-expect (names-under-20--lop empty) empty)
(check-expect (names-under-20--person P6) (list "N5"))
(check-expect (names-under-20--person P8) (list "N5" "N7"))

;(define (names-under-20--person p) empty) ;stubs
;(define (names-under-20--lop lop) empty)


(define (names-under-20--person p)
  (if ( < (person-age    p)  20) ;Natural
      (cons (person-name   p)   ;String       
            (names-under-20--lop (person-children p)))
      (names-under-20--lop (person-children p))))

(define (names-under-20--lop lop)
  (cond [(empty? lop) empty]
        [else
         (append (names-under-20--person (first lop))
              (names-under-20--lop (rest lop)))]))
