(define zero (lambda (f) (lambda (x) x)))

(define (inc n)
    (lambda (f) (lambda (x) (f ((n f) x))))
)

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

(define (add n m)
    (lambda (f) (lambda (x) (f ((n f) ((m f) x)))))
)
