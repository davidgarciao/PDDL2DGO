(define (domain DominioElevators)

(:requirements :strips :typing :fluents :durative-actions)
   
(:types 
        	lift - object
       		slowlift fastlift - lift
        	person - object
        	number - object)

(:predicates 	 (lift-at ?x -lift ?l -number)
                 (person-at ?p -person ?l -number)
                 (in-lift ?x -lift ?p -person)
                 (people-aboard ?x -lift ?n -number)
                 (adjacent ?n1 ?n2 -number)
		 (level-even ?l -number)
                 (level-above ?l1 ?l2 -number)
    )

(:functions 	(move-slow ?l1 ?l2)
                (move-fast ?l1 ?l2)
)


(:durative-action slow-move-up
        :parameters (?x - slowlift ?l1 ?l2 -number)
        :duration (= ?duration (move-slow ?l1 ?l2))
        :condition (and (at start (lift-at ?x ?l1))
                        (at start (level-above ?l1 ?l2)))
        :effect (and (at start (not (lift-at ?x ?l1)))
                     (at end (lift-at ?x ?l2)))
)


(:durative-action slow-move-down
	:parameters (?x -slowlift ?l1 ?l2 -number)
        :duration (= ?duration (move-slow ?l2 ?l1))
        :condition (and (at start (lift-at ?x ?l1))
                        (at start (level-above ?l2 ?l1)))
        :effect (and (at start (not (lift-at ?x ?l1)))
                     (at end (lift-at ?x ?l2)))
)

    
(:durative-action move-up-fast
        :parameters (?x -fastlift ?l1 ?l2 -number)
        :duration (= ?duration (move-fast ?l1 ?l2))
        :condition (and (at start (lift-at ?x ?l1))
			(at start (level-even ?l2))
                        (at start (level-above ?l1 ?l2)))
        :effect (and (at start (not (lift-at ?x ?l1)))
                     (at end (lift-at ?x ?l2)))
)
    
    
(:durative-action fast-move-down
        :parameters (?x -fastlift ?l1 ?l2 -number)
        :duration (= ?duration (move-fast ?l2 ?l1))
        :condition (and (at start (lift-at ?x ?l1))
			(at start (level-even ?l2))
                        (at start (level-above ?l2 ?l1)))                       
        :effect (and (at start (not (lift-at ?x ?l1)))
                     (at end (lift-at ?x ?l2)))
)
  
  
(:durative-action board 
        :parameters (?p -person ?x -lift ?l ?num-p1 ?num-p2 -number)
        :duration (= ?duration 1)
        :condition (and (at start (person-at ?p ?l))
                        (at start (people-aboard ?x ?num-p1))
                        (at start (adjacent ?num-p1 ?num-p2))
                        (over all (lift-at ?x ?l)))
        :effect (and (at start (not (person-at ?p ?l)))
                     (at start (not (people-aboard ?x ?num-p1)))
                     (at end (in-lift ?x ?p))
                     (at end (people-aboard ?x ?num-p2)))
)

    
(:durative-action leave
        :parameters (?p -person ?x -lift ?l ?num-p1 ?num-p2 -number)
        :duration (= ?duration 1)
        :condition (and (at start (people-aboard ?x ?num-p1))
                        (at start (in-lift ?x ?p))
                        (at start (adjacent ?num-p2 ?num-p1))
                        (over all (lift-at ?x ?l)))
        :effect (and (at start (not (in-lift ?x ?p)))
                     (at start (not (people-aboard ?x ?num-p1)))
                     (at end (person-at ?p ?l))
                     (at end (people-aboard ?x ?num-p2)))
)
)
