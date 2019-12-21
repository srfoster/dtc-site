#lang racket

(require web-server/servlet
         web-server/servlet-env
         web-server/formlets
	 (rename-in "./companion-site.rkt"
		    [index companion-site-index]))

(require (only-in scribble/html/xml xml->string))

;TODO: Move this to a more general place. website package?
(define (response/html html)
  (response/full 
    200 #"Success"
    (current-seconds) TEXT/HTML-MIME-TYPE
    '()
    (list (string->bytes/utf-8 (xml->string html)))))

(define (coding-practice r)
  (response/html (companion-site-index)))

(define (mailing-list-server)
  (define-values (mailing-list-dispatch mailing-list-url)
    (dispatch-rules
      [("coding" "practice") coding-practice]))

  (serve/servlet #:port 8080 
                 #:servlet-regexp #rx""
                 #:servlet-path "/"
                 #:listen-ip "0.0.0.0"
                 #:extra-files-paths (list (build-path "out"))
                 mailing-list-dispatch ))

(module+ main
  (mailing-list-server))
