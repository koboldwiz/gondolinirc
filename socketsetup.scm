(load "socketutil.scm")

(define (make-socket-setup . hostandport)
	(let* ((host (if (not (null? hostandport))
			(car hostandport)
			#f))
		(port (if (>= (length hostandport) 2)
			(cadr hostandport)
			#f)))

	(define (setup-and-return-socket-record)
		(if (>= (length hostandport) 2)
			(socket-connect protocol-family/internet socket-type/stream hostandport)
		(begin
		(display "setup failed because of bad port and hostname args")
		(newline)))) 

	(define (dispatch msg)
		(cond ((eq? msg 'setup) setup-and-return-socket-record)
			(else (display "socket-setup : message not understood : ")
				(display msg)(newline))))

	dispatch))

