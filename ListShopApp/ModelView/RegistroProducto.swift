//
//  RegistroProducto.swift
//  ListShopApp
//
//  Created by Francisco José Villa on 30/04/2020.
//  Copyright © 2020 Francisco José Villa. All rights reserved.
//

import Foundation
import Combine

class RegistrationViewModel: ObservableObject{
    
    //Entrada de datos del usuario
    @Published var producto = ""
    @Published var marca = ""
    @Published var cantidad = ""
    @Published var descripcion = ""
    @Published var check = false
    
    //Valores de validación del formulario
    @Published var productoLengthValid = false
    @Published var marcaLengthValid = false
    @Published var cantidadLengthValid = false
    @Published var descripcionLengthValid = false
    
    private var cancellableObjects: Set<AnyCancellable> = []
    
    
    init(){
        $producto
            .receive(on: RunLoop.main)
            .map{ producto in
                return producto.count >= 1
            }
            .assign(to: \.productoLengthValid, on: self)
            .store(in: &cancellableObjects)
        
        $marca
            .receive(on: RunLoop.main)
            .map{ marca in
                return marca.count >= 1
            }
            .assign(to: \.marcaLengthValid, on: self)
            .store(in: &cancellableObjects)
        
        $cantidad
            .receive(on: RunLoop.main)
            .map{ cantidad in
                return cantidad.count >= 1
            }
            .assign(to: \.cantidadLengthValid, on: self)
            .store(in: &cancellableObjects)
        
        
      

        
    
}
}
