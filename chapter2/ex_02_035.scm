(load "utilities.scm")

;my solution
(define (count-leaves tree)
    (accumulate (lambda (x y) (+ y 1)) 0 (map (lambda (x) x) (fringe tree)))
)

;better solution
(define (count-leaves-recursive t)
    (accumulate + 0 (map (lambda (node)
                            (if (pair? node)
                                (count-leaves-recursive node)
                                1
                            )
                         )
                     t)
    )
)
