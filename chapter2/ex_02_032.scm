(define test-set (list 1 2 3))

(define (subsets set)
    (if (null? set)
        (list '())
        (let ((rest (subsets (cdr set))))
             (append rest (map (lambda (x) (cons (car set) x)) rest))
        )
    )
)
