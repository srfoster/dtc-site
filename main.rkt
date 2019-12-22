#lang racket

(require web-server/servlet
         web-server/servlet-env
         web-server/formlets
	 (rename-in "./companion-site.rkt"
		    [index companion-site-index])
	 racket/runtime-path)

(require (only-in scribble/html/xml xml->string output-xml)
	 (only-in website 
		  site-dir
		  should-save-images?
		  reset-image-id!))

(define-runtime-path here ".")

;TODO: Move this to a more general place. website package?
(define (response/html html)
  (site-dir (build-path here "out"))
  (should-save-images? #f)
  (reset-image-id!)

  (response/full 
    200 #"Success"
    (current-seconds) TEXT/HTML-MIME-TYPE
    '()
    (list (string->bytes/utf-8 
	    (xml->string html)))))

(define (coding-practice r)
  (response/html (companion-site-index)))

(define (server)
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
  (require ffi/unsafe)

  (system "sudo ./stop.sh")

  ((get-ffi-obj 'daemon #f (_fun _int _int -> _int)) 0 0)
  (with-output-to-file "log"
    (server)))


