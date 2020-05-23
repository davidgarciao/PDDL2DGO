(define (domain DominioRover)
(:requirements :typing :durative-actions :fluents :strips)
(:types rover location)

(:predicates (at ?r -rover ?l -location) 
             (drill ?l -location)
	     (picture ?l -location)
             (communication ?l -location)
	     (analyse-sample ?l -location)
	     (available ?r -rover))

(:functions (battery ?r -rover)
	    (battery-use-low ?r -rover)
	    (battery-use-normal ?r -rover)
	    (battery-recharge ?r -rover)
	    (move-slow ?r -rover)
	    (move-fast ?r -rover)
	    (distance ?from ?to -location))



(:durative-action recharge
	:parameters (?r -rover ?l -location)
	:duration (= ?duration 10)
	:condition (and (at start (<= (battery ?r) 15))
		   	(over all (at ?r ?l)))
	:effect (at end (increase (battery ?r) (* ?duration (battery-recharge ?r))))
)


(:durative-action slow
	:parameters (?r -rover ?from ?to -location)
	:duration (= ?duration (/ (distance ?from ?to) (move-slow ?r)))
	:condition (and (at start (at ?r ?from))
			(at start (available ?r))
			(at start (>= (battery ?r) (* (distance ?from ?to) (battery-use-low ?r)))))
	:effect (and (at start (not (at ?r ?from)))
		     (at start (decrease (battery ?r) (* (distance ?from ?to) (battery-use-low ?r))))
		     (at end (at ?r ?to)))
)


(:durative-action fast
	:parameters (?r -rover ?from ?to -location)
	:duration (= ?duration (/ (distance ?from ?to) (move-fast ?r)))
	:condition (and (at start (at ?r ?from))
			(at start (available ?r))
			(at start (>= (battery ?r) (* (distance ?from ?to) (battery-use-normal ?r)))))
	:effect (and (at start (not (at ?r ?from)))
		     (at start (decrease (battery ?r) (* (distance ?from ?to) (battery-use-normal ?r))))
		     (at end (at ?r ?to)))
)


(:durative-action analyse
	:parameters (?r -rover ?l -location)
	:duration (= ?duration 5)
	:condition (and (at start (available ?r))
			(at start (>= (battery ?r) (* (battery-use-normal ?r) 5)))
			(over all (at ?r ?l)))
	:effect (and (at start (not (available ?r)))
		     (at start (decrease (battery ?r) (* (battery-use-normal ?r) 5)))
		     (at end (analyse-sample ?l))
		     (at end (available ?r)))
)


(:durative-action use-drill
	:parameters (?r -rover ?l -location)
	:duration (= ?duration 10)
	:condition (and (at start (available ?r))
			(at start (>= (battery ?r) (* (battery-use-normal ?r) 10)))
			(over all (at ?r ?l)))
	:effect (and (at start (not (available ?r)))
		     (at start (decrease (battery ?r) (* (battery-use-normal ?r) 10)))
		     (at end (drill ?l))
		     (at end (available ?r)))
)


(:durative-action take-picture
	:parameters (?r -rover ?l -location)
	:duration (= ?duration 3)
	:condition (and (at start (available ?r))
			(at start (>= (battery ?r) (* (battery-use-low ?r) 3)))
			(over all (at ?r ?l)))
	:effect (and (at start (not (available ?r)))
		     (at start (decrease (battery ?r) (* (battery-use-low ?r) 3)))
		     (at end (picture ?l))
		     (at end (available ?r)))	
)


(:durative-action communicate-earth
	:parameters (?r -rover ?l ?from -location)
	:duration (= ?duration 20)
	:condition (and (at start (available ?r))
			(at start (>= (battery ?r) (* (battery-use-low ?r) 20)))
			(over all (at ?r ?l)))
	:effect (and (at start (not (available ?r)))
		    (at start (decrease (battery ?r) (* (battery-use-low ?r) 20)))
		    (at end (available ?r))
		    (at end (communication ?l)))
)


	



             

)

