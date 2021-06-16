//
//  ListaCompra.swift
//  ListShopApp
//
//  Created by Francisco José Villa on 16/04/2020.
//  Copyright © 2020 Francisco José Villa. All rights reserved.
//

import Foundation
import CoreData

class ListaCompra : NSManagedObject, Identifiable {
    
    @NSManaged public var producto : String
    @NSManaged public var descripcion : String
    @NSManaged public var marca : String
    @NSManaged public var cantidad : String
    @NSManaged public var check : Bool
    
}

extension ListaCompra {
    static func mostrarContactos () -> NSFetchRequest <ListaCompra> {
        //Petición
        let request: NSFetchRequest <ListaCompra> = ListaCompra.fetchRequest() as! NSFetchRequest<ListaCompra>
        //Ordenación
        request.sortDescriptors = [NSSortDescriptor(key: "producto", ascending: true)] // Ordenacion por producto -> [NSSortDescriptor(key: "producto", 
        //Retorno
        return request
    }
}


