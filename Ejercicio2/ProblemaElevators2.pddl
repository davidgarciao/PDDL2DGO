(define (problem ProblemaElevators2)
(:domain DominioElevators)
(:objects 
        n0 n1 n2 n3 n4 n5 n6 n7 n8 - number
        p1 p2 p3 p4 - person
        fast1 fast2 - fastlift
        slow1 slow2 - slowlift)
        
(:init
	 (level-even n0) (level-even n2) (level-even n4) (level-even n6) (level-even n8)
	 
	 (adjacent n0 n1) (adjacent n1 n2) (adjacent n2 n3) (adjacent n3 n4) (adjacent n4 n5) (adjacent n5 n6) (adjacent n7 n8) 
 
         (level-above n0 n1) (level-above n0 n2) (level-above n0 n3) (level-above n0 n4) (level-above n0 n5) (level-above n0 n6) (level-above n0 n7) (level-above n0 n8)
         (level-above n1 n2) (level-above n1 n3) (level-above n1 n4) (level-above n1 n5) (level-above n1 n6) (level-above n1 n7) (level-above n1 n8)
         (level-above n2 n3) (level-above n2 n4) (level-above n2 n5) (level-above n2 n6) (level-above n2 n7) (level-above n2 n8) 
         (level-above n3 n4) (level-above n3 n5) (level-above n3 n6) (level-above n3 n7) (level-above n3 n8)
         (level-above n4 n5) (level-above n4 n6) (level-above n4 n7) (level-above n4 n8) 
         (level-above n5 n6) (level-above n5 n7) (level-above n5 n8)
         (level-above n6 n7) (level-above n6 n8)
         (level-above n7 n8)
            
   
         (lift-at fast1 n0) (lift-at fast2 n2)
         (lift-at slow1 n1) (lift-at slow2 n3)
            
                  
         (people-aboard fast1 n0) (people-aboard fast2 n0)
         (people-aboard slow1 n0) (people-aboard slow2 n0)
        
         

         (= (move-slow n0 n1) 10) (= (move-slow n0 n2) 20) (= (move-slow n0 n3) 30) (= (move-slow n0 n4) 40) 
         (= (move-slow n0 n5) 50) (= (move-slow n0 n6) 60) (= (move-slow n0 n7) 70) (= (move-slow n0 n8) 80)
         (= (move-slow n1 n2) 10) (= (move-slow n1 n3) 20) (= (move-slow n1 n4) 30) (= (move-slow n1 n5) 40)
         (= (move-slow n1 n6) 50) (= (move-slow n1 n7) 60) (= (move-slow n1 n8) 70) 
         (= (move-slow n2 n3) 10) (= (move-slow n2 n4) 20) (= (move-slow n2 n5) 30) (= (move-slow n2 n6) 40)
         (= (move-slow n2 n7) 50) (= (move-slow n2 n8) 60)
         (= (move-slow n3 n4) 10) (= (move-slow n3 n5) 20) (= (move-slow n3 n6) 30) (= (move-slow n3 n7) 40)
         (= (move-slow n3 n8) 50)
         (= (move-slow n4 n5) 10) (= (move-slow n4 n6) 20) (= (move-slow n4 n7) 30) (= (move-slow n4 n8) 40)
         (= (move-slow n5 n6) 10) (= (move-slow n5 n7) 20) (= (move-slow n5 n8) 30)
         (= (move-slow n6 n7) 10) (= (move-slow n6 n8) 20)
         (= (move-slow n7 n8) 10)
            
         (= (move-fast n0 n2) 7) (= (move-fast n0 n4) 14) (= (move-fast n0 n6) 21) (= (move-fast n0 n8) 28)
         (= (move-fast n2 n4) 7) (= (move-fast n2 n6) 14) (= (move-fast n2 n8) 21)
         (= (move-fast n4 n6) 7) (= (move-fast n4 n8) 14)
         (= (move-fast n6 n8) 7)
	

	 (person-at p1 n0)
         (person-at p2 n0)
         (person-at p3 n5)
         (person-at p4 n6)
)
        
        (:goal (and 
            (person-at p1 n6)
            (person-at p2 n3)
            (person-at p3 n1)
            (person-at p4 n0))) 

        (:metric minimize (total-time))
)               
