(define (problem ProblemaRepartidor1)
    (:domain DominioRepartidor)
    (:objects repartidor - repartidor
              almacen ciudad1 ciudad2 ciudad3 ciudad4 ciudad5 - ciudad
	      mercancia1 mercancia2 -mercancia
	      paquete1 paquete2 -paquete)
              
    (:init 
            (repartidor-at repartidor almacen)
            (disponible repartidor)
	    (mercancia-at repartidor mercancia1) 
	    (mercancia-at repartidor mercancia2) 
	    (paquete-at repartidor paquete1) 
	    (paquete-at repartidor paquete2)
            
            (= (cansancio-acumulado repartidor) 7200)
            (= (cansancio-dia repartidor) 1)
            (= (cansancio-noche repartidor) 1.5)
	    (= (cansancio-paquete repartidor) 10)
	    (= (cansancio-mercancia repartidor) 30)
            (= (conducir-dia repartidor) 33)
            (= (conducir-noche repartidor) 27)   
            (= (recuperacion repartidor) 120)
            (= (distancia almacen ciudad1) 20000)
            (= (distancia almacen ciudad2) 40000)
	    (= (distancia almacen ciudad3) 50000)
	    (= (distancia almacen ciudad4) 70000)
	    (= (distancia almacen ciudad5) 90000)
            (= (distancia ciudad1 ciudad2) 20000)
            (= (distancia ciudad1 ciudad3) 30000)
            (= (distancia ciudad1 ciudad4) 50000)
	    (= (distancia ciudad1 ciudad5) 70000)
	    (= (distancia ciudad2 ciudad3) 10000)
	    (= (distancia ciudad2 ciudad4) 30000)
	    (= (distancia ciudad2 ciudad5) 50000)
	    (= (distancia ciudad3 ciudad4) 20000)
	    (= (distancia ciudad3 ciudad5) 40000)
	    (= (distancia ciudad4 ciudad5) 20000))
	
            
            
    (:goal (and 
        (repartidor-at repartidor ciudad5)
        (entregar-paquete ciudad2 paquete1)
	(entregar-paquete ciudad4 paquete2)
        (descargar-mercancia ciudad3 mercancia1)
	(descargar-mercancia ciudad1 mercancia2)
        ))

    (:metric minimize (total-time))
        
)          
            
            
            
            
            
            
