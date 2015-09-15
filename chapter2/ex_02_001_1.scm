; более красивый код в функции make-rat
(define (make-rat num den)
    (let ((g ((if (< den 0) - +) (abs (gcd num den)))))
        (cons (/ num g) (/ den g))
    )
)

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
    (display (numer x))
    (display "/")
    (display (denom x))
    (newline)
)

(define (add-rat x y)
    (make-rat (+ (* (numer x) (denom y)) (* (numer y) (denom x)))
              (* (denom x) (denom y)))
)

(define (sub-rat x y)
    (make-rat (- (* (numer x) (denom y)) (* (numer y) (denom x)))
              (* (denom x) (denom y)))
)

(define (mul-rat x y)
    (make-rat (* (numer x) (numer y))
              (* (denom x) (denom y)))
)

(define (div-rat x y)
    (make-rat (* (numer x) (denom y))
              (* (denom x) (numer y)))
)
