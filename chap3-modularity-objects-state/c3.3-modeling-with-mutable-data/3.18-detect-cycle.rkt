; Exercise 3.18.  Write a procedure that examines a list and determines whether it 
; contains a cycle, that is, whether a program that tried to find the end of the 
; list by taking successive cdrs would go into an infinite loop. Exercise 3.13
; constructed such lists.

(define (cycle? li)
  (let ((seen '()))
    (define (iter x)
      (set! seen (cons x seen))
      (cond ((null? (cdr x)) #f)
            ((memq (cdr x) seen) #t)
            (else (iter (cdr x))))))
  (iter li))