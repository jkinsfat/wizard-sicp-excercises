; Exercise 2.33.  Fill in the missing expressions to complete the following
;  definitions of some basic list-manipulation operations as accumulations:

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

; (define (map p sequence)
;   (accumulate (lambda (x y) <??>) nil sequence))

(define (map p sequence)
  (accumulate (lambda (first accumulated) (cons (p first) accumulated) nil sequence))

; (define (append seq1 seq2)
;   (accumulate cons <??> <??>))

(define (append seq1 seq2)
  (accumulate cons seq1 seq2))

; (define (length sequence)
;   (accumulate <??> 0 sequence))

(define (length sequence)
  (accumulate (lambda (first accumulated) (+ accumulated 1)) 0 sequence))



