#lang racket

; Hepler for lcycle-old function. Creates list within a list ((2 3 4 5) 1)
(define (lcycle-helper m n)
  (if (pair? m)
      (cons m (lcycle-helper (car m) n))
      (list n)))

; Left cycle the list. Now working properly. List within the list.
(define (lcycle-old m)
  (lcycle-helper (cdr m) (car m)))

; Very simple version using append. Working correctly
(define (lcycle-append m)
  (append (cdr m) (list (car m))))

; Helper funtion for lcycle takes in n:first number of array m:rest of the array
; Takes in example m:(2 3 4 5) n:1 returns (2 3 4 5 1)
(define (lcycleH m n)
  (if(pair? m)
     (cons (car m) (lcycleH (cdr m) n))
     (list n)))

; Properly working lcycle function.
; Example: m:(1 2 3 4 5) returns (2 3 4 5 6)
(define (lcycle m)
  (lcycleH (cdr m) (car m)))

; First helping function for rcycle.
; Returns last element of the list
(define (lastE m)
  (if(pair? (cdr m))
     (lastE (cdr m))
     (car m)))

; Helping function for rcycle.
; Returns list m without last Element of the list.
(define (list-no-last m)
(if(pair? (cdr (cdr m)))
   (cons (car m)
         (list-no-last (cdr m)))
   (list (car m))))

; rcycle function. Shifts the list cyclically, one place to the right.
; Example: (rcycle (list 1 2 3 4 5)) returns: '(5 1 2 3 4)
(define (rcycle m)
  (if (pair? m) (cons (lastE m) (list-no-last m))
      m))


