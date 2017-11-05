;Exercise 2.1.  Define a better version of make-rat that handles both positive and negative arguments.
;Make-rat should normalize the sign so that if the rational number is positive,
;both the numerator and denominator are positive, and if the rational number is negative, only the numerator is negative.
;
; Old: (define (make-rat n d) (cons n d))
(define (make-rat n d) 
  (if (positive? (/ n d))
    (if (positive? n) 
      (cons n d)
      (cons (- n) (- d)))
    (if (positive? n)
      (cons n (- d))
      (cons (- n) d))))