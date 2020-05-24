(define (problem ProblemaCooperation) 
    (:domain DominioCooperation)
(:objects 
    LEADER -UAV
    FOLLOWER -UGV
    BASE -base
    N0 N1 -NavigationMode
    C1 C2 -camera

    P0509 P1613 P1010 P0000 -point

    P_0 P_45 P_90 P_135 P_180 P_225 P_270 P_315 -pan

    T_0 T_45 T_90 T_270 T_315 -tilt

   
)

(:init

    (base-location BASE P1010)
    (mode LEADER N0)
    (mode FOLLOWER N0)
    (vehicle-at LEADER P0000)
    (vehicle-at FOLLOWER P0000)
    (orientated C1 P_45 T_90)
    (orientated C2 P_45 T_90)

    (= (time-send) 4)
    (= (battery-send) 2)
    (= (time-picture) 8)
    (= (battery-picture) 6)
    (= (time-dock) 12)
    (= (battery-dock) 2)
    (= (time-orientation) 3)
    (= (battery-orientation) 3)
    (= (battery-change-navigation) 1)
    (= (time-change-navigation) 1)
    (= (speed LEADER N0) 5)
    (= (speed FOLLOWER N0) 5)
    (= (capacity-now LEADER) 100)
    (= (capacity-now FOLLOWER) 100)
    (= (battery-charge LEADER) 5)
    (= (battery-charge FOLLOWER) 10)
    (= (capacity-max LEADER) 100)
    (= (capacity-max FOLLOWER) 100)
    (=(battery-total) 0)
    (=(distance-total) 0)
    (=(distance P0509  P0000) 10)
    (=(distance P0000  P0509) 10)
    (=(distance P0509  P1613) 25)
    (=(distance P1613  P0509) 25)
    (=(distance P0509  P1010) 12)
    (=(distance P1010  P0509) 12)
    (=(distance P1613  P1010) 8)
    (=(distance P1010  P1613) 8)
    (=(distance P1613  P0000) 17)
    (=(distance P0000  P1613) 17)
    (=(distance P1010  P0000) 20)
    (=(distance P0000  P1010) 20)


)
    (:goal (and
        (picture P0509 P_0 T_0)
        (picture P1613 P_0 T_0)
        (send P0509 P_0 T_0)
        )
    )

    ;(:constraints (and
    ;      (preference UAV_OUT_BASE (forall (?UAV - UAV) (always (not(in-base ?UAV BASE)))))
    ;   (preference UGV_OUT_BASE (forall (?UGV - UGV) (sometime (in-base ?UGV BASE)))))
    ;)

    (:metric minimize (battery-total))
)
