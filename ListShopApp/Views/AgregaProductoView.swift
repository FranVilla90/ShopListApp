//
//  AgregaProductoView.swift
//  ListShopApp
//
//  Created by Francisco José Villa on 16/04/2020.
//  Copyright © 2020 Francisco José Villa. All rights reserved.
//

import SwiftUI

struct AgregaProductoView: View {
    
    @Environment(\.managedObjectContext) var contexto
    @Environment(\.presentationMode) var atras
    
    @State private var producto = ""
    @State private var marca = ""
    @State private var cantidad = ""
    @State private var descripcion = ""
    @State private var check = false
    
    
    
    var body: some View {
        VStack {
            
            VStack {
                
                formularioView(fieldName: "Producto", fieldValue: $producto)
                
                formularioView(fieldName: "Marca", fieldValue: $marca)
                formularioView(fieldName: "Cantidad", fieldValue: $cantidad)
                    .keyboardType(.numberPad)
                formularioView(fieldName: "Descripción", fieldValue: $descripcion)
                
                Spacer ()
                
            }.padding(.all)
            
            Button(action: {
                
                let nuevoProducto =  ListaCompra(context: self.contexto)
                nuevoProducto.producto = self.producto
                nuevoProducto.marca = self.marca
                nuevoProducto.cantidad = self.cantidad
                nuevoProducto.descripcion = self.descripcion
                nuevoProducto.check = self.check
                
                
                do {
                    
                    try self.contexto.save()
                    print ("Guardado correctamente")
                    self.atras.wrappedValue.dismiss()
                    
                    
                } catch let error as NSError {
                    print ("Error al guardar", error.localizedDescription)
                }
            }) {
                Text("Guardar producto")
                    //Modificadores texto
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    //Modificación del botón
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(15)
                    //Navigation Title
                    .navigationBarTitle("Agregar producto")
                
                
                
            }
        }
    }
    struct AgregaProductoView_Previews: PreviewProvider {
        static var previews: some View {
            AgregaProductoView()
        }
    }
    
    
    struct formularioView : View {
        var fieldName = ""
        @Binding var fieldValue: String
        var body: some View {
            VStack{
                TextField(fieldName, text: $fieldValue)
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .padding(.horizontal)
                
                Divider()
                    .frame(height: 1)
                    .background(Color("lineaTabla"))
                    .padding(.horizontal)
            }
        }
    }
}


