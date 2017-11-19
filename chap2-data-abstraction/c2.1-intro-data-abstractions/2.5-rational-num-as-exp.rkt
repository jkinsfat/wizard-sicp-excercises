;Exercise 2.5.  Show that we can represent pairs of nonnegative integers using 
; only numbers and arithmetic operations if we represent the pair a and b as the 
; integer that is the product of 2^a * 3^b.
; Give the corresponding definitions of the procedures cons, car, and cdr.

;; Any positive rational number can be represented as the product of 2 raised to 
;; the power of a and 3 raised to the power of b where 2^a is the even component 
;; of the number and 3^a is the odd component. 

;; In this system cons a b would return the integer
;; car of integer i would return the a component of the integer calculated by repeatedly
;; dividing i by 3 until non-divisible and returning the number of divisions.
;; cdr i returns the b component of the integer by repeatedly dividing i by 
;; 2 until non-divisible and returning the number of divisions.

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car i) 
  (define (find-a int acc)
    (if (integer? (/ i 3))
      (find-b (/ i 2) (+ acc 1))
      acc)) 
  (find-a i 0))

(define (cdr i) 
  (define (find-b int acc)
    (if (integer? (/ i 3))
      (find-b (/ i 3) (+ acc 1))
      acc)) 
  (find-b i 0))

