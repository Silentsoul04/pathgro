(define-module (pathgro base append-slashes)
  #:export (append-slashes unappend-slashes))

(define (append-slashes slst)
  (if (null? slst)
    '()
    (letrec ((caritem (car slst))
             (astrlen (string-length caritem))
             (lastchr (substring caritem (- astrlen 1) astrlen)))
      (if (string=? lastchr "/")
        (cons caritem (append-slashes (cdr slst)))
        (cons (string-append caritem "/") (append-slashes (cdr slst)))))))

(define (unappend-slashes slst)
  (if (null? slst)
    '()
    (letrec ((caritem (car slst))
             (astrlen (string-length caritem))
             (lastchr (substring caritem (- astrlen 1) astrlen)))
      (if (string=? lastchr "/")
        (cons (substring caritem 0 (- astrlen 1)) (unappend-slashes (cdr slst)))
        (cons caritem (unappend-slashes (cdr slst)))))))
