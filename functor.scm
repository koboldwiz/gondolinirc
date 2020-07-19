(define (make-example-functor)
	(let ()

		

		(define (dispatch msg)
		(cond ((eq? msg 'run) run)
			(else (display "make-example-functor : message not understood : ")(display msg)(newline))))
	dispatch))
