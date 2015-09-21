(define (reverse1 l)
    (define (iter rl ol) ; rl - reversed list, ol - original list
        (if (null? ol)
            rl
            (iter (cons (car ol) rl) (cdr ol))
        )
    )

    (iter '() l)
)

(define (deep-reverse l)
    (define (driter rl ol)
        (if (null? ol)
            rl
            (let ((item (car ol)))
                (driter (cons ((lambda (p)
                                    (if (pair? item)
                                        (reverse item)
                                        item
                                    )
                               ) item)
                               rl)
                        (cdr ol))
            )
        )
    )

    (driter '() l)
)
