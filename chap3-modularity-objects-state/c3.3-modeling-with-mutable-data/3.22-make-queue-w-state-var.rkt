Exercise 3.22.  Instead of representing a queue as a pair of pointers, we can
 build a queue as a procedure with local state. The local state will consist 
 of pointers to the beginning and the end of an ordinary list. Thus, the 
 make-queue procedure will have the form

(define (make-queue)
  (let ((front-ptr ...)
        (rear-ptr ...))
    <definitions of internal procedures>
    (define (dispatch m) ...)
    dispatch))

Complete the definition of make-queue and provide implementations of the queue 
operations using this representation.

(define (make-queue)
  (let ((front-ptr '())
        (back-ptr '()))
    (define (empty?)
      (null? front-ptr))
    (define (front)
      (car front-ptr))
    (define (insert item)
      (let ((temp (cons item '())))
        (cond ((empty?)
               (begin (set! front-ptr temp)
                      (set! back-ptr temp)))
              (else 
                (begin (set-cdr! back-ptr temp)
                       (set! back-ptr temp))))))
    (define (delete)
      (if (empty?)
          "Error: cannot delete from empty queue"
          (set! front-ptr (cdr front-ptr))))
    (define (dispatch m)
      (cond ((eq? m 'empty?) (empty?))
            ((eq? m 'front) (front))
            ((eq? m 'insert) insert)
            ((eq? m 'delete) (delete))
            (else "requested function not defined")))
    dispatch))
