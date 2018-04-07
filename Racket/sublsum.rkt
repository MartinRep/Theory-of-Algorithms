#lang racket

(define (mySum L)
  (if (empty? L) 0
      (+ (car L) (mySum (cdr L))))
  )

(define (myMap f l)
  (if (null? l)
      null
      (cons (f (car l)) (myMap f (cdr l)))))



(define (sublsum l)
  (myMap (lambda(subl) (if (= (mySum subl) 0)
                         subl
                         #t))
       (combinations l)))

(define (subLsum subL)
  (if (null? subL)
      null
      (cons (if (= (mySum (car subL)) 0)
                (cons (car subL) (subLsum (cdr subL)))
                (subLsum (cdr subL)))
            (subLsum (cdr subL)))
  )
)

(define (subLsumStart l)
  (subLsum (combinations l)))

(define (cleanL l)
  (if (pair? l)
      (cons (car l) (cleanL (cdr l)))
      '()
      ))
