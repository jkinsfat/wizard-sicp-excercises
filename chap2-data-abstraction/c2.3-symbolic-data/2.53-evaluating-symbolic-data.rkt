;Exercise 2.53.  What would the interpreter print in response to evaluating each of the following expressions?

(list 'a 'b 'c)
'(a b c)

(list (list 'george))
'((george))

(cdr '((x1 x2) (y1 y2)))
'((y1 y2))

(cadr '((x1 x2) (y1 y2)))
'(y1 y2)

(pair? (car '(a short list)))
#f

(memq 'red '((red shoes) (blue socks)))
#f ;I originally thought it would be true, but memq only traverses the highest list to search for a match

(memq 'red '(red shoes blue socks))
#t

