(define (problem ProblemaRepartidor1)
    (:domain DominioRepartidor)
    (:objects repartidor1 repartidor2 - repartidor
              almacen ciudad1 ciudad2 ciudad3 ciudad4 ciudad5 almacen-destino - ciudad
	      mercancia1 mercancia2 mercancia3 -mercancia
	      paquete1 paquete2 paquete3 -paquete)
              
    (:init 
            (repartidor-at repartidor1 almacen)
	    (repartidor-at repartidor2 almacen)
            (disponible repartidor1)
	    (disponible repartidor2)
	    (mercancia-at repartidor1 mercancia1) 
	    (mercancia-at repartidor1 mercancia2)
	    (mercancia-at repartidor2 mercancia3) 
	    (paquete-at repartidor2 paquete1) 
	    (paquete-at repartidor2 paquete2)
	    (paquete-at repartidor1 paquete3)
            
            (= (cansancio-acumulado repartidor1) 7200)
            (= (cansancio-dia repartidor1) 1)
            (= (cansancio-noche repartidor1) 1.5)
	    (= (cansancio-paquete repartidor1) 10)
	    (= (cansancio-mercancia repartidor1) 30)
            (= (conducir-dia repartidor1) 33)
            (= (conducir-noche repartidor1) 27)   
            (= (recuperacion repartidor1) 120)

		
 	    (= (cansancio-acumulado repartidor2) 7200)
            (= (cansancio-dia repartidor2) 1)
            (= (cansancio-noche repartidor2) 1.5)
	    (= (cansancio-paquete repartidor2) 10)
	    (= (cansancio-mercancia repartidor2) 30)
            (= (conducir-dia repartidor2) 33)
            (= (conducir-noche repartidor2) 27)   
            (= (recuperacion repartidor2) 120)


            (= (distancia almacen ciudad1) 20000)
            (= (distancia almacen ciudad2) 40000)
	    (= (distancia almacen ciudad3) 50000)
	    (= (distancia almacen ciudad4) 70000)
	    (= (distancia almacen ciudad5) 90000)
	    (= (distancia almacen almacen-destino) 120000)
            (= (distancia ciudad1 ciudad2) 20000)
            (= (distancia ciudad1 ciudad3) 30000)
            (= (distancia ciudad1 ciudad4) 50000)
	    (= (distancia ciudad1 ciudad5) 70000)
	    (= (distancia ciudad1 almacen-destino) 100000)
	    (= (distancia ciudad2 ciudad3) 10000)
	    (= (distancia ciudad2 ciudad4) 30000)
	    (= (distancia ciudad2 ciudad5) 50000)
	    (= (distancia ciudad2 almacen-destino) 80000)
	    (= (distancia ciudad3 ciudad4) 20000)
	    (= (distancia ciudad3 ciudad5) 40000)
	    (= (distancia ciudad3 almacen-destino) 70000)
	    (= (distancia ciudad4 ciudad5) 20000)
	    (= (distancia ciudad4 almacen-destino) 50000)
	    (= (distancia ciudad5 almacen-destino) 30000))
	
            
            
    (:goal (and 
        (repartidor-at repartidor1 almacen-destino)
	(repartidor-at repartidor2 almacen-destino)
        (entregar-paquete ciudad2 paquete1)
	(entregar-paquete ciudad4 paquete2)
	(entregar-paquete almacen-destino paquete3)
        (descargar-mercancia ciudad3 mercancia1)
	(descargar-mercancia ciudad1 mercancia2)
	(descargar-mercancia ciudad2 mercancia3)
        ))

    (:metric minimize (total-time))
        
)          
            
            
            
            
            
            
