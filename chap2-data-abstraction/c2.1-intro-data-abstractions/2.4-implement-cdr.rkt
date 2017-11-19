; Exercise 2.4.  Here is an alternative procedural representation of pairs. 
; For this representation, verify that (car (cons x y)) yields x for any objects x and y.

; (define (cons x y)
;   (lambda (m) (m x y)))

; (define (car z)
;   (z (lambda (p q) p)))

; What is the corresponding definition of cdr? (Hint: To verify that this works, 
; make use of the substitution model of section 1.1.5.)


(define (cdr z)
  (z (lambda (p q) q)))
; Cons takes two arguments x and y then returns a function. This function
; takes a function with two parameters as its argument then calls
; that function, passing in x and y as arguments to those two parameters. 
;
; Cdr takes the function returned by cons and calls it, passing in a lambda function that takes 
; two arguments and returns the latter. The cons-returned function calls the lambda function
; with arguments x and y. The lambda function returns y.
