(define (finite-cont-frac get-n-proc get-d-proc k)
    (define (iter res k)
        (let ((n_cur (get-n-proc k))
              (d_cur (get-d-proc k)))

             (if (<= k 0)
                 res
                 (iter (/ n_cur (+ res d_cur)) (- k 1))
             )
         )
    )

    (iter 0 k)
)

(define (recur-finite-cont-frac get-n-proc get-d-proc k)
    (define (recur start stop)
        (if (> start stop)
            0
            (let ((n_cur (get-n-proc start))
                  (d_cur (get-d-proc start)))

                 (/ n_cur (+ d_cur (recur (+ start 1) stop)))
            )
        )
    )

    (recur 0 stop)
)
