(define (problem ProblemaRover)
    (:domain DominioRover)
    (:objects rover - rover
              inicio planet1 planet2 planet3 planet4 planet5 fin - location)
              
    (:init 
            (at rover inicio)
            (available rover)
            
            (= (battery rover) 100)
            (= (battery-use-low rover) 2)
            (= (battery-use-normal rover) 5)
            (= (move-slow rover) 3)
            (= (move-fast rover) 10)   
            (= (battery-recharge rover) 5)
            (= (distance inicio planet1) 20)
            (= (distance inicio planet2) 40)
	    (= (distance inicio planet3) 50)
	    (= (distance inicio planet4) 70)
	    (= (distance inicio planet5) 90)
	    (= (distance inicio fin) 100)
            (= (distance planet1 planet2) 20)
            (= (distance planet1 planet3) 30)
            (= (distance planet1 planet4) 50)
	    (= (distance planet1 planet5) 70)
	    (= (distance planet1 fin) 80)
	    (= (distance planet2 planet3) 10)
	    (= (distance planet2 planet4) 30)
	    (= (distance planet2 planet5) 50)
	    (= (distance planet2 fin) 60)
	    (= (distance planet3 planet4) 20)
	    (= (distance planet3 planet5) 40)
	    (= (distance planet3 fin) 50)
	    (= (distance planet4 planet5) 20)
    	    (= (distance planet4 fin) 30)
	    (= (distance planet5 fin) 10)
	       

            (= (distance planet1 inicio) 20)
            (= (distance planet2 inicio) 40)
	    (= (distance planet3 inicio) 50)
	    (= (distance planet4 inicio) 70)
	    (= (distance planet5 inicio) 90)
	    (= (distance fin inicio) 100)
            (= (distance planet2 planet1) 20)
            (= (distance planet3 planet1) 30)
            (= (distance planet4 planet1) 50)
	    (= (distance planet5 planet1) 70)
	    (= (distance fin planet1) 80)
	    (= (distance planet3 planet2) 10)
	    (= (distance planet4 planet2) 30)
	    (= (distance planet5 planet2) 50)
	    (= (distance fin planet2) 60)
	    (= (distance planet4 planet3) 20)
	    (= (distance planet5 planet3) 40)
	    (= (distance fin planet3) 50)
	    (= (distance planet5 planet4) 20)
    	    (= (distance fin planet4) 30)
	    (= (distance fin planet5) 10))
	
            
            
    (:goal (and 
        (at rover fin)
        (picture planet2)
        (communication planet1)
        (drill planet4)
        (analyse-sample planet5)
        ))

    (:metric minimize (total-time))
        
)          
            
            
            
            
            
            
