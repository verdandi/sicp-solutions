(load "ex_02_010.scm")

(define (make-center-width c w)
    (make-interval (- c w) (+ c w))
)

(define (center i)
    (/ (+ (lower-bound i) (upper-bound i)) 2)
)

(define (width i)
    (/ (- (upper-bound i) (lower-bound i)) 2)
)

(define (make-center-percent c p)
    (let ((r (/ (* c p) 100)))
        (make-interval (- c r) (+ c r))
    )
)

(define (percent i)
    (let ((r (width i))
          (c (center i)))
        (* (/ r c) 100)
    )
)
