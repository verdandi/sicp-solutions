(define (fast-mult b n)
    (define (iter additional-mult cur-res cur-exp)
        (if (= cur-exp 1)
            (* additional-mult cur-res)
            (if (not (even? cur-exp))
                (iter (* additional-mult cur-res) cur-res (- cur-exp 1))
                (iter additional-mult (* cur-res cur-res) (/ cur-exp 2))
            )
        )
    )

    (cond ((or (= b 0) (= b 1) (= n 1)) b)
          ((= n 0) 1)
          (else (iter 1 b n))
    )
)
