(define test-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(define (square-tree1 tree)
    (cond ((null? tree) '())
          ((not (pair? tree)) (* tree tree))
          (else (cons (square-tree1 (car tree))
                      (square-tree1 (cdr tree))
                )
          )
    )
)

(define (square-tree2 tree)
    (map (lambda (subtree)
                 (if (pair? subtree)
                     (square-tree2 subtree)
                     (* subtree subtree)
                 )
         )
         tree
    )
)
