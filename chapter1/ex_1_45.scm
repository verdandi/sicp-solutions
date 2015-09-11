(load "utilities.scm")

(define (root2 x)
    (fixed-point (average-damp (lambda (y) (/ x y))) 1.0 0.000001)
)

(define (root3 x)
    (fixed-point (average-damp (lambda (y) (/ x (* y y)))) 1.0 0.000001)
)

(define (root4 x)
    (fixed-point ((repeat average-damp 2) (lambda (y) (/ x (* y y y)))) 1.0 0.000001)
)

(define (root5 x)
    (fixed-point ((repeat average-damp 3) (lambda (y) (/ x (* y y y y)))) 1.0 0.000001)
)

(define (root pow x)
    (fixed-point ((repeat average-damp (- pow 2)) (lambda (y) (/ x (expt y (- pow 1))))) 1.0 0.000001)
)
