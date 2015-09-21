(define (same-parity x . args)
    (define (iter res test-values)
        (if (null? test-values)
            res
            (iter (if (= (remainder x 2)
                         (remainder (car test-values) 2)
                      )
                      (append res (list (car test-values)))
                      res
                  )
                  (cdr test-values)
            )
        )
    )

    (iter (list x) args)
)
