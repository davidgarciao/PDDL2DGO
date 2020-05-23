(define (domain DominioRepartidor)
(:requirements :typing :durative-actions :fluents :strips)
(:types repartidor ciudad paquete mercancia)

(:predicates (repartidor-at ?r -repartidor ?c -ciudad)
	     (paquete-at ?r -repartidor ?p -paquete)
	     (mercancia-at ?r -repartidor ?m -mercancia) 
             (entregar-paquete ?c -ciudad ?p -paquete)
	     (descargar-mercancia ?c -ciudad ?m -mercancia)
	     (disponible ?r -repartidor))

(:functions (cansancio-acumulado ?r -repartidor)
	    (cansancio-dia ?r -repartidor)
	    (cansancio-noche ?r -repartidor)
	    (cansancio-paquete ?r -repartidor)
	    (cansancio-mercancia ?r -repartidor)
	    (recuperacion ?r -repartidor)
	    (conducir-dia ?r -repartidor)
	    (conducir-noche ?r -repartidor)
	    (distancia ?from ?to -ciudad))



(:durative-action descansar
	:parameters (?r -repartidor ?c -ciudad)
	:duration (= ?duration 60)
	:condition (and (at start (<= (cansancio-acumulado ?r) 0))
		   	(over all (repartidor-at ?r ?c)))
	:effect (at end (increase (cansancio-acumulado ?r) (* ?duration (recuperacion ?r))))
)


(:durative-action conduce-dia
	:parameters (?r -repartidor ?from ?to -ciudad)
	:duration (= ?duration (/ (distancia ?from ?to) (conducir-dia ?r)))
	:condition (and (at start (repartidor-at ?r ?from))
			(at start (disponible ?r))
			(at start (>= (cansancio-acumulado ?r) (* (/ (distancia ?from ?to) (conducir-dia ?r)) (cansancio-dia ?r)))))
	:effect (and (at start (not (repartidor-at ?r ?from)))
		     (at start (decrease (cansancio-acumulado ?r) (* ?duration (cansancio-dia ?r))))
		     (at end (repartidor-at ?r ?to)))
)


(:durative-action conduce-noche
	:parameters (?r -repartidor ?from ?to -ciudad)
	:duration (= ?duration (/ (distancia ?from ?to) (conducir-noche ?r)))
	:condition (and (at start (repartidor-at ?r ?from))
			(at start (disponible ?r))
			(at start (>= (cansancio-acumulado ?r) (* (/ (distancia ?from ?to) (conducir-noche ?r)) (cansancio-noche ?r)))))
	:effect (and (at start (not (repartidor-at ?r ?from)))
		     (at start (decrease (cansancio-acumulado ?r) (* ?duration (cansancio-noche ?r))))
		     (at end (repartidor-at ?r ?to)))
)


(:durative-action entrega-paquete
	:parameters (?r -repartidor ?c -ciudad ?p -paquete)
	:duration (= ?duration 5)
	:condition (and (at start (disponible ?r))
			(at start (paquete-at ?r ?p)) 
			(at start (>= (cansancio-acumulado ?r) (* (cansancio-paquete ?r) 5)))
			(over all (repartidor-at ?r ?c)))
	:effect (and (at start (not (disponible ?r)))
		     (at start (not (paquete-at ?r ?p)))
		     (at start (decrease (cansancio-acumulado ?r) (* (cansancio-paquete ?r) 5)))
		     (at end (entregar-paquete ?c ?p))
		     (at end (disponible ?r)))
)


(:durative-action descarga-mercancia
	:parameters (?r -repartidor ?c -ciudad ?m -mercancia)
	:duration (= ?duration 10)
	:condition (and (at start (disponible ?r))
			(at start (mercancia-at ?r ?m))
			(at start (>= (cansancio-acumulado ?r) (* (cansancio-mercancia ?r) 10)))
			(over all (repartidor-at ?r ?c)))
	:effect (and (at start (not (disponible ?r)))
		     (at start (not (mercancia-at ?r ?m)))
		     (at start (decrease (cansancio-acumulado ?r) (* (cansancio-mercancia ?r) 10)))
		     (at end (descargar-mercancia ?c ?m))
		     (at end (disponible ?r)))
)

)

