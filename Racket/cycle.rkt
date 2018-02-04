#lang racket

; Helper for lcycle-old function.
; Not working correctyl. Creates list within a list.
; Example: (lcycle-helper '(2 3 4 5) 1)
; Returns: '((2 3 4 5) 1)
(define (lcycle-helper m n)
  (if (pair? m)
      (cons m (lcycle-helper (car m) n))
      (list (car n))))

; Cyclically shift the list to the left.
; Not working properly. Creates a List within the list.
; Example: (lcycle-old (list 1 2 3 4 5))
; Returns: '((2 3 4 5) 1)
(define (lcycle-old m)
  (lcycle-helper (cdr m) m))

; Very simple version using append. Works correctly.
; Example: (lcycle-append (list 1 2 3 4 5))
; Returns: '(2 3 4 5 1)
(define (lcycle-append m)
  (append (cdr m) (list (car m))))

; Helper funtion for lcycle. n:first number of array m:rest of the array
; Example m:(2 3 4 5) n:1
; Returns '(2 3 4 5 1)
(define (lcycleH m n)
  (if(pair? m)
     (cons (car m) (lcycleH (cdr m) n))
     (list n)))

; Properly working lcycle function.
; Example: m:(1 2 3 4 5)
; Returns '(2 3 4 5 6)
(define (lcycle m)
  (lcycleH (cdr m) (car m)))

; Helping function for rcycle.
; Returns last element of the list.
; Example:  (lastE (list 1 2 3 4 5))
; Returns: 5
(define (lastE m)
  (if(pair? (cdr m))
     (lastE (cdr m))
     (car m)))

; Helping function for rcycle.
; Returns list m without last Element of the list.
; Example: (list-no-last (list 1 2 3 4 5))
; Returns: '(1 2 3 4)
(define (list-no-last m)
(if(pair? (cdr (cdr m)))
   (cons (car m)
         (list-no-last (cdr m)))
   (list (car m))))

; rcycle function. Shifts the list cyclically, one place to the right.
; Example: (rcycle (list 1 2 3 4 5))
; Returns: '(5 1 2 3 4)
(define (rcycle m)
  (if (pair? m) (cons (lastE m) (list-no-last m))
      m))
