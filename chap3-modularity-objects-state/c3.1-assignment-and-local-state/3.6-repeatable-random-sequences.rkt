; Exercise 3.6.  It is useful to be able to reset a random-number generator 
; to produce a sequence starting from a given value. Design a new rand procedure
; that is called with an argument that is either the symbol generate or the 
; symbol reset and behaves as follows: (rand 'generate) produces a new random 
; number; ((rand 'reset) <new-value>) resets the internal state variable to the
; designated <new-value>. Thus, by resetting the state, one can generate repeatable
; sequences. These are very handy to have when testing and debugging programs 
; that use random numbers.

(define random-init 2)
(define (rand-update x) (expt (+ x 1) 2))

(define rand
  (let ((x random-init))
    (define (dispatch message)
      (cond ((eq? message 'generate) 
              (begin (set! x (rand-update x))
                     x))
            ((eq? message 'reset)
              (lambda (new-val)
                (set! x new-val)))
            (else 'help)))
    dispatch))

(rand 'generate)
(rand 'generate)
(rand 'generate)
((rand 'reset) 2)
(rand 'generate)