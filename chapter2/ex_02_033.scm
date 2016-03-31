(load "utilities.scm")

(define (my-map proc seq)
    (accumulate (lambda (x y) (cons (proc x) y)) '() seq)
)

(define (my-append seq1 seq2)
    (accumulate cons seq2 seq1)
)

(define (my-len seq)
    (accumulate (lambda (x y) (+ y 1)) 0 seq)
)
