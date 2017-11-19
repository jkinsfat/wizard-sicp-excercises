; Exercise 2.37.  Suppose we represent vectors v = (vi) as sequences of numbers,
; and matrices m = (mij) as sequences of vectors (the rows of the matrix). For example, the matrix


; is represented as the sequence ((1 2 3 4) (4 5 6 6) (6 7 8 9)). With this representation,
;  we can use sequence operations to concisely express the basic matrix and vector operations.
; These operations (which are described in any book on matrix algebra) are the following:


; We can define the dot product as17

; (define (dot-product v w)
;   (accumulate + 0 (map * v w)))

; Fill in the missing expressions in the following procedures for computing the other matrix operations.
; (The procedure accumulate-n is defined in exercise 2.36.)

(define (map proc seq)
  (if (null? seq)
    '()
    (cons (proc (car seq)) (map proc (cdr seq)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seq)
  (if (null? (car seq))
      '()
      (cons (accumulate op init (map car seq))
            (accumulate-n op init (map cdr seq)))))

(define (dot-product v w)
  (accumulate + 1 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))

(define (transpose mat)
  (accumulate-n cons '() mat))

  ((1 2 3) (4 5 6)) -> ((1 4)(2 5)(3 6))
  ((1 2 3) (4 5 6) (7 8 9)) -> ((1 4 7) (2 5 8) (3 6 9))
  (transpose (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (m-row) (matrix-*-vector cols m-row)) m)))