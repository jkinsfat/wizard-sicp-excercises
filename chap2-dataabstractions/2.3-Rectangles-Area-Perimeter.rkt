;Exercise 2.3.  Implement a representation for rectangles in a plane. 
; In terms of your constructors and selectors, create procedures that compute the perimeter 
; and the area of a given rectangle. Now implement a different representation for rectangles.
; Can you design your system with suitable abstraction barriers, so that the same perimeter 
; and area procedures will work using either representation?

(define (make-point x y) 
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (make-segment pointA pointB)
  (cons pointA pointB))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (distance segment) 
  (sqrt (+ (expt (- (x-point (start-segment segment)) (x-point (end-segment segment)))
                 2)
           (expt (- (y-point (start-segment segment)) (y-point (end-segment segment)))
                 2))))

;// This was original implementation but I started having issues keeping all the c*r calls in order. 
;// Also allowed for non-rectangular points to be passed into rectangle constructor. It's time-consuming to find 4 points that
; have a rectangular relationship when the rectangle's sides are not parallel to the axes of the planes. The rectangle constructor
; should figure that out for you. 

; (define (make-rect pointA pointB pointC pointD) 
;   (cons pointA (cons pointB (cons pointC pointD))))

; (define (lower-right-corner rect)
;   )
; (define (rect-perimeter rect)
;   (+ (distance (make-segment (car rect) (cadr rect)))
;      (distance (make-segment (cadr rect) (caddr rect)))
;      (distance (make-segment (caddr rect) (cadddr rect)))
;      (distance (make-segment (cadddr rect) (car rect)))))

; (define (rect-area rect)
;   (/ (* (distance (car rect) (cadr rect))
;         (distance (cadr rect) (caddr rect)))
;      2))

; (rect-perimeter (make-rect (make-point 2 8) (make-point 6 5) (make-point 0 (- 3)) (make-point (- 4) 0)))


; What I would prefer to implement 
(define (make-rect upper-left-corner width height rotation)
