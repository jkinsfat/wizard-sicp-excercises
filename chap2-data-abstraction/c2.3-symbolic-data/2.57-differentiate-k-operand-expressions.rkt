; Exercise 2.57.  Extend the differentiation program to handle sums and products of arbitrary numbers 
; of (two or more) terms. Then the last example above could be expressed as

; (deriv '(* x y (+ x 3)) 'x)

; Try to do this by changing only the representation for sums and products, without changing the deriv
;  procedure at all. For example, the addend of a sum would be the first term, and the augend would be 
;  the sum of the rest of the terms.

(define (variable? exp) (symbol? exp))
(define (same-variable? v1 v2) (eq? v1 v2))
(define (equal-number? value num) (and (number? value) (= value num)))

;; I re-implemented make-sum to take an undefined number of arguments. 
;; If there are more than 3 arguments given then it iterates through list of extra arguments by calling
;; make-sum on them. 
(define (make-sum a1 a2 . an)
  (define (sum-help a1 a2)
    (cond ((equal-number? a1 0) a2)
      ((equal-number? a2 0) a1)
      ((and (number? a1) (number? a2)) (+ a1 a2))
      (else (list '+ a1 a2))))
  (cond ((null? an) (sum-help a1 a2))
        ((null? (cdr an)) (make-sum (car an) (sum-help a1 a2) ))
        (else (make-sum (car an) (sum-help a1 a2) (cdr an)))))

(define (sum? exp) (and (pair? exp) (eq? (car exp) '+)))
(define (addend sum) (cadr sum))
(define (augend sum) (caddr sum))

(define (make-product a1 a2)
  (cond ((or (equal-number? a1 0) (equal-number? a2 0)) 0)
        ((equal-number? a1 1) a2)
        ((equal-number? a2 1) a1)
        ((and (number? a1) (number? a2)) (* a1 a2))
        (else (list '* a1 a2)))

(define (product? exp) (and (pair? exp) (eq? (car exp) '*)))
(define (multiplier product) (cadr product))
(define (multiplicand product) (caddr product))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
        (else
         (error "unknown expression type -- DERIV" exp))))

