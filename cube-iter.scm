;;; calculate cube root of x starting with 'guess'
;;; according to Newton's formula

(define (abs x) 
	(if (< x 0) (-x) x)
)

(define (cubit x)
	(* x x x)
)

(define (cube-iter guess x)
	(if (good-enough? guess x)
	    guess
	    (cube-iter (improve guess x) x)
	)
)

(define (improve guess x)
(	(/ (+(/ x (* guess guess)) (* 2 guess) ) 3) 
)

(define (good-enough? guess x)
	(< (abs(- (cubit guess) x)) 0.001)
)

;;;;; THIS IS THE ENTRY POINT FUNCTION 

(define (cbrt x)
	(cube-iter 1.0 x)
)

