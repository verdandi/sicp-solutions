; определение необходимых в упражнении процедур
(define (smallest-divisor n)
    (find-divisor n 2)
)

(define (next-number x)
    (if (= x 2)
        3
        (+ x 2)
    )
)

(define (find-divisor n test-divisor)

    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (next-number test-divisor)))
    )
)

(define (square x)
    (* x x)
)

(define (divides? a b)
    (= (remainder b a) 0)
)

(define (prime? n)
    (= n (smallest-divisor n))
)
