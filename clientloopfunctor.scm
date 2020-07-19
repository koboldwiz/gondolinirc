(load "socketsetup.scm")

(load "functors.scm")

(define (make-client-functor host port functor)
	(let* ((socket-record (make-socket-setup (append (list host) (list port))))
		)
		(if (record? socket-record) ;; NOTE can crash here
			(let ((readstream (readstream socket-record))
				(writestream (writestream socket-record)))
				;; the functor needs a 'run argument method
				((functor 'run) readstream writestream)	
				(display "exiting functor client runtime...")
				(newline)
				)

			(begin (display "bad socket - undefined record")
				(newline))
			)))				

	;; NOTE empty dispatch	
