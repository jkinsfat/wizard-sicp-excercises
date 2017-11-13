; Exercise 2.55.  Eva Lu Ator types to the interpreter the expression

; (car ''abracadabra)

; To her surprise, the interpreter prints back quote. Explain.

The quotation mark is syntactic sugar for the procedure quote which takes a single argument.
The interpreter then interprets ''abracadabra as (quote (quote abracadabra)) which returns '(quote abracadabra) 
The car of this list is the procedure name quote 