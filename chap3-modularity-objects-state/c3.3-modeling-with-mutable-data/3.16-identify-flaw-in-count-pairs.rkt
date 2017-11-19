Exercise 3.16.  Ben Bitdiddle decides to write a procedure to count the number
of pairs in any list structure. ``It's easy,'' he reasons. ``The number of pairs
in any structure is the number in the car plus the number in the cdr plus one
more to count the current pair.'' So Ben writes the following procedure:

(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

Show that this procedure is not correct. In particular, draw box-and-pointer 
diagrams representing list structures made up of exactly three pairs for which
 Ben's procedure would return 3 return 4 return 7 and never return at all.


(define z (cons '(a) '(b)))
;z -> (*)(*) -> (*)(/)
;      |         |
;      v         v
;     (*)(/)     b
;      |
;      v
;      a
(count-pairs z)
; 3

(define x '(a))
(define b (list x))
(define y (cons x b))
; x -> (*)(*) 
;       |  |       
;       |  v
;       | (*)(/)
;       |  |  
;       |  |
;       |  |
;       |  |
;       v<--
;      (*)(/) 
;       |  
;       v 
;       a          
(count-pairs y)
; 4

(define c '(a))
(define e (cons c c))
(define m (cons e e))
;m -> (*)(*)
;      |  |
;      v  v
;     (*)(*)
;      |  |
;      v  v
;     (*)(/)
;      |
;      v
;      a
(count-pairs m)
; 7

(define q ('a 'b 'c))
(set-cdr! (cddr q) q)
(count-pairs q)
; Never Evaluates 

