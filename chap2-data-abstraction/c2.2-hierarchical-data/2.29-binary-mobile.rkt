; Exercise 2.29.  A binary mobile consists of two branches, a left branch and a right branch. 
; Each branch is a rod of a certain length, from which hangs either a weight or another binary mobile.
; We can represent a binary mobile using compound data by constructing it from two branches (for example, using list):

(define (make-mobile left right)
  (list left right))

; A branch is constructed from a length (which must be a number) together with a structure,
;  which may be either a number (representing a simple weight) or another mobile:

(define (make-branch length structure)
  (list length structure))

; a.  Write the corresponding selectors left-branch and right-branch, which return the branches of a mobile,
;  and branch-length and branch-structure, which return the components of a branch.

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))
; b.  Using your selectors, define a procedure total-weight that returns the total weight of a mobile.

(define (total-weight mobile)
  (if (not (pair? mobile))
        mobile
        (+ (total-weight (branch-structure (left-branch mobile)))
           (total-weight (branch-structure (right-branch mobile))))))

; c.  A mobile is said to be balanced if the torque applied by its top-left branch is equal to that applied 
; by its top-right branch (that is, if the length of the left rod multiplied by the weight hanging from that 
; rod is equal to the corresponding product for the right side) and if each of the submobiles hanging off its
;  branches is balanced. Design a predicate that tests whether a binary mobile is balanced.
(define (branch-torque branch)
  (* (branch-length branch) (total-weight (branch-structure branch)))

(define (branch-balanced? branch)
    (let (struct (branch-structure branch)))
    (if (pair? struct)
      (mobile-balanced? struct)
      #t
      ))

(define (mobile-balanced? mobile)
    (and (= (branch-torque (right-branch mobile))
            (branch-torque (left-branch mobile)))
        (branch-balanced? (right-branch mobile))
        (branch-balanced? (left-branch mobile))))
; d.  Suppose we change the representation of mobiles so that the constructors are

(define (make-mobile left right)
  (cons left right))
(define (make-branch length structure)
  (cons length structure))

; How much do you need to change your programs to convert to the new representation?
The only change that needs to be made is that right-branch and branch-structure no longer need to have 
car composed with cdr procedure. By cons-ing instead of list-ing data together the second element is not
glued into an inner list like the first element but stays within the outer list. When listed together, to
access the second element we have to remove the outer list before we can access the contents of the inner list.
:/