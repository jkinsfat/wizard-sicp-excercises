Exercise 2.58.  Suppose we want to modify the differentiation program so that it 
works with ordinary mathematical notation, in which + and * are infix rather than 
prefix operators. Since the differentiation program is defined in terms of abstract 
data, we can modify it to work with different representations of expressions solely 
by changing the predicates, selectors, and constructors that define the representation
 of the algebraic expressions on which the differentiator is to operate.

a. Show how to do this in order to differentiate algebraic expressions presented in
 infix form, such as (x + (3 * (x + (y + 2)))). To simplify the task, assume that +
  and * always take two arguments and that expressions are fully parenthesized.
 
(define (variable? exp) (symbol? exp))
(define (same-variable? v1 v2) (eq? v1 v2))
(define (equal-number? value num) (and (number? value) (= value num)))

(define (make-sum a1 a2)
  (cond ((equal-number? a1 0) a2)
        ((equal-number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list a1 '+ a2)))) ;; Change order to infix

(define (sum? exp) (and (pair? exp) (eq? (cadr exp) '+))) ;; Operator is second element in list
(define (addend sum) (car sum)) ;; First operand is now first item in list
(define (augend sum) (caddr sum) 

(define (make-product a1 a2)
  (cond ((or (equal-number? a1 0) (equal-number? a2 0)) 0)
        ((equal-number? a1 1) a2)
        ((equal-number? a2 1) a1)
        ((and (number? a1) (number? a2)) (* a1 a2))
        (else (list a1 '*  a2))) ;; Change order to infix

(define (product? exp) (and (pair? exp) (eq? (cadr exp) '*))) ;;Operator is second item in list
(define (multiplier product) (car product)) ;; First operand is now first item in list
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

b. The problem becomes substantially harder if we allow standard algebraic notation,
 such as (x + 3 * (x + y + 2)), which drops unnecessary parentheses and assumes that 
 multiplication is done before addition. Can you design appropriate predicates, 
 selectors, and constructors for this notation such that our derivative program still works?


 ;; work in progress....