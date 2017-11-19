; Exercise 2.35.  Redefine count-leaves from section 2.2.2 as an accumulation:
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map proc li)
  (if (null? li) 
      li
      (cons (proc (car li)) 
            (map proc (cdr li)))))

; (define (count-leaves x)
;   (cond ((null? x) 0)  
;         ((not (pair? x)) 1)
;         (else (+ (count-leaves (car x))
;                  (count-leaves (cdr x))))))


(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) 
                               (cond ((null? x) 0)
                                     ((pair? x) (count-leaves x))
                                     (else 1)))
                       t)))