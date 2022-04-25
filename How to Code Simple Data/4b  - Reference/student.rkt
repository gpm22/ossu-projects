;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname student) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Data Definitions:

(define-struct student (name id))
;; Student is (make-student String Natural)
;; interp. A student with name and student id

(define S1 (make-student "Eva"  3124))
(define S2 (make-student "John" 7893))

#;
(define (fn-for-student s)
  (... (student-name s)
       (student-id   s)))

;; ListOfStudent is one of:
;; - empty
;; - (cons Student ListOfStudent)
;; interp. A list of students

(define LOS1 empty)
(define LOS2 (cons S1 empty))
(define LOS3 (cons S1 (cons S2 empty)))

#;
(define (fn-for-los los)
  (cond [(empty? los) (...)]
        [else
         (... (fn-for-student (first los))
              (fn-for-los (rest los)))]))

;; StudentCard is String
;; interp. A student card with student's name and student id

(define SC1 "Eva 3124")
(define SC2 "John 7893")

#;
(define (fn-for-student-card sc)
  (... sc))

;; ListOfStudentCard is one of:
;; - empty
;; - (cons StudentCard ListOfStudentCard)
;; interp. A list of students

(define LOSC1 empty)
(define LOSC2 (cons SC1 empty))
(define LOSC3 (cons SC1 (cons SC2 empty)))

#;
(define (fn-for-losc losc)
  (cond [(empty? losc) (...)]
        [else
         (... (fn-for-student-card (first losc))
              (fn-for-losc (rest losc)))]))

  
;; Functions

;; ListOfStudent -> ListOfStudentCards
;; It consumes a list of students and produces a list of student cards

(check-expect (student-cards LOS1) LOSC1)
(check-expect (student-cards LOS2) LOSC2)
(check-expect (student-cards LOS3) LOSC3)

; (define (student-cards los) empty) ;stub

(define (student-cards los)
  (cond [(empty? los) empty]
        [else
         (cons (create-student-card (first los))
               (student-cards (rest los)))]))

;; Student -> StudentCard
;; It consumes a student and produces a student card with the given student information
(check-expect (create-student-card S1) SC1)
(check-expect (create-student-card S2) SC2)


;(define (create-student-card s) "") ;stub

(define (create-student-card s)
  (string-append (student-name s)
                 " "
                 (number->string (student-id   s))))