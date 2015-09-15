(define (make-segment start end)
    (cons start end)
)

(define (start-segment segment)
    (car segment)
)

(define (end-segment segment)
    (cdr segment)
)

(define (make-point x y)
    (cons x y)
)

(define (x-coord point)
    (car point)
)

(define (y-coord point)
    (cdr point)
)

(define (midpoint-segment segment)
    (make-point
        (/ (+ (x-coord (start-segment segment)) (x-coord (end-segment segment))) 2)
        (/ (+ (y-coord (start-segment segment)) (y-coord (end-segment segment))) 2)
    )
)

(define (print-point p)
    (display "(")
    (display (x-coord p))
    (display ",")
    (display (y-coord p))
    (display ")")
    (newline)
)
