; Exercise 3.3.  Modify the make-account procedure so that it creates 
; password-protected accounts. That is, make-account should take a
; symbol as an additional argument, as in

; (define acc (make-account 100 'secret-password))

; The resulting account object should process a request only if it is 
; accompanied by the password with which the account was created, and 
; should otherwise return a complaint:

; ((acc 'secret-password 'withdraw) 40)
; 60

; ((acc 'some-other-password 'deposit) 50)
; "Incorrect password"

(define (make-account balance secret-pass)
  (define (withdraw amount)
    (if (> amount balance)
      "Deposit exceeds account balance"
      (begin 
        (set! balance (- balance amount))
        balance)))
  (define (deposit amount)
    (begin 
      (set! balance (+ balance amount))
      balance))
  (define (invalid-pass value)
    "Incorrect password, please try again")
  (define (router password method)
    (if (not (eq? password secret-pass))
        invalid-pass
        (cond ((eq? method 'deposit) deposit)
              ((eq? method 'withdraw) withdraw)
              (else "Error: function requested is not valid"))))
  router)

(define my-account (make-account 100 'bugs))

((my-account 'dogs 'withdraw) 50)
((my-account 'bugs 'withdraw) 50)
((my-account 'bugs 'deposit) 200)
