; Exercise 3.7.  Consider the bank account objects created by make-account, with the password
;  modification described in exercise 3.3. Suppose that our banking system requires the ability
;  to make joint accounts. Define a procedure make-joint that accomplishes this. Make-joint
;  should take three arguments. The first is a password-protected account. The second argument
;  must match the password with which the account was defined in order for the make-joint 
;  operation to proceed. The third argument is a new password. Make-joint is to create an 
;  additional access to the original account using the new password. For example,
;  if peter-acc is a bank account with password open-sesame, then

; (define paul-acc
;   (make-joint peter-acc 'open-sesame 'rosebud))

; will allow one to make transactions on peter-acc using the name paul-acc and the password 
; rosebud. You may wish to modify your solution to exercise 3.3 to accommodate this new feature.

(define (make-joint account old-pass new-pass)
  (if (number? ((account old-pass 'withdraw) 0)) 
    (lambda (password method)
      (if (not (eq? password new-pass))
        (account #f 'fizzbuzz)
        (account old-pass method)))
    "Cannot make a joint account unless authenticated to use original account")

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
  (define (dispatch password method)
    (if (not (eq? password secret-pass))
        invalid-pass
        (cond ((eq? method 'deposit) deposit)
              ((eq? method 'withdraw) withdraw)
              (else "Error: function requested is not valid"))))
  dispatch)

(define my-account (make-account 100 'bugs))

(define my-joint-acc (make-joint my-account 'bugs 'beans))
((my-joint-acc 'beans 'withdraw) 50)
(define my-other-joint (make-joint my-account 'eggs 'beans))
((my-other-joint 'beans 'withdraw) 50)
