(load "ex_02_007.scm")

(define (add-interval i1 i2)
    (make-interval (+ (lower-bound i1) (lower-bound i2))
                   (+ (upper-bound i1) (upper-bound i2)))
)

(define (sub-interval i1 i2)
    (make-interval (- (lower-bound i1) (lower-bound i2))
                   (- (upper-bound i1) (upper-bound i2)))
)


(define (mul-interval i1 i2)
    (let ((p1 (* (lower-bound i1) (lower-bound i2)))
          (p2 (* (lower-bound i1) (upper-bound i2)))
          (p3 (* (upper-bound i1) (lower-bound i2)))
          (p4 (* (upper-bound i1) (upper-bound i2))))
        (make-interval (min p1 p2 p3 p4)
                       (max p1 p2 p3 p4))
    )
)

(define (div-interval i1 i2)
    (mul-interval i1
        (make-interval (/ 1.0 (upper-bound i2))
                       (/ 1.0 (lower-bound i2))))
)
