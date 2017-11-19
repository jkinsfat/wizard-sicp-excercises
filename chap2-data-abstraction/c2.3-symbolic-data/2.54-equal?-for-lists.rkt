; Exercise 2.54.  Two lists are said to be equal? if they contain equal
;  elements arranged in the same order. For example,

; (equal? '(this is a list) '(this is a list))

; is true, but

; (equal? '(this is a list) '(this (is a) list))

; is false. To be more precise, we can define equal? recursively in terms 
; of the basic eq? equality of symbols by saying that a and b are equal? 
; if they are both symbols and the symbols are eq?, or if they are both 
; lists such that (car a) is equal? to (car b) and (cdr a) is equal? to 
; (cdr b). Using this idea, implement equal? as a procedure.

; (define (equal? L1 L2)
;   (cond ((and (null? L1) (null? L2)) #t)
;         ((eq? (car L1) (car L2)) (equal? (cdr L1 L2)))
;         (else #f)))

;; Does not handle case where given data that is not a pair. 
;; Also, if car of the list is an inner list it will try to pass that as argument to eq?
;; whereas we need to pass it to equal? 
;; Also would be better to not explicitly return true and false but have it 
;; implicitly returned as the result of a conditional .

(define (equal? d1 d2)
  (or (and (not (pair? d1))
           (not (pair? d2))
           (eq? d1 d2))
      (and (pair? d1)
           (pair? d2)
           (equal? (car d1) (car d2))
           (equal? (cdr d1) (cdr d2)))))
