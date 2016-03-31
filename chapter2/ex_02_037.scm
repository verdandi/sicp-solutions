(load "utilities.scm")

(define mat1 (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))

(define mat2 (list (list 12 11 10 9) (list 8 7 6 5) (list 4 3 2 1)))

(define vec1 (list 2 2 2 2))

(define vec2 (list 3 3 3 3))

(define (dot-product v1 v2)
    (accumulate + 0 (map * v1 v2))
)

(define (matrix-*-vector m v)
    (map (lambda (x) (accumulate + 0 (map * v x))) m)
)

(define (transpose mat)
    (accumulate-n cons '() mat)
)

(define (matrix-*-matrix m n)
    (let ((cols (transpose n)))
        (map (lambda (m-row)
                (map (lambda (n-col)
                        (dot-product m-row n-col)
                     )
                     cols
                )
             )
             m
        )
    )
)

;better solution
(define (matrix-*-matrix m n)
    (let ((n-cols (transpose n)))
        (map (lambda (m-row) (matrix-*-vector n-cols m-row)) m)
    )
)
