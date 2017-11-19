; Exercise 2.6.  In case representing pairs as procedures wasn't mind-boggling enough, 
; consider that, in a language that can manipulate procedures, we can get by without numbers
; (at least insofar as nonnegative integers are concerned) by implementing 0 and the operation of adding 1 as

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; This representation is known as Church numerals, after its inventor, Alonzo Church, the logician who invented the  calculus.

; Define one and two directly (not in terms of zero and add-1). (Hint: Use substitution to evaluate (add-1 zero)). 
; Give a direct definition of the addition procedure + (not in terms of repeated application of add-1).


(define one (add-1 zero))
(define one (lambda (f)
              (lambda (x)
                (f ((zero f) x)))))
(define one (lambda (f)
              (lambda (x)
                (f (((lambda (f) (lambda (x) x)) f) x)))))
(define one (lambda (f)
              (lambda (x)
                (f ((lambda (x) x) x)))))

;; One Reduced 
(define one (lambda (f) (lambda (x) (f x))))
;;

(define two (add-1 one))
(define two (lambda (f) (lambda (x) (f ((n f) x))) (lambda (f) (lambda (x) (f x)))))
(define two (lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) (f x))) f) x)))))
(define two (lambda (f) (lambda (x) (f ((lambda (x) (f x)) x)))))

;; Two Reduced
(define two (lambda (f) (lambda (x) (f (f x)))))
;; 

(define (add a b) 
  (lambda (f)
    (lambda (x)
      (a f) ((b f) x))))

;; Add should take in two Church numerals, a and b, and return a Church numeral. This means
;; that what add returns should have the same structure as numerals One and Two.
;; The structure is two nested lambda functions with single parameters f and x respectively.
;; The inner lambda function returns a chain of z composed calls of f upon x where z = a + b.
;; All we need to do is connect a's chain of calls to f with b's chain of calls to f. 
;; We access b's chain by passing f to b which returns b's inner lambda function. We call this function
;; passing in x and we are returned b's chain of composed calls to f on the value x. We then can pass this
;; entire chain as the x argument to a's inner lambda function, which we access by calling a with the argument f.
;; Now our add function's inner lambda returns f composed z= a + b times upon x.
