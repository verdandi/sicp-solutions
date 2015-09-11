;вспомогательные процедуры ( поиск простых чисел с помощью теста Миллера-Рабина )

(require 'random)

(define (square x)
    (* x x)
)

(define (expmod base ex m)
    (define (test-number x)
        (define rem (remainder (square x) m))
        (if (and (and (> x 1) (< x (- m 1))) (= rem 1))
            0
            rem
        )
    )

    (cond ((= ex 0) 1)
          ((even? ex)
              (test-number (expmod base (/ ex 2) m)))
          (else
              (remainder (* base (expmod base (- ex 1) m)) m))
    )
)

(define (miller-rabin-test n times)
    (define (try-it a times)
        (cond ((= (expmod a (- n 1) n) 0) #f)
              ((= times 0) #t)
              (else (try-it (+ a 2) (- times 1)))
        )
    )

    (try-it 2 times)
)

(define (fast-prime? n times)
    (miller-rabin-test n times)
)
