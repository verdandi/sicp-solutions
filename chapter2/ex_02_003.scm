(define (make-point x y)
    (cons x y)
)

(define (x-coord point)
    (car point)
)

(define (y-coord point)
    (cdr point)
)

;построение прямоугольника по двум точкам
(define (make-rectangle1 p1 p2)
    (cons (abs (- (x-coord p2) (x-coord p1))
          (abs (- (y-coord p1) (y-coord p2))
)

;построение прямоугольника по центру ширине и высоте
(define (make-rectangle2 center width height)
    (cons width height)
)

(define (rect-width rectangle)
    (car rectangle)
)

(define (rect-height rectangle)
    (cdr rectangle)
)

(define (perimeter rectangle)
    (let ((w (rect-width rectangle))
          (h (rect-height rectangle)))
        (+ (* w 2) (* h 2))
    )
)

(define (area rectangle)
    (let ((w (rect-width rectangle))
          (h (rect-height rectangle)))
        (* w h)
    )
)
