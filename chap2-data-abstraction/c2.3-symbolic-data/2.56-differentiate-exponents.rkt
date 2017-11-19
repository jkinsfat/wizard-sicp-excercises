; Exercise 2.56.  Show how to extend the basic differentiator to handle more kinds of expressions. 
; For instance, implement the differentiation rule of u raised to a power n by adding a new clause
; to the deriv program and defining appropriate procedures exponentiation?, base, exponent, and 
; make-exponentiation. (You may use the symbol ** to denote exponentiation.) Build in the rules 
; that anything raised to the power 0 is 1 and anything raised to the power 1 is the thing itself.
(define (variable? exp) (symbol? exp))
(define (same-variable? v1 v2) (eq? v1 v2))
(define (equal-number? value num) (and (number? value) (= value num)))

(define (make-sum a1 a2)
  (cond ((equal-number? a1 0) a2)
        ((equal-number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))

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

;;**********************
(define (make-exponent b e)
  (cond ((=number? e 0) 1)
        ((=number? e 1) b)
        ((and (number? b) (number? e)) (expt b e))
        (else (list 'expt base exponent))))

(define (exponentiation? exp) (and (pair? exp) (eq? (car exp) 'expt)))
(define (base exponentiation) (cadr exponentiation))
(define (exponent exponentiation) (caddr exponentiaton))
;;**********************

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
        ((exponentiation? exp)
         (if (same-variable? (exponent exp) var)
             exp
             (make-product (base exp) 
                           (make-exponent (base exp) 
                                          (make-sum (exponent exp)
                                                    (- 1))))))
        (else
         (error "unknown expression type -- DERIV" exp))))

