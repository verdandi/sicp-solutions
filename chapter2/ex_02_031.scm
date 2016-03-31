(load "ex_02_030.scm")

(define (tree-map func tree)
    (map (lambda (subtree)
                 (cond ((null? subtree) '())
                       ((pair? subtree) (tree-map func subtree))
                       (else (func subtree))
                 )
         )
         tree
    )
)

(define (square-tree tree)
    (tree-map (lambda (x) (* x x)) tree)
)
