; Exercise 3.4.  Modify the make-account procedure of exercise 3.3 by adding 
; another local state variable so that, if an account is accessed more than 
; seven consecutive times with an incorrect password, it invokes the procedure
; call-the-cops.

(define (make-account balance secret-pass)
  (let ((guesses 0))
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
    (if (> guesses 6)
      call-the-cops
      (begin (set! guesses (+ guesses 1))
             "Incorrect password, please try again")))
  (define call-the-cops "911 what is your emergency?")
  (define (router password method)
    (if (not (eq? password secret-pass))
        invalid-pass
        (begin (set! guesses 0)
               (cond ((eq? method 'deposit) deposit)
                     ((eq? method 'withdraw) withdraw)
                     (else "Error: function requested is not valid")))))
    router))

(define my-account (make-account 100 'bugs))
((my-account 'bugs 'withdraw) 50)
((my-account 'dogs 'withdraw) 80)
((my-account 'dogs 'withdraw) 80)
((my-account 'dogs 'withdraw) 80)
((my-account 'dogs 'withdraw) 80)
((my-account 'dogs 'withdraw) 80)
((my-account 'dogs 'withdraw) 80)
((my-account 'dogs 'withdraw) 80)
((my-account 'dogs 'withdraw) 80)
((my-account 'bugs 'withdraw) 80)
((my-account 'dogs 'withdraw) 80)

