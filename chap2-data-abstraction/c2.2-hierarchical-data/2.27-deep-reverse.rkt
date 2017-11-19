; Exercise 2.27.  Modify your reverse procedure of exercise 2.18 
; produce a deep-reverse procedure that takes a list as argument
; and returns as its value the list with its elements reversed 
; and with all sublists deep-reversed as well. For example,

; (define x (list (list 1 2) (list 3 4)))

; x
; ((1 2) (3 4))

; (reverse x)
; ((3 4) (1 2))

; (deep-reverse x)
; ((4 3) (2 1))

;; Old reverse function for reference... 
; (define (reverse li)
;   (define (rev-iter li result)
;     (if (null? li)
;       result
;       (rev-iter (cdr li) (append (list (car li)) result))))
;   (rev-iter li '() ))
  
(define (deep-reverse li)
  (define (deep-rev-iter li result)
    (cond ((null? li) result)
          ((pair? (car li)) 
            (deep-rev-iter (cdr li)
                           (append
                              (list (deep-rev-iter (car li) null))
                              result)))
          (else (deep-rev-iter (cdr li) (append (list (car li)) result)))))
    (deep-rev-iter li null))


(define (deep-reverse-r li) 
  (cond ((null? li) null)
        ((pair? (car li)) 
         (append 
           (deep-reverse-r (cdr li))
           (list (deep-reverse-r (car li))))
        ((else (append 
          (deep-reverse-r (cdr li)) 
          (list (car li)))))))
