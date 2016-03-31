(load "utilities.scm")

(define test-seq (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))

(define (accumulate-n proc init seqs)
    (if (null? (car seqs))
        '()
        (cons (accumulate proc init (map car seqs))
              (accumulate-n proc init (map cdr seqs))
        )
    )
)
