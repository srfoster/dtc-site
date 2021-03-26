#lang racket

(provide server)

(require web-server/servlet
         web-server/servlet-env
         web-server/formlets
	 (rename-in "./companion-site.rkt"
		    [index companion-site-index])
	 (rename-in "./home-page.rkt"
		    [index home-page-index])
	 racket/runtime-path)

(require (only-in scribble/html/xml xml->string output-xml)
	 (only-in website 
		  site-dir
		  should-save-images?
		  reset-image-id!))

(define-runtime-path here ".")

(define (coding-practice r)
  (response/html (companion-site-index)))

(define (forum-redirect r)
  (redirect-to "https://www.facebook.com/groups/644439413085338/"))

(define (home-page r)
  (response/html
    (home-page-index)))

(define (docs-redirect r)
  (redirect-to "/doc/dtc/"))

(define (server)
  (define-values (mailing-list-dispatch mailing-list-url)
    (dispatch-rules
      [("") home-page]
      [("coding" "") home-page]
      [("coding") home-page]
      [("coding" "docs") docs-redirect]
      [("coding" "doc") docs-redirect]
      [("docs") docs-redirect]
      [("doc") docs-redirect]
      [("coding" "practice") coding-practice]
      [("coding" "forum") forum-redirect]
      [("coding" "forums") forum-redirect]
      [("forum") forum-redirect]
      [("forums") forum-redirect]))

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



;TODO: Move this to a more general place. website package?
;  Acutally, there's a version of this in `webapp` now ~SRF Feb 16, 2020
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
