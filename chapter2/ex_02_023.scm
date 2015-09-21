(define (for-each1 func items)
    (if (null? items)
        #t
        (let ((res (func (car items))))
            (for-each1 func (cdr items))
        )
    )
)
