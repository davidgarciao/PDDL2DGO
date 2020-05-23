(define (problem ProblemaElevators1)
(:domain DominioElevators)
(:objects   
        n0 n1 n2 n3 n4 - number
        p1 p2 - person
        fast1 fast2 - fastlift
        slow1 slow2 - slowlift)

(:init
	 (level-even n0) (level-even n2) (level-even n4)

         (adjacent n0 n1) (adjacent n1 n2) (adjacent n2 n3) (adjacent n3 n4)
            
         (level-above n0 n1) (level-above n0 n2) (level-above n0 n3) (level-above n0 n4)
         (level-above n1 n2) (level-above n1 n3) (level-above n1 n4)
         (level-above n2 n3) (level-above n2 n4)
         (level-above n3 n4)
                       

         (lift-at fast1 n1) (lift-at fast2 n0)
         (lift-at slow1 n4) (lift-at slow2 n3)
            
         (people-aboard fast1 n0) (people-aboard fast2 n0)
         (people-aboard slow1 n0) (people-aboard slow2 n0)



         (= (move-slow n0 n1) 10) (= (move-slow n0 n2) 20) (= (move-slow n0 n3) 30) (= (move-slow n0 n4) 40)
         (= (move-slow n1 n2) 10) (= (move-slow n1 n3) 20) (= (move-slow n1 n4) 30)
         (= (move-slow n2 n3) 10) (= (move-slow n2 n4) 20)
         (= (move-slow n3 n4) 10)
            
         (= (move-fast n0 n2) 7) (= (move-fast n0 n4) 14)
         (= (move-fast n2 n4) 7)


	 (person-at p1 n1)
         (person-at p2 n0)
)
        
        (:goal (and 
            (person-at p1 n3)
            (person-at p2 n4))) 

        (:metric minimize (total-time))
)               
