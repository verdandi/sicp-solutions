;вычисление интеграла по правилу Симпсона, используя итеративную процедуру 'sum'

(load "utilities.scm")

(define (simpson-integral func a b n)
    (define h (/ (+ a b) n))

    (define (term k)
        (define y (func (+ a (* k h))))
        (cond ((= k 0) y)
              ((even? k) (* 2 y))
              (else (* 4 y))
        )
    )

    (define (next k) (+ k 1))

    (* (/ h 3) (iter-sum term 0 next n))
)
