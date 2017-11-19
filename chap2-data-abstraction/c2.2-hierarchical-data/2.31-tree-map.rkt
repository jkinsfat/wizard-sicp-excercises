; Exercise 2.31.  Abstract your answer to exercise 2.30 to produce a
;  procedure tree-map with the property that square-tree could be defined as
(define (square-tree tree) (tree-map square tree))

(define (square x) (* x x))

(define (tree-map proc tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (proc tree))
        (else (cons (tree-map proc (car tree))
                    (tree-map proc (cdr tree))))))

(square-tree (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
;'(1 (4 (9 16) 25) (36 49))