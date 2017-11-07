;Exercise 2.18.  Define a procedure reverse that takes a list as argument
;  and returns a list of the same elements in reverse order:

(define (reverse li)
  (define (rev-iter li result)
    (if (null? li)
      result
      (rev-iter (cdr li) (append (list (car li)) result))))
  (rev-iter li '() ))

(define (recur-reverse li)
  (if (null? li)
    li
    (append (recur-reverse (cdr li)) (list (car li)))))
