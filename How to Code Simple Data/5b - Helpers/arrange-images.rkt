;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname arrange-images) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; Constants

;; Data Definitions:

;; ListOfImage is one of:
;;  - empty
;; (cons Image ListOfImage)

(define LOI1 empty)
(define LOI2 (cons (square 10 "solid" "red")  LOI1))
(define LOI3 (cons (circle 11 "solid" "blue") LOI2))
(define LOI4 (cons (rectangle 5 10 "solid" "green") LOI3))
  
 #;
(define (fn-for-loi loi)
  (cond [(empty? loi) (...)]          ;BASE CASE
        [else
         (...
          (first loi)				;Image
          (fn-for-loi (rest loi)))])) ;NATURAL RECURSION
  
;; ListOfImage -> Image
;; It lay out images left to right in increasing order of size

(check-expect (arrange-images LOI1) empty-image);
(check-expect (arrange-images LOI2)
              (beside 
               (square 10 "solid" "red")
               empty-image));
(check-expect (arrange-images LOI3)
              (beside 
               (square 10 "solid" "red")
               (circle 11 "solid" "blue")
               empty-image));
(check-expect (arrange-images LOI4)
              (beside
               (rectangle 5 10 "solid" "green")
               (square 10 "solid" "red")
               (circle 11 "solid" "blue")
               empty-image));

;(define (arrange-images loi) empty-image) ;stub

(define (arrange-images loi)
  (layout-images (sort-images loi)))

;; ListOfImages -> ListOfImages
;; It consumes a list of images and produces the sorted version of thar list
;; 		the sorting is in increasing order of size
;!!!

(check-expect (sort-images LOI1) empty);
(check-expect (sort-images LOI2)
              (cons
               (square 10 "solid" "red")
               empty));
(check-expect (sort-images LOI3)
              (cons 
               (square 10 "solid" "red")
               (cons
               (circle 11 "solid" "blue")
               empty)));
(check-expect (sort-images LOI4)
              (cons
               (rectangle 5 10 "solid" "green")
               (cons
               (square 10 "solid" "red")
               (cons
               (circle 11 "solid" "blue")
               empty))));

;(define (sort-images loi) loi) ;stub

(define (sort-images loi)
  (cond [(empty? loi) empty]          ;BASE CASE
        [else
         (if (> (calculate-are img) )
          (first loi)				;Image
          (sort-images (rest loi)))])) ;NATURAL RECURSION

;; Image -> Natural
;; It consumes a image and produces its area

(define (calculate-are img)
  (* (image-width img) (image-height img)))

;; ListOfImages -> Image
;; It lay out images left to right
;;!!!

(check-expect (arrange-images LOI1) empty-image);
(check-expect (arrange-images LOI2)
              (beside 
               (square 10 "solid" "red")
               empty-image));
(check-expect (arrange-images LOI3)
              (beside 
               (circle 11 "solid" "blue")
               (square 10 "solid" "red")
               empty-image));
(check-expect (arrange-images LOI4)
              (beside
               (rectangle 5 10 "solid" "green")
               (circle 11 "solid" "blue")
               (square 10 "solid" "red")
               empty-image));

; (define (layout-images loi) empty-image) ; stub

 (define (layout-images loi)
  (cond [(empty? loi) empty-image]          ;BASE CASE
        [else
         (beside
          (first loi)				;Image
          (layout-images (rest loi)))])) ;NATURAL RECURSION