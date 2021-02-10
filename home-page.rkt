#lang at-exp racket

(provide index)

(require website-js )

(define (index)
  (content #:head  '()
	   (list (include-js "https://code.jquery.com/jquery-3.4.1.min.js"))
	   (nav class: "navbar sticky-top navbar-expand-md navbar-dark bg-dark"
            (a href: "/"
               class: "navbar-brand"
               "Don't Teach Coding")
            (ul class: "navbar-nav ml-auto"
                (li class: "nav-item pl-4"
		    (a href: "https://www.amazon.com/gp/product/1119602629/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=1119602629&linkCode=as2&tag=th0a57-20&linkId=d9c2dbd6dd38ea111b2a59dda7f04ed2"
		       "Purchase"))  
                (li class: "nav-item pl-4"
		    (a href: "/forums"
		       "Forums"))))
	   (container class: "p-5"


	     (enclose
	       (row 
		 (col
		   (a href: "https://www.amazon.com/gp/product/1119602629/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=1119602629&linkCode=as2&tag=th0a57-20&linkId=d9c2dbd6dd38ea111b2a59dda7f04ed2" 
                      (img 
                                 width: "100%"
                                 style: (properties border: "1px solid lightgray")
                                 src: "/book-cover.png")))

		 (col
		   (div style: (properties text-align: "right")
			(p id: (ns "first-grumpy") 
			   style: (properties display: "none")
			   "Umm, wait... What?  " (b "Don't") " teach coding?")
			(p id: (ns "second-grumpy")
			   style: (properties display: "none")
			   "Who do these authors think they are?")
			(p id: (ns "third-grumpy")
			   style: (properties display: "none")
			   "Coding is " (b "very") " important!"))

		   (div id: (ns "authors-reply")
			style: (properties display: "none")
		     (hr)

		     (p "Look.  It's true: Coding is " (b "the") " critical skill of the next century.")
		     (p "And there's no doubt in anyone's mind (including ours) that it " (b "should") " be taught.")
		     (p "But there's a paradox:")
		     (p "To be the best teacher, you can't always be teaching.  Sometimes you have to stop and think.")
		     (p (i "Don't Teach Coding") " is a book with a provocative title that asks you to do one simple thing: Stop for a moment and reflect on what it means to teach coding in the upcoming century.")
		     (p "As a society, we can't afford to get this wrong.")


		     (a href: "/forums"
			"Join us on our forums!"))))

	       (script ([firstGrumpy (ns "first-grumpy")]
			[secondGrumpy (ns "second-grumpy")]
			[thirdGrumpy (ns "third-grumpy")]
			[authorsReply (ns "authors-reply")]
			[dummy 
			  @js{@(ns "doAnimation")()}])

		       (function (doAnimation)
			  @js{
                            @fadeInAfter( @firstGrumpy,  1000);
                            @fadeInAfter( @secondGrumpy, 2000);
                            @fadeInAfter( @thirdGrumpy,  3000);

                            @fadeInAfter( @authorsReply, 5000);
			  })

		       (function (fadeInAfter targetId time)
                          @js{
			   setTimeout(
				      ()=>$("#"+targetId).fadeIn("slow"),
				      time);
			  })))
	     )))




