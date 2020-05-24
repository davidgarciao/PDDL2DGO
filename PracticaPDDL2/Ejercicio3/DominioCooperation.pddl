(define (domain DominioCooperation)

  (:requirements 
    :strips 
    :fluents 
    :durative-actions 
    :timed-initial-literals 
    :typing 
    :conditional-effects 
    :equality
    :adl
    :disjunctive-preconditions
    :equality
    :constraints
    :preferences
  )

  (:types 
      vehicle
      UAV UGV -vehicle
      navigationMode
      point 
      base
      camera
      cameraRotation
      pan tilt -cameraRotation 
       
  )

  (:predicates
    (vehicle-at ?v -vehicle ?p -point)
    (base-location ?b -base ?p -point)
    (in-base ?v -vehicle ?b -base)
    (mode  ?v -vehicle ?m -navigationMode)
    (picture ?p -point ?pan -pan ?t -tilt) 
    (send ?p -point ?pan -pan ?t -tilt)
    (vehicle-picture ?v -vehicle ?c -camera ?p -point ?pan -pan ?t -tilt)  
    (orientated ?c -camera ?p -pan ?t -tilt)
  )

   (:functions
    (battery-total)
    (distance-total)
    (distance ?p1 ?p2 -point)
    (time-send)
    (battery-send)
    (time-picture)
    (battery-picture)
    (battery-charge ?v -vehicle)
    (time-dock)
    (battery-dock)
    (time-orientation)
    (battery-orientation)
    (speed ?v -vehicle ?m -navigationMode)
    (capacity-now ?v -vehicle)
    (capacity-max ?v -vehicle)
    (time-change-navigation)
    (battery-change-navigation)
    )

    ;(:constraints (and
    ;(forall (?v - vehicle) (always (> (capacity-now ?v) 0)))
    ;))

  (:durative-action dock
    :parameters (?v -vehicle ?p -point ?b -base)
    :duration (= ?duration (time-dock))
    :condition (and
      (at start (>=(capacity-now ?v) (battery-dock)))
      (over all (base-location ?b ?p))
      (over all (vehicle-at ?v ?p))
    )
    :effect (and 
      (at end (in-base ?v ?b))
      (at end (decrease (capacity-now ?v) (battery-dock)))
      (at end (increase (battery-total) (battery-dock)))
    )
  )

   (:durative-action undock
    :parameters (?v -vehicle ?p -point ?b -base)
    :duration (= ?duration (time-dock))
    :condition (and
      (at start (>=(capacity-now ?v) (battery-dock)))
      (over all (base-location ?b ?p))
      (over all (vehicle-at ?v ?p))
    )
    :effect (and 
      (at end (not(in-base ?v ?b)))
      (at end (decrease (capacity-now ?v) (battery-dock)))
      (at end (increase (battery-total) (battery-dock)))
    )
  )
   (:durative-action charge 
    :parameters (?v -vehicle)
    :duration (= ?duration (battery-charge ?v))
    :condition ()
    :effect (at end (assign (capacity-now ?v) (capacity-max ?v)))
  )

  (:durative-action move
    :parameters (?v -vehicle ?m -navigationMode ?p1 ?p2 -point)
    :duration (= ?duration (/(distance ?p1 ?p2) (speed ?v ?m)))
    :condition (and 
      (at start (>=(capacity-now ?v) (*(distance ?p1 ?p2) 0.2)))
      (at start (vehicle-at ?v ?p1))
      (over all (mode ?v ?m))
      )

    :effect (and 
      (at end (not(vehicle-at ?v ?p1)))
      (at end (vehicle-at ?v ?p2))
      (at end (decrease (capacity-now ?v) (*(distance ?p1 ?p2) 0.2)))
      (at end (increase (battery-total) (*(distance ?p1 ?p2) 0.2)))
      (at end (increase (distance-total) (distance ?p1 ?p2)))
    )
  )

   (:durative-action orientate
    :parameters (?c -camera ?v -vehicle ?panOrigin -pan ?tiltOrigin -tilt ?panDestiny -pan ?tiltDestiny -tilt)
    :duration (= ?duration (time-orientation))
    :condition (and 
      (at start (>=(capacity-now ?v) (battery-orientation)))
      (at start (orientated ?c ?panOrigin ?tiltOrigin))
    )

    :effect (and 
      (at end (not (orientated ?c ?panOrigin ?tiltOrigin)))
      (at end (orientated ?c ?panDestiny ?tiltDestiny))
      (at end (decrease (capacity-now ?v) (battery-orientation)))
      (at end (increase (battery-total) (battery-orientation)))
    )
  )

  (:durative-action take-picture
    :parameters (?v -vehicle ?c -camera ?p -point ?pan -pan ?tilt -tilt)
    :duration (= ?duration (time-picture))
    :condition (and 
      (at start (>=(capacity-now ?v) (battery-picture)))
      (over all (vehicle-at ?v ?p))
      (over all (orientated ?c ?pan ?tilt))
    )
    :effect (and
      (at end (vehicle-picture ?v  ?c ?p ?pan  ?tilt))
      (at end (picture ?p ?pan ?tilt))
      (at end (vehicle-at ?v ?p))
      (at end (decrease (capacity-now ?v) (battery-picture)))
      (at end (increase (battery-total) (battery-picture)))
    )
  )

  (:durative-action send-picture
    :parameters (?v - vehicle ?c - camera ?p - point ?pan - pan ?tilt - tilt)
    :duration (= ?duration (time-send))
    :condition (and 
      (at start (>=(capacity-now ?v) (battery-send)))
      (at start (vehicle-picture ?v  ?c ?p ?pan  ?tilt))
    )
    :effect (and 
      (at end (send ?p ?pan ?tilt))
      (at end (not(vehicle-picture ?v  ?c ?p ?pan  ?tilt)))
      (at end (decrease (capacity-now ?v) (battery-send)))
      (at end (increase (battery-total) (battery-send)))
    )
  )

  (:durative-action change-mode
        :parameters (?v -vehicle ?m0 ?m1 -navigationMode)
        :duration (= ?duration (time-change-navigation))
        :condition (at start (mode ?v ?m0))
        :effect (and 
		     (at start (not (mode ?v ?m0)))
                     (at end (mode ?v ?m1))
		     (at end (decrease (capacity-now ?v) (battery-change-navigation)))
		     (at end (increase (battery-total) (battery-change-navigation)))
                      
    )
 )
  
)
