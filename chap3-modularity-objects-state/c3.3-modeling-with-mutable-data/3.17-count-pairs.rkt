Exercise 3.17.  Devise a correct version of the count-pairs procedure of exercise 3.16 
that returns the number of distinct pairs in any structure. (Hint: Traverse the structure, 
maintaining an auxiliary data structure that is used to keep track of which pairs have already been counted.)

(define (count-pairs li)
 ; (define (pair-list-contains li pair)
    ; (and (not (null? li))
    ;      (or (eq? (car li) pair)
    ;          (pair-list-contains (cdr li) pair)))) Can use memq instead
  (define (iter li pair-list)
    (if (or (not (pair? li))
            (memq li pair-list))
        0
        (+ (iter (car li) (cons li pair-list))
           (iter (cdr li) (cons li pair-list))
           1)))
  (iter li '()))
