(define (readstream socket-record)
	(record-ref socket-record 1))

(define (writestream socket-record)
	(record-ref socket-record 2))


