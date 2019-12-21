#lang at-exp racket

(provide index)

;TODO: Add lang lines.
;TODO: Test code
;TODO: Add in-between matter

(require website-js (except-in 2htdp/image frame))

(define (qa n q a)
  (enclose
   (div class: "pb-4"
        (h5 (~a "Pair " n))
        (card
         (card-header
          on-click: @js{$('@(id# 'specification-content)').toggle()}
          (button-link (~a "Specification (Click to Toggle)")))
         (card-body id: @(id 'specification-content)
          (card-text q)))
        (card
          (card-header
           on-click: @js{$('@(id# 'implementation-content)').toggle()}
           (button-link "Implementation (Click to Toggle)"))
          (card-body
           id: @(id 'implementation-content)
           style: (properties display: "none")
           (card-text 
            a))))
   (script ())))

(define (code-a . content)
  (pre
   (code class: "lang-scheme"
     content)))

(define (chapter-1)
  (define (q . content)
    (list
     @p{For @tt{#lang hello/normal}, @tt{#lang hello/colors}, or @tt{#lang hello/animation}:}
     (div class: "ml-5" content)))


  (div class: "p-4"
   @p{
      Chapter 1 involves installing a programming language and meditates on the idea of printing "Hello, World".  As the following specifications reveal, the seemlingly limited languages shown in the book actually have surprisingly many secrets.    

      This allows the pairs below to use, in context, a breadth of computer science vocabulary related to arithemtic of numbers, strings, and images -- things that can be "printed" out in one of the hello world languages of Chapter 1.  You can consider this collection of pairs to be an immersion into the use of computer science language -- one in which you must (like a visitor to a foreign country) deduce and decode the meanings of things from their use in context.

      @h4{Set 0}

      @(qa 1
           @q{@tt{print} words other than "Hello, World!"}
           @code-a{(print "Something else")})

      @(qa 2
           @q{@tt{print} the result of two plus two.}
           @code-a{(print (+ 2 2))})

      @(qa 3
           @q{@tt{print} the result of five times five plus two.}
           @code-a{(print (+ 2 (* 5 5)))})

      @(qa 4
           @q{@tt{print} the result of multiplying four numbers of your choice and subtracting that from 100.}
           @code-a{(print (- 100 (* 5000 48848 2 34)))})

      @(qa 5
           @q{@tt{print} the opposite of false.}
           @code-a{(print (not #f))})

      @(qa 6
           @q{@tt{print} the opposite of true.}
           @code-a{(print (not #t))})

      @(qa 7
           @q{@tt{print} the result of calling @tt{and} on false and true.}
           @code-a{(print (and #f #t))})

      @(qa 8
           @q{@tt{print} the result of calling @tt{or} on false, false, false and true.}
           @code-a{(print (or #f #f #f #t))})

      @h4{Set 1}

      @(qa 1
           @p{You can create a green circle with radius 5 like this: @tt{(circle 5 "solid" "green")}. Try to print red circle with radius 10.}
           @code-a{(print (circle 10 "solid" "red"))})

      @(qa 2
           @p{You can create a blue triangle with side-length 5 like this: @tt{(triangle 5 "solid" "blue")}. Try to print purple square with side-length 10.}
           @code-a{(print (square 15 "solid" "purple")) })

      @(qa 3
           @p{You can create a green triangle with side-length 10 like this: @tt{(triangle 10 "solid" "blue")}. Try to print a yellow star with side-length 10.}
           @code-a{(print (star 10 "solid" "yellow")) })

      @(qa 4
           @div{
                @p{The code @tt{(star-polygon 40 7 3 "outline" "darkred")} makes this:}
                @p{@(write-img (star-polygon 40 7 3 "outline" "darkred"))}

                @p{Write code that makes this:}
                @p{@(write-img (star-polygon 20 10 3 "solid" "cornflowerblue"))}}
           @code-a{(print (star-polygon 20 10 3 "solid" "cornflowerblue"))})

      @(qa 5
           @div{
                @p{Use @tt{radial-star} to @tt{print} this:}
                @p{
                   @(write-img
                     (radial-star 8 8 64 "solid" "darkslategray"))}}
           @code-a{(print (radial-star 8 8 64 "solid" "darkslategray"))})

      @h4{Set 2}

      @(qa 1
           @p{Use @tt{regular-polygon} to @tt{print} this:
                       @(write-img (regular-polygon 21 8 "solid" "green"))}
           @code-a{(print (regular-polygon 21 8 "solid" "green"))})

      @(qa 2
           @p{Use @tt{text} to @tt{print} this:
                  @(write-img (text "Hello" 24 "olive"))}
           @code-a{(print (text "Hello" 24 "olive"))})

      @(qa 3
           @p{Add more to the message in the previous specification.  Change the color.  And add a newline character.}
           @code-a{(print (text "Hello and\nGoodbye" 24 "orange"))})

      @(qa 4
           @p{@tt{print} an outlined magenta rombus.}
           @code-a{(print (rhombus 40 45 "outline" "magenta")) })

      @(qa 5
           @p{@tt{print} a solid, yellowish green ellipse.}
           @code-a{(print (ellipse 70 20 "solid" "yellowgreen")) })

      @h4{Set 3}

      @(qa 1
           @p{Use @tt{overlay} to help @tt{print} several ellipses atop each other:
                  @div{
                       @write-img{
                                  @(overlay (ellipse 10 10 "solid" "green")
                                           (ellipse 20 20 "solid" "black")
                                           (ellipse 30 30 "solid" "green")
                                           (ellipse 40 40 "solid" "black")
                                           (ellipse 50 50 "solid" "green")
                                           (ellipse 60 60 "solid" "black"))
                                  }
                       }
                  }
           @code-a{
                (print (overlay (ellipse 10 10 "solid" "green")
                                (ellipse 20 20 "solid" "black")
                                (ellipse 30 30 "solid" "green")
                                (ellipse 40 40 "solid" "black")
                                (ellipse 50 50 "solid" "green")
                                (ellipse 60 60 "solid" "black")))
                })

      @(qa 2
           @p{
              Another way to make colors is @tt{(make-color 255 0 0 40)}.  Use that and @tt{overlay} to help you @tt{print} something like this:
              @div{
                   @(write-img
                     (overlay (ellipse 10 60 "solid" (make-color 255 0 0 40))
                             (ellipse 20 50 "solid" (make-color 255 0 0 40))
                             (ellipse 30 40 "solid" (make-color 255 0 0 40))
                             (ellipse 40 30 "solid" (make-color 255 0 0 40))
                             (ellipse 50 20 "solid" (make-color 255 0 0 40))
                             (ellipse 60 10 "solid" (make-color 255 0 0 40))))
                   }}
           @code-a{
                   (print (overlay (ellipse 10 60 "solid" (make-color 255 0 0 40))
                                   (ellipse 20 50 "solid" (make-color 255 0 0 40))
                                   (ellipse 30 40 "solid" (make-color 255 0 0 40))
                                   (ellipse 40 30 "solid" (make-color 255 0 0 40))
                                   (ellipse 50 20 "solid" (make-color 255 0 0 40))
                                   (ellipse 60 10 "solid" (make-color 255 0 0 40))))
                   })


      @(qa 3
           @p{Change the above program to use @tt{above} instead of @tt{overlay} and @tt{print}:
                     @(div
                       (write-img
                        (above (ellipse 10 60 "solid" (make-color 255 0 0 40))
                               (ellipse 20 50 "solid" (make-color 255 0 0 40))
                               (ellipse 30 40 "solid" (make-color 255 0 0 40))
                               (ellipse 40 30 "solid" (make-color 255 0 0 40))
                               (ellipse 50 20 "solid" (make-color 255 0 0 40))
                               (ellipse 60 10 "solid" (make-color 255 0 0 40)))))}
           @code-a{
                (print (above (ellipse 10 60 "solid" (make-color 255 0 0 40))
                              (ellipse 20 50 "solid" (make-color 255 0 0 40))
                              (ellipse 30 40 "solid" (make-color 255 0 0 40))
                              (ellipse 40 30 "solid" (make-color 255 0 0 40))
                              (ellipse 50 20 "solid" (make-color 255 0 0 40))
                              (ellipse 60 10 "solid" (make-color 255 0 0 40)))) 
                })

      @(qa 4
           @p{Instead of @tt{ellipse}, try @tt{rectangle} in one of the last two specifications.}
           @code-a{
                (print (overlay (rectangle 10 60 "solid" (make-color 0 255 0 40))
                                (rectangle 20 50 "solid" (make-color 0 255 0 40))
                                (rectangle 30 40 "solid" (make-color 0 255 0 40))
                                (rectangle 40 30 "solid" (make-color 0 255 0 40))
                                (rectangle 50 20 "solid" (make-color 0 255 0 40))
                                (rectangle 60 10 "solid" (make-color 0 255 0 40)))) 
                })

      
      @h4{Set 4}

      @(qa 1
           @p{@tt{print} a red snowman.}
           @code-a{
                (print (above (circle 20 "solid" "red") 
                              (circle 40 "solid" "red")
                              (circle 60 "solid" "red")))
                })

      @(qa 2
           @p{@tt{print} the colors of the rainbow as small squares @tt{beside} each other.}
           @code-a{
                (print (beside (square 40 "solid" "red") 
                               (square 40 "solid" "orange")
                               (square 40 "solid" "yellow")
                               (square 40 "solid" "green")
                               (square 40 "solid" "blue")
                               (square 40 "solid" "purple")))
                })




      @(qa 3
           @p{@tt{print} a red snowman standing on top of the colors of the rainbow.}
           @code-a{
                (print (above
                        (above (circle 20 "solid" "red") 
                               (circle 40 "solid" "red")
                               (circle 60 "solid" "red"))  
                        (beside (square 40 "solid" "red") 
                                (square 40 "solid" "orange")
                                (square 40 "solid" "yellow")
                                (square 40 "solid" "green")
                                (square 40 "solid" "blue")
                                (square 40 "solid" "purple"))))})

      @(qa 4
           @p{Take the last implementation and rotate it by 45 degrees.}
           @code-a{
                (print (rotate 45
                               (above
                                (above (circle 20 "solid" "red") 
                                       (circle 40 "solid" "red")
                                       (circle 60 "solid" "red"))  
                                (beside (square 40 "solid" "red") 
                                        (square 40 "solid" "orange")
                                        (square 40 "solid" "yellow")
                                        (square 40 "solid" "green")
                                        (square 40 "solid" "blue")
                                        (square 40 "solid" "purple")))))})

      @(qa 5
           @p{Take the last implementation and shrink it down to half the size.}
           @code-a{
                (print (scale 1/2
                              (rotate 45
                                      (above
                                       (above (circle 20 "solid" "red") 
                                              (circle 40 "solid" "red")
                                              (circle 60 "solid" "red"))  
                                       (beside (square 40 "solid" "red") 
                                               (square 40 "solid" "orange")
                                               (square 40 "solid" "yellow")
                                               (square 40 "solid" "green")
                                               (square 40 "solid" "blue")
                                               (square 40 "solid" "purple"))))))
                })

      }))

(define (chapter-2)
  (div class: "p-4"
   @p{
      Chapter 2 introduces the concept of abstraction and relates it fundamentally to the idea of Story -- an abstraction of any sequence of ideas.  The pairs below continue the meditation: What is the breadth of things that, fundamentally, can be expressed as sequences of ideas.

      In coding, sequences are often called "lists".  One of the most historically significant programming languages of our time is the Lisp language -- an intellectual tradition that began in the 1950s and has been growing and evolving steadily since, influencing the design of all other programming languages. 

      The Lisp language's fundamental premise is that all codeable things can be written and thought of as sequences of things -- which may themeselves contain sequences of other things.  The pairs below uses both the arrow syntax introduced in the book, and the isomorphic Lisp syntax, with parentheses.  The reader is encouraged to see both as semantically equivalent yet syntactically different ways of meditating on the same idea space.
    
      @h4{Set 0}

      @(qa 1
           @p{Create a Story image that describes your life.  Put at least 3 major life Moments.}
           @code-a{born-houston-1987 -> moved-san-antonio-2006 -> moved-san-diego-2010})

      @(qa 2
           @p{Create a Story image that describes what you might have for dinner over the period of a week (7 Moments).}
           @code-a{tacos -> spaghetti -> pizza -> burgers -> sushi -> leftover-sushi -> icecream})

      @(qa 3
           @p{Create a Story image that describes what things you do to get ready in the morning (start with get-up, end with leave-house)}
           @code-a{get-up -> brush-teeth -> take-shower -> make-coffee -> get-breakfast -> leave-house})

      @(qa 4
           @p{Create a Story image that describes how people in your family greet each other after a year apart.}
           @code-a{shake-hands -> hug -> mention-weather -> "How have you been?" -> catch-up-over-last-year})

      @(qa 5
           @p{Create a Story image that describes what goes through your mind in the moments after someone cuts you off in traffic}
           @code-a{fear -> anger -> hate -> forgiveness})

      @h4{Set 1}

      @(qa 1
           @p{Write a Story in which @tt{meta-cat} turns green and growns.}
           @code-a{meta-cat -> greenify -> grow })

      @(qa 2
           @p{Try using @tt{blueify} and @tt{redify} on @tt{meme-teacher}.  Also double the size.}
           @code-a{meme-teacher -> blueify -> redify -> grow })

      @(qa 3
           @p{Write a story in which @tt{meme-teacher} grows three times and shrinks twice.  Test if the order of those operations matters.}
           @code-a{meme-teacher -> grow -> shrink -> grow -> grow -> shrink})

      @(qa 4
           @p{Turn @tt{dijkstra} upside down.}
           @code-a{dijkstra -> rotate -> rotate -> rotate -> rotate})

      @(qa 5
           @p{How many times can you grow a @tt{meta-cat} before it crashes your computer?}
           @code-a{meta-cat -> grow -> grow -> grow -> grow -> grow -> grow -> grow})


      @h4{Set 2}

      @(qa 1
           @p{Use @tt{website/bootstrap} to extend @tt{dtc/story+cats} so that you can launch a website with a few words of text.}
           @code-a{
                #lang dtc/story+/cats
                (require website/bootstrap)
                (preview-page "This is a website")})

      @(qa 2
           @p{Write a website with a header tag and a paragraph tag.}
           @code-a{
                #lang dtc/story+/cats
                (require website/bootstrap)
                (preview-page
                 (h1 "This is a website")
                 (p "And here is a paragraph"))})

      @(qa 3
           @p{Write a website with a header tag, paragraph tag, and an image of a red circle.}
           @code-a{
                (require website/bootstrap)
                (preview-page 
                 (h1 "This is a website")
                 (p "And here is a paragraph")
                 (write-img
                  (circle 40 "solid" "red")))
                })

      @(qa 4
           @p{Use @tt{meta-engine} to code an animation in which a green star spins.}
           @code-a{
                (require meta-engine)
                (play!
                 (game
                  (entity
                   (position (posn 200 200))
                   (rotation 0 (^ add1))
                   (sprite 
                    (register-sprite (star 40 "solid" "green"))))))
                })

      @(qa 4
           @p{Make an animation in which a picture of a cat and a picture of a computer scientist both spin.}
           @code-a{
                (require meta-engine)
                (play!
                 (game
                  (entity
                   (position (posn 200 200))
                   (rotation 0 (^ add1))
                   (sprite 
                    (register-sprite 
                     (beside (meta-cat)
                             (dijkstra)))))))})

      @(qa 5
           @p{Make a 3d environment using @tt{3d-exploration}'s preset volcano world.}
           @code-a{
                (require 3d-exploration)

                (exploration-scene
                 #:environment (basic-environment #:preset 'volcano))
                })

      @h4{Set 3}

      @(qa 1
           @p{Make a 3d environment with a particle effect.  Make the particles look like Edsger Dijkstra.}
           @code-a{
                (require 3d-exploration)
                
                (define (my-environment)
                  (basic-environment
                   #:preset 'forest
                   #:horizon-color 'dark-blue
                   #:sky-color 'black
                   #:fog 0.5))
                
                (define (my-particles)
                  (basic-particles
                   #:preset 'dust
                   #:image (dijkstra)
                   #:count 2000))
                
                (exploration-scene
                 #:environment (my-environment)
                 #:sky-objects (list (my-particles)))
                })


      @(qa 2
           @p{Make a survival game in which one of the foods you collect looks like Edsger Dijkstra}
           @code-a{
                (define (my-food)
                  (basic-food
                   #:sprite (dijkstra)
                   #:name "Apples"
                   #:amount-in-world 15
                   #:heals-by 5))
                
                (define (special-food)
                  (basic-food
                   #:sprite cherry-sprite
                   #:name "Cherry"
                   #:amount-in-world 1
                   #:heals-by 50
                   #:respawn? #f))
                
                (survival-game
                 #:food-list (list (my-food)
                                   (special-food)))
                })

      @(qa 3
           @p{Make a survival game in which you collect three foods that look like differently colored Edsger Dijkstras.}
           @code-a{
                (define (basic-cherry)
                  (basic-food
                   #:sprite (dijkstra redify)
                   #:name "Cherries"
                   #:amount-in-world 15))
                
                (define (basic-smores)
                  (basic-food
                   #:sprite (dijkstra yellowify)
                   #:name "Smores"
                   #:heals-by -10))
                
                (define (special-carrot)
                  (basic-food
                   #:sprite (dijkstra orangify)
                   #:name "Carrots"
                   #:tile 4
                   #:amount-in-world 1
                   #:heals-by 50
                   #:respawn? #f))
                
                (survival-game
                 #:food-list (list
                              (basic-cherry)
                              (basic-smores)
                              (special-carrot)))})


      @(qa 4
           @p{Make a website that displays an image of a pyramid of Edsger Dijkstras.}
           @code-a{
                (require website/bootstrap)
                (preview-page 
                 (h1 "This is a website")
                 (p "And this is a tower of Dijkstras")
                 (write-img
                  (above 
                   (dijkstra grow)
                   (dijkstra grow grow)
                   (dijkstra grow grow grow))))})

      @(qa 5
           @p{Make a website with a button that, when clicked, shows a pyramid of Edsger Dijkstras.}
           @code-a{
                (require website/bootstrap)
                (preview-page 
                 (h1 "This is a website")
                 (button-primary on-click: "$('dijkstras').show()" 
                                 "Click me")
                 (div id: "dijkstras" class: "hide"
                      (write-img
                       (above 
                        (dijkstra grow)
                        (dijkstra grow grow)
                        (dijkstra grow grow grow)))))
                })

      @h4{Set 4}


      @(qa 1
           @p{Make a 3D environment with a particle effect in which each particle looks like a pyramid of Edsger Dijkstras.}
           @code-a{
                (require 3d-exploration)
                
                (define (my-environment)
                  (basic-environment
                   #:preset 'forest
                   #:horizon-color 'dark-blue
                   #:sky-color 'black
                   #:fog 0.5))
                
                (define (my-particles)
                  (basic-particles
                   #:preset 'dust
                   #:image 
                   (above 
                    (dijkstra grow)
                    (dijkstra grow grow)
                    (dijkstra grow grow grow))
                   #:count 2000))
                
                (exploration-scene
                 #:environment (my-environment)
                 #:sky-objects (list (my-particles)))})

      @(qa 2
           @p{Make a website with a button that, when clicked, shows three differently colored pyramids of Edsger Dijkstra beside each other.}
           @code-a{
                (require website/bootstrap)
                (preview-page 
                 (h1 "This is a website")
                 (button-primary on-click: "$('dijkstras').show()" 
                                 "Click me")
                 (div id: "dijkstras" class: "hide"
                      (write-img
                       (beside
                        (above 
                         (dijkstra redify grow)
                         (dijkstra redify grow grow)
                         (dijkstra redify grow grow grow))
                        (above 
                         (dijkstra greenify grow)
                         (dijkstra greenify grow grow)
                         (dijkstra greenify grow grow grow))
                        (above 
                         (dijkstra blueify grow)
                         (dijkstra blueify grow grow)
                         (dijkstra blueify grow grow grow))))))
                })
      } ))

(define (chapter-3)
  (div class: "p-4"
   @p{
      The theme of Chapter 3 is nesting and frameing.  The pairs below are designed to show the breadth of things that can be expressed once you allow the dimension of depth to your code -- sequences of ideas, any of which can itself be a sequence of ideas; Stories whose Moments can be Stories. 

      @p{Unlike the random assortment of demos in the last chapter.  This chapter's specification/implementation pairs will focus on the production of websites.  We'll use the best tools we have in this chapter -- but it won't be until the final chapter that we can make the code especially clear and flexible.}

      @p{We'll make a website devoted to the chess games of the 19th century: Between Napoleon and the Mechanical Turk.  You can feel free to use different images and make a website about whatever you want.  That creative act will teach you unimaginably more than simply following along with the Implementations below, as written.}


   @h4{Set 1}

   @(qa 1
        @p{Make an underconstruction page that displays a move from the Napoleon/Turk game.}
        @code-a{
             #lang dtc/frames/animations

             (require website/bootstrap)

             (preview-page
              (h1 "Page under construction")
              (write-img
               (napoleon/turk 3)))
             })


   @(qa 2
        @p{Put the content into a container, so that the margins look better.}
        @code-a{
             #lang dtc/frames/animations

             (require website/bootstrap)

             (preview-page
              (container
               (h1 "Page under construction")
               (write-img
                (napoleon/turk 3)))))
        })

  @(qa 3
       @p{Wrap the Napoleon/Turk image in a bootstrap card with a header that says which move is being displayed.}
       @code-a{
            #lang dtc/frames/animations

            (require website/bootstrap)

            (preview-page
             (container
              (h1 "Page under construction")
              (card
               (card-header "Move Three...")
               (write-img
                (napoleon/turk 3)))))
            })

  @(qa 4
       @p{Add a few more moves. (Don't add all of them, though.  In chapter 4 we'll have linguistic tools to automate that process.  So if you add every move now, you'll be wasting your time.)}
       @code-a{
            #lang dtc/frames/animations

            (require website/bootstrap)

            (preview-page
             (container
              (card-deck
               (card
                (card-header "Move Two...")
                (write-img
                 (napoleon/turk 2)))
               (card
                (card-header "Move Three...")
                (write-img
                 (napoleon/turk 3)))
               (card
                (card-header "Move Four...")
                (write-img
                 (napoleon/turk 4))))))
            })

  @(qa 5
       @p{Instead of bootstrap cards, let's try a carousel.  Make a carousel that can cycle between multiple moves in the game.}
       @code-a{
            (preview-page
             (carousel class: "slide"
                       (carousel-inner
                        (carousel-item class: "active"
                                       (write-img class: "d-block w-100" (napoleon/turk 2)))
                        (carousel-item class: "active"
                                       (write-img class: "d-block w-100" (napoleon/turk 3)))
                        (carousel-item class: "active"
                                       (write-img class: "d-block w-100" (napoleon/turk 4))))))
            })

  @h4{Set 2}

  @(qa 1
       @p{}
       @code-a{
            (preview-page
             (jumbotron 
              (h1 class: "display-4"
                  "The match of the 19th century")
              (p "Napoleon versus the Turk"))

             (carousel class: "slide"
                       (carousel-inner
                        (carousel-item class: "active"
                                       (write-img class: "d-block w-100" (napoleon/turk 2)))
                        (carousel-item class: "active"
                                       (write-img class: "d-block w-100" (napoleon/turk 3)))
                        (carousel-item class: "active"
                                       (write-img class: "d-block w-100" (napoleon/turk 4))))))
            })

  @(qa 2
       @p{}
       @code-a{
            (preview-page
             (jumbotron style: (properties 
                                background-size: "cover"
                                background-image: "https://upload.wikimedia.org/wikipedia/commons/2/27/Kempelen_chess1.jpg")
                        (h1 class: "display-4"
                            "The match of the 19th century")
                        (p "Napoleon versus the Turk"))

             (p "Image above (by English Wikipedia user Caraf) is of a reconstruction of the machine that bested Napoleon Boneparte.")


             (carousel class: "slide"
                       (carousel-inner
                        (carousel-item class: "active"
                                       (write-img class: "d-block w-100" (napoleon/turk 2)))
                        (carousel-item class: "active"
                                       (write-img class: "d-block w-100" (napoleon/turk 3)))
                        (carousel-item class: "active"
                                       (write-img class: "d-block w-100" (napoleon/turk 4))))))
            })

  @(qa 3
       @p{Add a jumbotron at the top to clarify the page's intent.}
       @code-a{
            (preview-page
             (jumbotron style: (properties 
                                background-size: "cover"
                                background-image: "https://upload.wikimedia.org/wikipedia/commons/2/27/Kempelen_chess1.jpg")
                        (h1 class: "display-4"
                            "The match of the 19th century")
                        (p "Napoleon versus the Turk"))

             (p "Image above (by English Wikipedia user Caraf) is of a reconstruction of the machine that bested Napoleon Boneparte.")


             (carousel class: "slide"
                       (carousel-inner
                        (carousel-item class: "active"
                                       (write-img class: "d-block w-100" (napoleon/turk 2)))
                        (carousel-item class: "active"
                                       (write-img class: "d-block w-100" (napoleon/turk 3)))
                        (carousel-item class: "active"
                                       (write-img class: "d-block w-100" (napoleon/turk 4)))))

             (h2 "Here's how the game went...")

             (card-deck
              (card
               (card-header "Move Two...")
               (write-img
                (napoleon/turk 2)))
              (card
               (card-header "Move Three...")
               (write-img
                (napoleon/turk 3)))
              (card
               (card-header "Move Four...")
               (write-img
                (napoleon/turk 4)))))
            })


  @(qa 4
       @p{After the carousel, add the cards back (from an earlier implementation) -- so the page will have a jumbotron, a carousel, and cards.}
       @code-a{

            (preview-page
             (jumbotron style: (properties 
                                background-size: "cover"
                                background-image: "https://upload.wikimedia.org/wikipedia/commons/2/27/Kempelen_chess1.jpg")
                        (h1 class: "display-4"
                            "The match of the 19th century")
                        (p "Napoleon versus the Turk"))

             (p "Image above (by English Wikipedia user Caraf) is of a reconstruction of the machine that bested Napoleon Boneparte.")


             (carousel class: "slide"
                       (carousel-inner
                        (carousel-item class: "active"
                                       (write-img class: "d-block w-100" (napoleon/turk 2)))
                        (carousel-item class: "active"
                                       (write-img class: "d-block w-100" (napoleon/turk 3)))
                        (carousel-item class: "active"
                                       (write-img class: "d-block w-100" (napoleon/turk 4)))))

             (h2 "Here's how the game went...")

             (card-deck
              (card
               (card-header "Move Two...")
               (write-img
                (napoleon/turk 2)))
              (card
               (card-header "Move Three...")
               (write-img
                (napoleon/turk 3)))
              (card
               (card-header "Move Four...")
               (write-img
                (napoleon/turk 4))))

            })


  @h4{Set 3}
  
  @(qa 1
       @p{At the bottom of the page add another jumbotron, this one with an embedded video from Youtube that explains the historic game.
             You can cut-and-paste Youtube's embed code into @tt{html/inline} for now.  We can clean it up later.}
       @code-a{

            (preview-page
             (jumbotron style: (properties 
                                background-size: "cover"
                                background-image: "https://upload.wikimedia.org/wikipedia/commons/2/27/Kempelen_chess1.jpg")
                        (h1 class: "display-4"
                            "The match of the 19th century")
                        (p "Napoleon versus the Turk"))

             (p "Image above (by English Wikipedia user Caraf) is of a reconstruction of the machine that bested Napoleon Boneparte.")


             (carousel class: "slide"
                       (carousel-inner
                        (carousel-item class: "active"
                                       (write-img class: "d-block w-100" (napoleon/turk 2)))
                        (carousel-item class: "active"
                                       (write-img class: "d-block w-100" (napoleon/turk 3)))
                        (carousel-item class: "active"
                                       (write-img class: "d-block w-100" (napoleon/turk 4)))))

             (h2 "Here's how the game went...")

             (card-deck
              (card
               (card-header "Move Two...")
               (write-img
                (napoleon/turk 2)))
              (card
               (card-header "Move Three...")
               (write-img
                (napoleon/turk 3)))
              (card
               (card-header "Move Four...")
               (write-img
                (napoleon/turk 4))))


             (jumbotron
              @"@"html/inline{
                              <iframe width="560" height="315" src="https://www.youtube.com/embed/lRpPz19trRw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                              }))
            })


  
  @(qa 2
       @p{Convert the HTML syntax to Lisp syntax that does the same thing.}
       @code-a{
            (preview-page
             (jumbotron style: (properties 
                                background-size: "cover"
                                background-image: "https://upload.wikimedia.org/wikipedia/commons/2/27/Kempelen_chess1.jpg")
                        (h1 class: "display-4"
                            "The match of the 19th century")
                        (p "Napoleon versus the Turk"))

             (p "Image above (by English Wikipedia user Caraf) is of a reconstruction of the machine that bested Napoleon Boneparte.")


             (carousel class: "slide"
                       (carousel-inner
                        (carousel-item class: "active"
                                       (write-img class: "d-block w-100" (napoleon/turk 2)))
                        (carousel-item class: "active"
                                       (write-img class: "d-block w-100" (napoleon/turk 3)))
                        (carousel-item class: "active"
                                       (write-img class: "d-block w-100" (napoleon/turk 4)))))

             (h2 "Here's how the game went...")

             (card-deck
              (card
               (card-header "Move Two...")
               (write-img
                (napoleon/turk 2)))
              (card
               (card-header "Move Three...")
               (write-img
                (napoleon/turk 3)))
              (card
               (card-header "Move Four...")
               (write-img
                (napoleon/turk 4))))

             (jumbotron
              (h1 class: "display-4" "Everyone is talking about it")
              (p "YouTube won't shut up!")
              (iframe 
               width: 560 
               height: 315 
               src: "https://www.youtube.com/embed/lRpPz19trRw"
               frameborder: 0
               allow: "accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
               allowfullscreen: #t)))

            })

  @(qa 2
       @p{Start a new website.  Put pictures of several teachers you respect, followed by a picture of yourself.}
       @code-a{
            (preview-page
             (write-img (dijkstra))
             (write-img (habermann))
             (write-img (notkin))
             (write-img (griswold))
            })

  @(qa 3
       @p{Add a jumbotron to clarify that the intent of the page is to show gratitude for your teachers.}
       @code-a{
            (preview-page
             (jumbotron style: (properties 
                                background-size: "cover"
                                background-image: "https://upload.wikimedia.org/wikipedia/commons/2/27/Kempelen_chess1.jpg")
                        (h1 class: "display-4"
                            "My Teachers Are Cooler Than Me")
                        (p "This is for them"))

             (card
              (write-img (dijkstra)))

             (card
              (write-img (habermann)))
             
             (card
              (write-img (notkin)))

             (card
              (write-img (griswold))))
            })

  @(qa 4
       @p{Wrap each picture in a card with a header that identifies who that person is.}
       @code-a{
            (preview-page
             (jumbotron style: (properties 
                                background-size: "cover"
                                background-image: "https://upload.wikimedia.org/wikipedia/commons/2/27/Kempelen_chess1.jpg")
                        (h1 class: "display-4"
                            "My Teachers Are Cooler Than Me")
                        (p "This is for them"))

             (card
              (card-header "Dijkstra")
              (write-img (dijkstra)))

             (card
              (card-header "Habermann")
              (card-text (write-img (habermann))))
             
             (card
              (card-header "Notkin")
              (card-text (write-img (notkin))))

             (card
              (card-header "Griswold")
              (card-text (write-img (griswold)))))
            }
       )

  @h4{Set 4}

  @(qa 1
       @p{Make each card image be the header image for that card.}
       @code-a{
            (preview-page
             (jumbotron style: (properties 
                                background-size: "cover"
                                background-image: "https://upload.wikimedia.org/wikipedia/commons/2/27/Kempelen_chess1.jpg")
                        (h1 class: "display-4"
                            "My Teachers Are Cooler Than Me")
                        (p "This is for them"))

             (card
              (write-img class: "card-img-top" (dijkstra))
              (card-body 
               (card-title "Dijkstra")))

             (card
              (write-img class: "card-img-top" (dijkstra))
              (card-body
               (card-title "Habermann")))

             (card
              (write-img class: "card-img-top" (dijkstra))
              (card-body
               (card-title "Notkin")))

             (card
              (write-img class: "card-img-top" (dijkstra))
              (card-body
               (card-title "Griswold"))))
            })

  @(qa 2
       @p{Add a button to each card with the text "Learn More".}
       @code-a{
            (preview-page
             (jumbotron style: (properties 
                                background-size: "cover"
                                background-image: "https://upload.wikimedia.org/wikipedia/commons/2/27/Kempelen_chess1.jpg")
                        (h1 class: "display-4"
                            "My Teachers Are Cooler Than Me")
                        (p "This is for them"))

             (card
              (write-img class: "card-img-top" (dijkstra))
              (card-body 
               (card-title "Dijkstra")
               (button-primary "Learn More")))

             (card
              (write-img class: "card-img-top" (dijkstra))
              (card-body
               (card-title "Habermann")
               (button-primary "Learn More")))

             (card
              (write-img class: "card-img-top" (dijkstra))
              (card-body
               (card-title "Notkin")
               (button-primary "Learn More")))

             (card
              (write-img class: "card-img-top" (dijkstra))
              (card-body
               (card-title "Griswold")
               (button-primary "Learn More"))))
            })

  @(qa 3
       @p{Make one of the buttons trigger the popup of a modal window with more information about the person shown in that card.}
       @code-a{
            (preview-page
             (jumbotron style: (properties 
                                background-size: "cover"
                                background-image: "https://upload.wikimedia.org/wikipedia/commons/2/27/Kempelen_chess1.jpg")
                        (h1 class: "display-4"
                            "My Teachers Are Cooler Than Me")
                        (p "This is for them"))

             (card
              (write-img class: "card-img-top" (dijkstra))
              (card-body 
               (card-title "Dijkstra")
               (button-primary data-toggle: "modal" data-target: "#dijkstra-info"
                               "Learn More")
               (modal id: "dijkstra-modal"
                      (p "According to Wikipedia:") 
                      (p "Edsger Dijkstra was a Dutch systems scientist, programmer, software engineer, science essayist,[8] and pioneer in computing science.["))))

             (card
              (write-img class: "card-img-top" (dijkstra))
              (card-body
               (card-title "Habermann")
               (button-primary "Learn More")))

             (card
              (write-img class: "card-img-top" (dijkstra))
              (card-body
               (card-title "Notkin")
               (button-primary "Learn More")))

             (card
              (write-img class: "card-img-top" (dijkstra))
              (card-body
               (card-title "Griswold")
               (button-primary "Learn More"))))
            })


  @(qa 4
       @p{Enhance the modal's layout by wrapping the content in @tt{modal-content} and @tt{modal-dialog}.}
       @code-a{
            (preview-page
             (jumbotron style: (properties 
                                background-size: "cover"
                                background-image: "https://upload.wikimedia.org/wikipedia/commons/2/27/Kempelen_chess1.jpg")
                        (h1 class: "display-4"
                            "My Teachers Are Cooler Than Me")
                        (p "This is for them"))

             (card
              (write-img class: "card-img-top" (dijkstra))
              (card-body 
               (card-title "Dijkstra")
               (button-primary data-toggle: "modal" data-target: "#dijkstra-info"
                               "Learn More")
               (modal id: "dijkstra-modal"
                      (modal-dialog
                       (modal-content
                        (p "According to Wikipedia:") 
                        (p "Edsger Dijkstra was a Dutch systems scientist, programmer, software engineer, science essayist,[8] and pioneer in computing science.["))))))

             (card
              (write-img class: "card-img-top" (dijkstra))
              (card-body
               (card-title "Habermann")
               (button-primary "Learn More")))

             (card
              (write-img class: "card-img-top" (dijkstra))
              (card-body
               (card-title "Notkin")
               (button-primary "Learn More")))

             (card
              (write-img class: "card-img-top" (dijkstra))
              (card-body
               (card-title "Griswold")
               (button-primary "Learn More"))))
            })

  @(qa 5
       @p{Add a footer to the modal with a button that dismisses the modal.}
       @code-a{
            (preview-page
             (jumbotron style: (properties 
                                background-size: "cover"
                                background-image: "https://upload.wikimedia.org/wikipedia/commons/2/27/Kempelen_chess1.jpg")
                        (h1 class: "display-4"
                            "My Teachers Are Cooler Than Me")
                        (p "This is for them"))

             (card
              (write-img class: "card-img-top" (dijkstra))
              (card-body 
               (card-title "Dijkstra")
               (button-primary data-toggle: "modal" data-target: "#dijkstra-info"
                               "Learn More")
               (modal id: "dijkstra-modal"
                      (modal-dialog
                       (modal-content
                        (p "According to Wikipedia:") 
                        (p "Edsger Dijkstra was a Dutch systems scientist, programmer, software engineer, science essayist,[8] and pioneer in computing science.["))
                       (modal-footer
                        (button-secondary data-dismiss: "modal"))))))

             (card
              (write-img class: "card-img-top" (dijkstra))
              (card-body
               (card-title "Habermann")
               (button-primary "Learn More")))

             (card
              (write-img class: "card-img-top" (dijkstra))
              (card-body
               (card-title "Notkin")
               (button-primary "Learn More")))

             (card
              (write-img class: "card-img-top" (dijkstra))
              (card-body
               (card-title "Griswold")
               (button-primary "Learn More"))))
            })

  @p{Optionally, if you wish, you can add modal popups to the rest of the cards.}

  }))

(define (chapter-4)
  (div class: "p-4"

   @p{
      Chapter 4 concludes the book by adding definitions, the power of naming things.  The keystone concept ushers in three cruicial cognitive tools:
      
      @ul{
        @li{The deep nesting structures introduced in Chatper 3 can now be flattened out, reducing cognitive load.}
        @li{We can now leverage a fundamental human ability -- that of naming things, which is fundamentally equivalent to our ability to construct new language.  We now have the ability to construct new programming languages in in mutually beneficial ways while we construct new natural language.}
	@li{Via recursion, Turing-Completeness is acheived. Less abstractly: We can now write programs that loop forever, or ones that loop as long as necessary to complete some task.}
	}

      The pairs below are meant to be considered in light of the Chapter 3's pairs.  Together, they demonstrate the use of two different coding styles to achieve the same task.  We hope readers, after wrestling with the texts long enough to understand the code written in both styles, will think critically about the advantages and disadvantages of each.

      @h4{Set 1}

      @p{In this set, we will begin by refactoring the code from Chapter 3 -- using definitions.  We'll do so one step at a time -- each implementation will change how the @i{code} looks, tightening it and clarifying it, without ever changing the way the website looks.  The ability to refactor code is one worth practicing from the beginning of your coding journey.  It helps you gain fluency in the multitude of ways that coders can express the same ideas.  There's never "One Right Way" to implement something.}


      @(qa 1
           @p{Refactor the jumbotron from the final chess website in Chapter 3 (see above) into a definition with the name @tt{main-jumbotron}}
           @code-a{
                (define (main-jumbotron)
                  (jumbotron style: (properties 
                                     background-size: "cover"
                                     background-image: "https://upload.wikimedia.org/wikipedia/commons/2/27/Kempelen_chess1.jpg")
                             (h1 class: "display-4"
                                 "The match of the 19th century")
                             (p "Napoleon versus the Turk")))

                (preview-page
                 (main-jumbotron) ;The jumbotron code used to be here.  Now there's just a single line...

                 (p "Image above (by English Wikipedia user Caraf) is of a reconstruction of the machine that bested Napoleon Boneparte.")


                 (carousel class: "slide"
                           (carousel-inner
                            (carousel-item class: "active"
                                           (write-img class: "d-block w-100" (napoleon/turk 2)))
                            (carousel-item class: "active"
                                           (write-img class: "d-block w-100" (napoleon/turk 3)))
                            (carousel-item class: "active"
                                           (write-img class: "d-block w-100" (napoleon/turk 4)))))

                 (h2 "Here's how the game went...")

                 (card-deck
                  (card
                   (card-header "Move Two...")
                   (write-img
                    (napoleon/turk 2)))
                  (card
                   (card-header "Move Three...")
                   (write-img
                    (napoleon/turk 3)))
                  (card
                   (card-header "Move Four...")
                   (write-img
                    (napoleon/turk 4))))

                 (jumbotron
                  (h1 class: "display-4" "Everyone is talking about it")
                  (p "YouTube won't shut up!")
                  (iframe 
                   width: 560 
                   height: 315 
                   src: "https://www.youtube.com/embed/lRpPz19trRw"
                   frameborder: 0
                   allow: "accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                   allowfullscreen: #t)))
                })

      @(qa 2
           @p{Refactor the move carousel into its own definition called @tt{move-carousel}.}
           @code-a{
                (define (main-jumbotron)
                  (list
                   (jumbotron style: (properties 
                                      background-size: "cover"
                                      background-image: "https://upload.wikimedia.org/wikipedia/commons/2/27/Kempelen_chess1.jpg")
                              (h1 class: "display-4"
                                  "The match of the 19th century")
                              (p "Napoleon versus the Turk"))

                   (p "Image above (by English Wikipedia user Caraf) is of a reconstruction of the machine that bested Napoleon Boneparte.")))


                (define (move-carousel)
                  (carousel class: "slide"
                            (carousel-inner
                             (carousel-item class: "active"
                                            (write-img class: "d-block w-100" (napoleon/turk 2)))
                             (carousel-item class: "active"
                                            (write-img class: "d-block w-100" (napoleon/turk 3)))
                             (carousel-item class: "active"
                                            (write-img class: "d-block w-100" (napoleon/turk 4))))))

                (preview-page
                 (main-jumbotron)
                 (move-carousel)

                 (h2 "Here's how the game went...")

                 (card-deck
                  (card
                   (card-header "Move Two...")
                   (write-img
                    (napoleon/turk 2)))
                  (card
                   (card-header "Move Three...")
                   (write-img
                    (napoleon/turk 3)))
                  (card
                   (card-header "Move Four...")
                   (write-img
                    (napoleon/turk 4))))

                 (jumbotron
                  (h1 class: "display-4" "Everyone is talking about it")
                  (p "YouTube won't shut up!")
                  (iframe 
                   width: 560 
                   height: 315 
                   src: "https://www.youtube.com/embed/lRpPz19trRw"
                   frameborder: 0
                   allow: "accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                   allowfullscreen: #t)))
                })

      @(qa 3
           @p{Refactor the cards that display moves into its own definition called @tt{move-cards}.}
           @code-a{
                (define (main-jumbotron)
                  (list
                   (jumbotron style: (properties 
                                      background-size: "cover"
                                      background-image: "https://upload.wikimedia.org/wikipedia/commons/2/27/Kempelen_chess1.jpg")
                              (h1 class: "display-4"
                                  "The match of the 19th century")
                              (p "Napoleon versus the Turk"))

                   (p "Image above (by English Wikipedia user Caraf) is of a reconstruction of the machine that bested Napoleon Boneparte.")))


                (define (move-carousel)
                  (carousel class: "slide"
                            (carousel-inner
                             (carousel-item class: "active"
                                            (write-img class: "d-block w-100" (napoleon/turk 2)))
                             (carousel-item class: "active"
                                            (write-img class: "d-block w-100" (napoleon/turk 3)))
                             (carousel-item class: "active"
                                            (write-img class: "d-block w-100" (napoleon/turk 4))))))

                (define (move-cards)
                  (list
                   (h2 "Here's how the game went...")

                   (card-deck
                    (card
                     (card-header "Move Two...")
                     (write-img
                      (napoleon/turk 2)))
                    (card
                     (card-header "Move Three...")
                     (write-img
                      (napoleon/turk 3)))
                    (card
                     (card-header "Move Four...")
                     (write-img
                      (napoleon/turk 4))))))

                (preview-page
                 (main-jumbotron)
                 (move-carousel)
                 (move-cards)


                 (jumbotron
                  (h1 class: "display-4" "Everyone is talking about it")
                  (p "YouTube won't shut up!")
                  (iframe 
                   width: 560 
                   height: 315 
                   src: "https://www.youtube.com/embed/lRpPz19trRw"
                   frameborder: 0
                   allow: "accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                   allowfullscreen: #t)))
                })

      @(qa 4
           @p{Refactor the youtube video jumbotron into its own definition called @tt{youtube}.}
           @code-a{
                (define (main-jumbotron)
                  (list
                   (jumbotron style: (properties 
                                      background-size: "cover"
                                      background-image: "https://upload.wikimedia.org/wikipedia/commons/2/27/Kempelen_chess1.jpg")
                              (h1 class: "display-4"
                                  "The match of the 19th century")
                              (p "Napoleon versus the Turk"))

                   (p "Image above (by English Wikipedia user Caraf) is of a reconstruction of the machine that bested Napoleon Boneparte.")))


                (define (move-carousel)
                  (carousel class: "slide"
                            (carousel-inner
                             (carousel-item class: "active"
                                            (write-img class: "d-block w-100" (napoleon/turk 2)))
                             (carousel-item class: "active"
                                            (write-img class: "d-block w-100" (napoleon/turk 3)))
                             (carousel-item class: "active"
                                            (write-img class: "d-block w-100" (napoleon/turk 4))))))

                (define (move-cards)
                  (list
                   (h2 "Here's how the game went...")

                   (card-deck
                    (card
                     (card-header "Move Two...")
                     (write-img (napoleon/turk 2)))
                    (card
                     (card-header "Move Three...")
                     (write-img
                      (napoleon/turk 3)))
                    (card
                     (card-header "Move Four...")
                     (write-img
                      (napoleon/turk 4))))))


                (define (youtube)
                  (jumbotron
                   (h1 class: "display-4" "Everyone is talking about it")
                   (p "YouTube won't shut up!")
                   (iframe 
                    width: 560 
                    height: 315 
                    src: "https://www.youtube.com/embed/lRpPz19trRw"
                    frameborder: 0
                    allow: "accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen: #t)))

                (preview-page
                 (main-jumbotron)
                 (move-carousel)
                 (move-cards)
                 (youtube))
                })


      @h4{Set 2}

      @(qa 1
           @p{Refactor the carousel items from @tt{move-carousel} into a definition called @tt{move-carousel-item}.  It should take a parameter that it uses inside @tt{napoleon/turk} to pick which move to display.}
           @code-a{
                (define (main-jumbotron)
                  (list
                   (jumbotron style: (properties 
                                      background-size: "cover"
                                      background-image: "https://upload.wikimedia.org/wikipedia/commons/2/27/Kempelen_chess1.jpg")
                              (h1 class: "display-4"
                                  "The match of the 19th century")
                              (p "Napoleon versus the Turk"))

                   (p "Image above (by English Wikipedia user Caraf) is of a reconstruction of the machine that bested Napoleon Boneparte.")))

                (define (move-carousel-item i)
                  (carousel-item class: "active"
                                 (write-img class: "d-block w-100" (napoleon/turk i))))

                (define (move-carousel)
                  (carousel class: "slide"
                            (carousel-inner
                             (move-carousel-item 2)
                             (move-carousel-item 3)
                             (move-carousel-item 4))))

                (define (move-cards)
                  (list
                   (h2 "Here's how the game went...")

                   (card-deck
                    (card
                     (card-header "Move Two...")
                     (write-img (napoleon/turk 2)))
                    (card
                     (card-header "Move Three...")
                     (write-img
                      (napoleon/turk 3)))
                    (card
                     (card-header "Move Four...")
                     (write-img
                      (napoleon/turk 4))))))


                (define (youtube)
                  (jumbotron
                   (h1 class: "display-4" "Everyone is talking about it")
                   (p "YouTube won't shut up!")
                   (iframe 
                    width: 560 
                    height: 315 
                    src: "https://www.youtube.com/embed/lRpPz19trRw"
                    frameborder: 0
                    allow: "accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen: #t)))

                (preview-page
                 (main-jumbotron)
                 (move-carousel)
                 (move-cards)
                 (youtube))
                })

      @(qa 2
           @p{Instead of explicitly calling @tt{move-carousel-item} three times in @tt{move-carousel}, use @tt{map} and @tt{range} to call @tt{move-carousel-item} on each of the numbers from 1 to 10}
           @code-a{
                (define (main-jumbotron)
                  (list
                   (jumbotron style: (properties 
                                      background-size: "cover"
                                      background-image: "https://upload.wikimedia.org/wikipedia/commons/2/27/Kempelen_chess1.jpg")
                              (h1 class: "display-4"
                                  "The match of the 19th century")
                              (p "Napoleon versus the Turk"))

                   (p "Image above (by English Wikipedia user Caraf) is of a reconstruction of the machine that bested Napoleon Boneparte.")))


                (define (move-carousel-item i)
                  (carousel-item class: "active"
                                 (write-img class: "d-block w-100" (napoleon/turk i))))

                (define (move-carousel)
                  (carousel class: "slide"
                            (carousel-inner
                             (map move-carousel-item (range 1 10)))))

                (define (move-cards)
                  (list
                   (h2 "Here's how the game went...")

                   (card-deck
                    (card
                     (card-header "Move Two...")
                     (write-img (napoleon/turk 2)))
                    (card
                     (card-header "Move Three...")
                     (write-img
                      (napoleon/turk 3)))
                    (card
                     (card-header "Move Four...")
                     (write-img
                      (napoleon/turk 4))))))


                (define (youtube)
                  (jumbotron
                   (h1 class: "display-4" "Everyone is talking about it")
                   (p "YouTube won't shut up!")
                   (iframe 
                    width: 560 
                    height: 315 
                    src: "https://www.youtube.com/embed/lRpPz19trRw"
                    frameborder: 0
                    allow: "accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen: #t)))

                (preview-page
                 (main-jumbotron)
                 (move-carousel)
                 (move-cards)
                 (youtube))
                })

      @(qa 3
           @p{For each of the cards in @tt{move-cards}, refactor those in the same way as you did @tt{move-carousel-item} -- that is, make a new definition called @tt{move-card}, and use that one three times in @tt{move-cards}.}
           @code-a{
                (define (main-jumbotron)
                  (list
                   (jumbotron style: (properties 
                                      background-size: "cover"
                                      background-image: "https://upload.wikimedia.org/wikipedia/commons/2/27/Kempelen_chess1.jpg")
                              (h1 class: "display-4"
                                  "The match of the 19th century")
                              (p "Napoleon versus the Turk"))

                   (p "Image above (by English Wikipedia user Caraf) is of a reconstruction of the machine that bested Napoleon Boneparte.")))


                (define (move-carousel-item i)
                  (carousel-item class: "active"
                                 (write-img class: "d-block w-100" (napoleon/turk i))))

                (define (move-carousel)
                  (carousel class: "slide"
                            (carousel-inner
                             (map move-carousel-item (range 1 10)))))


                (define (move-card i)
                  (card
                   (card-header (~a "Move " i "..."))
                   (write-img (napoleon/turk i))))


                (define (move-cards)
                  (list
                   (h2 "Here's how the game went...")

                   (card-deck
                    (move-card 2)
                    (move-card 3)
                    (move-card 4))))


                (define (youtube)
                  (jumbotron
                   (h1 class: "display-4" "Everyone is talking about it")
                   (p "YouTube won't shut up!")
                   (iframe 
                    width: 560 
                    height: 315 
                    src: "https://www.youtube.com/embed/lRpPz19trRw"
                    frameborder: 0
                    allow: "accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen: #t)))

                (preview-page
                 (main-jumbotron)
                 (move-carousel)
                 (move-cards)
                 (youtube))
                })


      @(qa 4
           @p{Use @tt{map} and @tt{range} to call @tt{move-card} ten times in @tt{move-cards} instead of just three.}
           @code-a{

                (define (main-jumbotron)
                  (list
                   (jumbotron style: (properties 
                                      background-size: "cover"
                                      background-image: "https://upload.wikimedia.org/wikipedia/commons/2/27/Kempelen_chess1.jpg")
                              (h1 class: "display-4"
                                  "The match of the 19th century")
                              (p "Napoleon versus the Turk"))

                   (p "Image above (by English Wikipedia user Caraf) is of a reconstruction of the machine that bested Napoleon Boneparte.")))


                (define (move-carousel-item i)
                  (carousel-item class: "active"
                                 (write-img class: "d-block w-100" (napoleon/turk i))))

                (define (move-carousel)
                  (carousel class: "slide"
                            (carousel-inner
                             (map move-carousel-item (range 1 10)))))


                (define (move-card i)
                  (card
                   (card-header (~a "Move " i "..."))
                   (write-img (napoleon/turk i))))


                (define (move-cards)
                  (list
                   (h2 "Here's how the game went...")

                   (card-deck
                    (map move-card (range 1 10)))))

                (define (youtube)
                  (jumbotron
                   (h1 class: "display-4" "Everyone is talking about it")
                   (p "YouTube won't shut up!")
                   (iframe 
                    width: 560 
                    height: 315 
                    src: "https://www.youtube.com/embed/lRpPz19trRw"
                    frameborder: 0
                    allow: "accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen: #t)))

                (preview-page
                 (main-jumbotron)
                 (move-carousel)
                 (move-cards)
                 (youtube))

                })

      @(qa 5
           @p{Create a definition called @tt{youtube-video} that encapsulates the part of the @tt{youtube} jumbotron that displays a youtube video.  Use @tt{youtube-video} inside @tt{youtube}, and while you're at it, add a few more youtube videos to the jumbotron, now that it's easy. }
           @code-a{
                (define (main-jumbotron)
                  (list
                   (jumbotron style: (properties 
                                      background-size: "cover"
                                      background-image: "https://upload.wikimedia.org/wikipedia/commons/2/27/Kempelen_chess1.jpg")
                              (h1 class: "display-4"
                                  "The match of the 19th century")
                              (p "Napoleon versus the Turk"))

                   (p "Image above (by English Wikipedia user Caraf) is of a reconstruction of the machine that bested Napoleon Boneparte.")))


                (define (move-carousel-item i)
                  (carousel-item class: "active"
                                 (write-img class: "d-block w-100" (napoleon/turk i))))

                (define (move-carousel)
                  (carousel class: "slide"
                            (carousel-inner
                             (map move-carousel-item (range 1 10)))))


                (define (move-card i)
                  (card
                   (card-header (~a "Move " i "..."))
                   (write-img (napoleon/turk i))))


                (define (move-cards)
                  (list
                   (h2 "Here's how the game went...")

                   (card-deck
                    (map move-card (range 1 10)))))



                (define (youtube-video id)
                  (iframe 
                   width: 560 
                   height: 315 
                   src: (~a "https://www.youtube.com/embed/" id)
                   frameborder: 0
                   allow: "accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                   allowfullscreen: #t))

                (define (youtube)
                  (jumbotron
                   (h1 class: "display-4" "Everyone is talking about it")
                   (p "YouTube won't shut up!")
                   (youtube-video "lRpPz19trRw")
                   (youtube-video "Cyo0_XUWcWM")
                   (youtube-video "0DbJUTsUwZE")))

                (preview-page
                 (main-jumbotron)
                 (move-carousel)
                 (move-cards)
                 (youtube))
                })

      @h4{Set 3}

      @(qa 1
           @p{Now let's begin to make a second page for a different chess match and see if our code is flexible enough yet.  Duplicate the @tt{napoleon/turk-page} definition to make a new one called @tt{kasparov/deep-blue-page}, use @tt{preview-pages} to preview them both together as part of a two-page website.}
           @code-a{
                (define (main-jumbotron)
                  (list
                   (jumbotron style: (properties 
                                      background-size: "cover"
                                      background-image: "https://upload.wikimedia.org/wikipedia/commons/2/27/Kempelen_chess1.jpg")
                              (h1 class: "display-4"
                                  "The match of the 19th century")
                              (p "Napoleon versus the Turk"))

                   (p "Image above (by English Wikipedia user Caraf) is of a reconstruction of the machine that bested Napoleon Boneparte.")))


                (define (move-carousel-item i)
                  (carousel-item class: "active"
                                 (write-img class: "d-block w-100" (napoleon/turk i))))

                (define (move-carousel)
                  (carousel class: "slide"
                            (carousel-inner
                             (map move-carousel-item (range 1 10)))))


                (define (move-card i)
                  (card
                   (card-header (~a "Move " i "..."))
                   (write-img (napoleon/turk i))))


                (define (move-cards)
                  (list
                   (h2 "Here's how the game went...")

                   (card-deck
                    (map move-card (range 1 10)))))

                (define (youtube-video id)
                  (iframe 
                   width: 560 
                   height: 315 
                   src: (~a "https://www.youtube.com/embed/" id)
                   frameborder: 0
                   allow: "accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                   allowfullscreen: #t))

                (define (youtube)
                  (jumbotron
                   (h1 class: "display-4" "Everyone is talking about it")
                   (p "YouTube won't shut up!")
                   (youtube-video "lRpPz19trRw")
                   (youtube-video "Cyo0_XUWcWM")
                   (youtube-video "0DbJUTsUwZE")))

                (define (napoleon/turk-page)
                  (list
                   (main-jumbotron)
                   (move-carousel)
                   (move-cards)
                   (youtube)))

                (define (kasparov/deep-blue-page)
                  (list
                   (main-jumbotron)
                   (move-carousel)
                   (move-cards)
                   (youtube))

                  (preview-pages
                   (napoleon/turk-page)
                   (kasparov/deep-blue-page)))
                })

      @(qa 2
           @p{Both pages have the same background image, which won't do.  Enhance the @tt{main-jumbotron} definition so that it can display a different background image on each page.}
           @code-a{
                ;Note from the implementor:
                ;  I used a #:background-image keyword parameter here to illustrate another way of writing a definition.
                ;  It wasn't mentioned in the book, but then again -- that's the point of the extra materials: to go beyond the book. 
                (define (main-jumbotron #:background-image background-image)
                  (list
                   (jumbotron style: (properties 
                                      background-size: "cover"
                                      background-image: background-image 
                                      (h1 class: "display-4"
                                          "The match of the 19th century")
                                      (p "Napoleon versus the Turk"))

                              (p "Image above (by English Wikipedia user Caraf) is of a reconstruction of the machine that bested Napoleon Boneparte."))))


                (define (move-carousel-item i)
                  (carousel-item class: "active"
                                 (write-img class: "d-block w-100" (napoleon/turk i))))

                (define (move-carousel)
                  (carousel class: "slide"
                            (carousel-inner
                             (map move-carousel-item (range 1 10)))))


                (define (move-card i)
                  (card
                   (card-header (~a "Move " i "..."))
                   (write-img (napoleon/turk i))))


                (define (move-cards)
                  (list
                   (h2 "Here's how the game went...")

                   (card-deck
                    (map move-card (range 1 10)))))

                (define (youtube-video id)
                  (iframe 
                   width: 560 
                   height: 315 
                   src: (~a "https://www.youtube.com/embed/" id)
                   frameborder: 0
                   allow: "accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                   allowfullscreen: #t))

                (define (youtube)
                  (jumbotron
                   (h1 class: "display-4" "Everyone is talking about it")
                   (p "YouTube won't shut up!")
                   (youtube-video "lRpPz19trRw")
                   (youtube-video "Cyo0_XUWcWM")
                   (youtube-video "0DbJUTsUwZE")))

                (define (napoleon/turk-page)
                  (list
                   (main-jumbotron
                    #:background-image "https://upload.wikimedia.org/wikipedia/commons/2/27/Kempelen_chess1.jpg")
                   (move-carousel)
                   (move-cards)
                   (youtube)))

                (define (kasparov/deep-blue-page)
                  (list
                   (main-jumbotron
                    #:background-image "https://upload.wikimedia.org/wikipedia/commons/b/be/Deep_Blue.jpg")
                   (move-carousel)
                   (move-cards)
                   (youtube))

                  (preview-pages
                   (napoleon/turk-page) 
                   (kasparov/deep-blue-page)))
                })

      @(qa 3
           @p{Add additional flexibility to your @tt{main-jumbotron} so that the title, subtitle, and attribution text can all be specified differently on each page.}
           @code-a{
                (define (main-jumbotron #:background-image background-image
                                        #:title title
                                        #:subtitle subtitle
                                        #:attribution attribution)
                  (list
                   (jumbotron style: (properties 
                                      background-size: "cover"
                                      background-image: background-image 
                                      (h1 class: "display-4"
                                          title)
                                      (p subtitle))

                              (p attribution)))) 


                (define (move-carousel-item i)
                  (carousel-item class: "active"
                                 (write-img class: "d-block w-100" (napoleon/turk i))))

                (define (move-carousel)
                  (carousel class: "slide"
                            (carousel-inner
                             (map move-carousel-item (range 1 10)))))


                (define (move-card i)
                  (card
                   (card-header (~a "Move " i "..."))
                   (write-img (napoleon/turk i))))


                (define (move-cards)
                  (list
                   (h2 "Here's how the game went...")

                   (card-deck
                    (map move-card (range 1 10)))))

                (define (youtube-video id)
                  (iframe 
                   width: 560 
                   height: 315 
                   src: (~a "https://www.youtube.com/embed/" id)
                   frameborder: 0
                   allow: "accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                   allowfullscreen: #t))

                (define (youtube)
                  (jumbotron
                   (h1 class: "display-4" "Everyone is talking about it")
                   (p "YouTube won't shut up!")
                   (youtube-video "lRpPz19trRw")
                   (youtube-video "Cyo0_XUWcWM")
                   (youtube-video "0DbJUTsUwZE")))

                (define (napoleon/turk-page)
                  (list
                   (main-jumbotron
                    #:background-image "https://upload.wikimedia.org/wikipedia/commons/2/27/Kempelen_chess1.jpg"
                    #:title "The Match of the 19th Century"
                    #:subtitle "Napoleon Versus The Turk"
                    #:attribution "Image above (by English Wikipedia user Caraf) is of a reconstruction of the machine that bested Napoleon Boneparte.")
                   (move-carousel)
                   (move-cards)
                   (youtube)))

                (define (kasparov/deep-blue-page)
                  (list
                   (main-jumbotron
                    #:background-image "https://upload.wikimedia.org/wikipedia/commons/b/be/Deep_Blue.jpg"
                    #:title "The Match of the 21st Century"
                    #:subtitle "Kasparov Versus Deep Blue"
                    #:attribution (list "Photo by Flicker user " (a href: "https://www.flickr.com/photos/jamesthephotographer/" "James the Photographer")))
                   (move-carousel)
                   (move-cards)
                   (youtube))

                  (preview-pages
                   (napoleon/turk-page) 
                   (kasparov/deep-blue-page)))
                })

      @(qa 4
           @p{Now the main issue is simply that each page displays the moves from only one game.  Add flexibility to @tt{move-carousel}, @tt{move-carousel-item}, @tt{move-cards}, and @tt{move-card}.  Use the flexibility to display a different game's moves on each page.  (NOTE: @tt{kasparov/deep-blue} is the name of the vocabulary word that provides moves for the Kasparov game.)  Also, experiment to find out how many moves are in each game -- and display all of them.}
           @code-a{

                (define (main-jumbotron #:background-image background-image
                                        #:title title
                                        #:subtitle subtitle
                                        #:attribution attribution)
                  (list
                   (jumbotron style: (properties 
                                      background-size: "cover"
                                      background-image: background-image 
                                      (h1 class: "display-4"
                                          title)
                                      (p subtitle))

                              (p attribution)))) 


                (define (move-carousel-item game i)
                  (carousel-item class: "active"
                                 (write-img class: "d-block w-100" (game i))))

                (define (move-carousel game max-moves)
                  (carousel class: "slide"
                            (carousel-inner
                             (map (curry move-carousel-item game)
                                  (range 1 max-moves)))))


                (define (move-card game i)
                  (card
                   (card-header (~a "Move " i "..."))
                   (write-img (game i))))


                (define (move-cards game max-moves)
                  (list
                   (h2 "Here's how the game went...")

                   (card-deck
                    (map (curry move-card game)
                         (range 1 max-moves)))))

                (define (youtube-video id)
                  (iframe 
                   width: 560 
                   height: 315 
                   src: (~a "https://www.youtube.com/embed/" id)
                   frameborder: 0
                   allow: "accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                   allowfullscreen: #t))

                (define (youtube)
                  (jumbotron
                   (h1 class: "display-4" "Everyone is talking about it")
                   (p "YouTube won't shut up!")
                   (youtube-video "lRpPz19trRw")
                   (youtube-video "Cyo0_XUWcWM")
                   (youtube-video "0DbJUTsUwZE")))

                (define (napoleon/turk-page)
                  (list
                   (main-jumbotron
                    #:background-image "https://upload.wikimedia.org/wikipedia/commons/2/27/Kempelen_chess1.jpg"
                    #:title "The Match of the 19th Century"
                    #:subtitle "Napoleon Versus The Turk"
                    #:attribution "Image above (by English Wikipedia user Caraf) is of a reconstruction of the machine that bested Napoleon Boneparte.")
                   (move-carousel napoleon/turk 48)
                   (move-cards napoleon/turk 48)
                   (youtube)))

                (define (kasparov/deep-blue-page)
                  (list
                   (main-jumbotron
                    #:background-image "https://upload.wikimedia.org/wikipedia/commons/b/be/Deep_Blue.jpg"
                    #:title "The Match of the 21st Century"
                    #:subtitle "Kasparov Versus Deep Blue"
                    #:attribution (list "Photo by Flicker user " (a href: "https://www.flickr.com/photos/jamesthephotographer/" "James the Photographer")))
                   (move-carousel kasparov/deep-blue 73)
                   (move-cards kasparov/deep-blue 73) 
                   (youtube))

                  (preview-pages
                   (napoleon/turk-page) 
                   (kasparov/deep-blue-page)))
                })

      @(qa 5
           @p{Finally, make the @tt{youtube} definition more flexible -- so that different videos can be displayed on each page.}
           @code-a{
                (define (main-jumbotron #:background-image background-image
                                        #:title title
                                        #:subtitle subtitle
                                        #:attribution attribution)
                  (list
                   (jumbotron style: (properties 
                                      background-size: "cover"
                                      background-image: background-image 
                                      (h1 class: "display-4"
                                          title)
                                      (p subtitle))

                              (p attribution)))) 


                (define (move-carousel-item game i)
                  (carousel-item class: "active"
                                 (write-img class: "d-block w-100" (game i))))

                (define (move-carousel game max-moves)
                  (carousel class: "slide"
                            (carousel-inner
                             (map (curry move-carousel-item game)
                                  (range 1 max-moves)))))


                (define (move-card game i)
                  (card
                   (card-header (~a "Move " i "..."))
                   (write-img (game i))))


                (define (move-cards game max-moves)
                  (list
                   (h2 "Here's how the game went...")

                   (card-deck
                    (map (curry move-card game)
                         (range 1 max-moves)))))

                (define (youtube-video id)
                  (iframe 
                   width: 560 
                   height: 315 
                   src: (~a "https://www.youtube.com/embed/" id)
                   frameborder: 0
                   allow: "accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                   allowfullscreen: #t))

                (define (youtube . ids)
                  (jumbotron
                   (h1 class: "display-4" "Everyone is talking about it")
                   (p "YouTube won't shut up!")
                   (map youtube-video ids)))

                (define (napoleon/turk-page)
                  (list
                   (main-jumbotron
                    #:background-image "https://upload.wikimedia.org/wikipedia/commons/2/27/Kempelen_chess1.jpg"
                    #:title "The Match of the 19th Century"
                    #:subtitle "Napoleon Versus The Turk"
                    #:attribution "Image above (by English Wikipedia user Caraf) is of a reconstruction of the machine that bested Napoleon Boneparte.")
                   (move-carousel napoleon/turk 48)
                   (move-cards napoleon/turk 48)
                   (youtube
                    "lRpPz19trRw"
                    "Cyo0_XUWcWM"
                    "0DbJUTsUwZE")))

                (define (kasparov/deep-blue-page)
                  (list
                   (main-jumbotron
                    #:background-image "https://upload.wikimedia.org/wikipedia/commons/b/be/Deep_Blue.jpg"
                    #:title "The Match of the 21st Century"
                    #:subtitle "Kasparov Versus Deep Blue"
                    #:attribution (list "Photo by Flicker user " (a href: "https://www.flickr.com/photos/jamesthephotographer/" "James the Photographer")))
                   (move-carousel kasparov/deep-blue 73)
                   (move-cards kasparov/deep-blue 73) 
                   (youtube "U_ZOzqR4uCI")))

                (preview-pages
                 (napoleon/turk-page) 
                 (kasparov/deep-blue-page))

                })

      @h4{Set 4}

      In the Chapter 3 problem set, we created a website -- sort of an interactive essay about a historic chess match.  In the pairs above, we refactored that code so that the definitions were flexible enough to tell two different stories with the same framework: the Napoleon game and the Kasparov game.

      Now, we'll create a small blog website from scratch, but using flexible definitions from the get-go.

      @(qa 1
           @p{Make a blog with one post.  Make a definition for @tt{post} that can be reused for many different posts.}
           @code-a{
                ;Note from the implementor:
                ;  I used what's called a "rest" parameter here.  I'm naming it so that readers can look up the concept if they wish. 
                (define (post title . content)
                  (list
                   (jumbotron
                    (h1 class: "display-4" title))
                   content))

                (define (post-1)
                  (post "First Post"
                        (p "I made a blog today")))

                (define (my-code-blog)
                  (container
                   (post-1)))

                (preview-pages
                 (my-code-blog))
                })


      @(qa 2
           @p{Add a second post, using @tt{post}, about how you made the first post.}
           @code-a{
                (define (post title . content)
                  (list
                   (jumbotron
                    (h1 class: "display-4" title))
                   content))

                (define (post-1)
                  (post "First Post"
                        (p "I made a blog today")))

                (define (post-2)
                  (post "Second Post"
                        (p "This is the code I used to create my first post")
                        (code 
                         '(define (post-1)
                            (post "First Post"
                                  (p "I made a blog today"))))))

                (define (my-code-blog)
                  (container
                   (post-1)
                   (post-2)))

                (preview-pages
                 (my-code-blog))
                })


      @(qa 3
           @p{Add a third post, using @tt{post} again.  Use this post to remind you about the code to make a bootstrap card.}
           @code-a{
                (define (post title . content)
                  (list
                   (jumbotron
                    (h1 class: "display-4" title))
                   content))

                (define (post-1)
                  (post "First Post"
                        (p "I made a blog today")))

                (define (post-2)
                  (post "Second Post"
                        (p "This is the code I used to create my first post")
                        (code 
                         '(define (post-1)
                            (post "First Post"
                                  (p "I made a blog today"))))))

                (define (post-3)
                  (post "Third Post"
                        (p "This is a reminder of how to make bootstrap cards")
                        (code 
                         '(card
                           (card-header (h5 "I am a card"))
                           (card-body (card-text "This is the card text"))))))
                

                (define (my-code-blog)
                  (container
                   (post-1)
                   (post-2)
                   (post-3)))

                (preview-pages
                 (my-code-blog))
                })

      @(qa 4
           @p{Add another post, using @tt{post}.  Also, change how all of your posts look by changing the @tt{post} definition.}
           @code-a{
                (define (post title . content)
                  (card
                   (card-header
                    (h5 class: "display-4" title))
                   (card-body content)))

                (define (post-1)
                  (post "First Post"
                        (p "I made a blog today")))

                (define (post-2)
                  (post "Second Post"
                        (p "This is the code I used to create my first post")
                        (code 
                         '(define (post-1)
                            (post "First Post"
                                  (p "I made a blog today"))))))

                (define (post-3)
                  (post "Third Post"
                        (p "This is a reminder of how to make bootstrap cards")
                        (code 
                         '(card
                           (card-header (h5 "I am a card"))
                           (card-body (card-text "This is the card text"))))))

                (define (post-4)
                  (post "Experimenting with posts as cards"
                        (p "Today, I changed how my blog posts look")))
                

                (define (my-code-blog)
                  (container
                   (post-1)
                   (post-2)
                   (post-3)
                   (post-4)))

                (preview-pages
                 (my-code-blog))
                })

      }))



(define (site)
  (container
    (h1 "Don't Teach Coding")
    (h2 "Until You Read This Book")

    (h3 "Companion content")

   @p{The following text is designed to help you level up your coding fluencies.  It goes well beyond the material in the four chapters of @i{Don't Teach Coding} and is designed to help you see how the abstract concepts of the book might be applied in more practical ways.   And, above all, they are designed to give you an opportunity to practice writing code -- the main activity that will shape your mind into a better and better coder over time.
   
   Note, these are not traditional problems that you might find in traditional textbooks.  Below, we give four recommendations for how you should approach this document (none of which is to approach the problems how you might approach the question/answer style of exercises).

   @p{You @i{could} think of the following problems as questions and answers from traditional textbooks.  But we've labeled them "Specifications" and "Implementations" for a reason.  In softwere engineering, a "Specification" is something written (or spoken, or a little of both) largely rendered in natural language -- which a coder translates into an "Implementation" written largely in code.  Give ten coders one Specification and you'll get ten or more Implementations.  Thus, we recommend not thinking of these as questions paired with their One Right Answer.}}

   @ol{

   @li{
   @p{@b{Read English, Read Code} Or, you can reveal both the Specification and Implementation, reading both and trying to find the parallels.  That comparative linguistics approach can be useful -- but ultimately won't be as beneficial as the below two (more difficult) challenges.  Language students who fear making mistakes are often tempted to spend time solely on reading acties.  We encourage students to resist this temptation and begin writting as soon as possible though.}}

   @li{@p{@b{Read English, Write Code} One way you can use these learning resources is to hide the Implementation and attempt to write the Specification.  That exercise will increase your coding fluencies by helping you practice the act of translating from your native language to code.}}

   @li{
   @p{@b{Read Code, Write English} However, you can also hide the Specification and attempt to discern it from the Implementation.  That exercise will increase your coding fluencies by helping your practice the act of translation from code to your native language.}}

   @li{
   @p{@b{Write English, Write Code} Lastly, and perhaps most valuable of all, you can take the Implementations here as starting points for your own creative activities.  Take these Specifications and change them and adapt them for your own ends.  Then write your own Implementaiton.  Creative writing in another language simultaneously builds fluencies and reveals to you your own weaknesses.} }}

   (tabify 
     (active-tab-nav-link href: "#ch1" "Chapter 1")
     (tab-nav-link href: "#ch2" "Chapter 2")
     (tab-nav-link href: "#ch3" "Chapter 3")
     (tab-nav-link href: "#ch4" "Chapter 4")

     (active-tab-pane id: "ch1" (chapter-1))
     (tab-pane id: "ch2" (chapter-2))
     (tab-pane id: "ch3" (chapter-3))
     (tab-pane id: "ch4" (chapter-4)))))

(define (index)
  (content #:head (list
		    (include-css "https://cdn.jsdelivr.net/gh/PrismJS/prism@1.17.1/themes/prism.css")
		    (include-js "https://cdn.jsdelivr.net/npm/prismjs@1.17.1/prism.min.js")
		    (include-js "https://cdn.jsdelivr.net/gh/PrismJS/prism@1.17.1/plugins/autoloader/prism-autoloader.min.js"))
	   (site)))

(module+ main
	 (render (bootstrap
		   (page index.html 
			 (index)))
		 #:to "out"))


