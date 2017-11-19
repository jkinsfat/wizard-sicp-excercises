Exercise 3.13.  Consider the following make-cycle procedure, which uses 
the last-pair procedure defined in exercise 3.12:

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

Draw a box-and-pointer diagram that shows the structure z created by
(define z (make-cycle (list 'a 'b 'c)))

Question: What happens if we try to compute (last-pair z)?

Answer: The cdr of x's last pair (c null) will be changed from a null to a pointer that 
  references the first pair of x (a b). This has now created a referential loop z which
  has no last pair. The procedure last-pair, when applied to z, will never stop.