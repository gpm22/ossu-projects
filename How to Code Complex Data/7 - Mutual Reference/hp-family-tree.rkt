;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname hp-family-tree) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; hp-family-tree.rkt

;In this problem set you will represent information about descendant family 
;trees from Harry Potter and design functions that operate on those trees.

;To make your task much easier we suggest two things:
;  - you only need a DESCENDANT family tree
;  - read through this entire problem set carefully to see what information 
;    the functions below are going to need. Design your data definitions to
;    only represent that information.
;  - you can find all the information you need by looking at the individual 
;    character pages like the one we point you to for Arthur Weasley.


;PROBLEM 1:

;Design a data definition that represents a family tree from the Harry Potter 
;wiki, which contains all necessary information for the other problems.  You 
;will use this data definition throughout the rest of the homework.

(define-struct descendant (name patronus wand children))
;; Descendant is (make-descendant String String String ListOfDescendant)
;; interp. An Descendant is a member of a family from Harry Potter Universe.
;;         if some information is missing, it will represented as "".

;; ListOfDescendant if one of:
;; - empty
;; - (cons Descendant ListOfDescendant)
;; interp. A list of Descendants.

#;
(define (fn-for-descendant d)
  (... (descendant-name d)                    ;String
       (descendant-patronus d)                ;String
       (descendant-wand d)                    ;String
       (fn-for-lod (descendant-children d)))) ;ListOfDescendant

#;
(define (fn-for-lod lod)
  (cond [(empty? lod) (...)]
        [else
         (... (fn-for-descendant (first lod)) ;Descendant
              (fn-for-lod (rest lod)))]))     ;ListOfDescendat

;PROBLEM 2: 

;Define a constant named ARTHUR that represents the descendant family tree for 
;Arthur Weasley. You can find all the infomation you need by starting 
;at: http://harrypotter.wikia.com/wiki/Arthur_Weasley.

;You must include all of Arthur's children and these grandchildren: Lily, 
;Victoire, Albus, James.

;Note that on the Potter wiki you will find a lot of information. But for some 
;people some of the information may be missing. Enter that information with a 
;special value of "" (the empty string) meaning it is not present. Don't forget
;this special value when writing your interp.

(define VICTORIE (make-descendant
                  "Victorie"
                  ""
                  ""
                  empty))

(define DOMINIQUE (make-descendant
                   "Dominique"
                   ""
                   ""
                   empty))

(define LOUIS (make-descendant
               "Louis"
               ""
               ""
               empty))

(define WILLIAM (make-descendant
                 "William"
                 "Non-corporeal"
                 "Unknown length, wood and core"
                 (list VICTORIE DOMINIQUE LOUIS)))

(define CHARLES (make-descendant
                 "Charles"
                 "Non-corporeal"
                 "12', Ash, unicorn tail hair"
                 empty))


(define MOLLY (make-descendant
               "Molly"
               ""
               ""
               empty))

(define LUCY (make-descendant
              "Lucy"
              ""
              ""
              empty))

(define PERCY (make-descendant
               "Percy"
               "Non-corporeal"
               "Unknown length, wood and core"
               (list MOLLY LUCY)))

(define FRED (make-descendant
              "Fred"
              "Magpie"
              "Unknown length, wood and core"
              empty))

(define FRED2 (make-descendant
               "Fred II"
               ""
               ""
               empty))

(define ROXANNE (make-descendant
                 "Roxanne"
                 ""
                 ""
                 empty))

(define GEORGE (make-descendant
                "George"
                "Magpie"
                "Unknown length, wood and core"
                (list FRED2 ROXANNE)))

(define ROSE (make-descendant
              "Rose"
              ""
              ""
              empty))

(define HUGO (make-descendant
              "Hugo"
              ""
              ""
              empty))

(define RONALD (make-descendant
                "Ronald"
                "Jack Russell terrier"
                "9(1/4)', Chestnut, Dragon heartstring"
                (list ROSE HUGO)))

(define JAMES (make-descendant
               "James"
               ""
               ""
               empty))

(define ALBUS (make-descendant
               "Albus"
               ""
               "Cherry, Unknown length and core"
               empty))

(define LILY (make-descendant
              "Lily"
              ""
              ""
              empty))

(define GINEVRA (make-descendant
                 "Ginevra"
                 "Horse"
                 "Yew, unknown length, unknown core"
                 (list JAMES ALBUS LILY)))


(define ARTHUR (make-descendant
                "Arthur"
                "Weasel"
                "Unknown length, wood and core"
                (list WILLIAM CHARLES PERCY FRED GEORGE RONALD GINEVRA)))

;PROBLEM 3:

;Design a function that produces a pair list (i.e. list of two-element lists)
;of every person in the tree and his or her patronus. For example, assuming 
;that HARRY is a tree representing Harry Potter and that he has no children
;(even though we know he does) the result would be: (list (list "Harry" "Stag")).

;You must use ARTHUR as one of your examples.

(check-expect (pair--lod empty) empty)
(check-expect (pair--lod (descendant-children FRED2)) empty)
(check-expect (pair--descendant FRED2) (list (list "Fred II" "")))
(check-expect (pair--lod (descendant-children PERCY)) (list (list "Molly" "") (list "Lucy" "")))
(check-expect (pair--descendant PERCY) (list (list "Percy" "Non-corporeal") (list "Molly" "") (list "Lucy" "")))


(define (pair--descendant d) empty)
(define (pair--lod lod) empty)


;PROBLEM 4:

;Design a function that produces the names of every person in a given tree 
;whose wands are made of a given material. 

;You must use ARTHUR as one of your examples.

