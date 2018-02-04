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