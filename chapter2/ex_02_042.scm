(load "utilities.scm")
(require 'srfi-1)

;(define test-positions (list (cons 1 5) (cons 8 3)))

(define (queens board-size)
    (define (safe? k positions)
        (define (find-hor-pos vert-pos positions) ; It returns horisontal position of queen with vertical position vert-pos
            (if (= vert-pos (cadr (car positions)))
                (car (car positions))
                (find-hor-pos vert-pos (cdr positions))
            )
        )

        (define (check-pos hor-pos vert-pos positions)
            (cond ((null? positions) #t)
                  ((and (= hor-pos (car (car positions))) (not (= vert-pos (cadr (car positions))))) #f)
                  (else (check-pos hor-pos vert-pos (cdr positions)))
            )
        )

        (if (null? (cdr positions))
            #t
            (check-pos (find-hor-pos k positions) k positions)
        )
    )

    (define empty-board '())

    (define (adjoint-position new-row k rest-of-queens) ; It adds position of new queen in format (horisontal pos, vertical pos)
            (append rest-of-queens (list (list new-row k)))
    )

    (define (queen-cols k)
        (if (= k 0)
            (list empty-board)
            (filter
                (lambda (positions) (safe? k positions))
                (flatmap (lambda (rest-of-queens)
                            (map (lambda (new-row)
                                    (adjoint-position new-row k rest-of-queens)
                                 )
                                 (enumerate-interval 1 board-size)
                            )
                         )
                         (queen-cols (- k 1))
                )
            )
        )
    )

    (queen-cols board-size)
)
