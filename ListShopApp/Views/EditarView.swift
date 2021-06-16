//
//  EditarView.swift
//  ListShopApp
//
//  Created by Francisco José Villa on 19/04/2020.
//  Copyright © 2020 Francisco José Villa. All rights reserved.
//

import SwiftUI

struct EditarView: View {
    
    
    var item: ListaCompra
    @Environment(\.managedObjectContext) var contexto
    @Environment(\.presentationMode) var atras
    
    @State private var producto = ""
    @State private var marca = ""
    @State private var cantidad = ""
    @State private var descripcion = ""
    @State private var check = false
    
    
    
    var body: some View {
        VStack {
            //Tabla de modifación
            formularioEditadoView(fieldName: "Producto a editar", fieldValue: $producto)
                .onAppear {
                    self.producto = self.item.producto
            }
            formularioEditadoView(fieldName: "Marca a editar", fieldValue: $marca)
                .onAppear {
                    self.marca = self.item.marca
            }
            formularioEditadoView(fieldName: "Cantidad a editar", fieldValue: $cantidad)
                .keyboardType(.numberPad)
                .onAppear {
                    self.cantidad = self.item.cantidad
            }
            formularioEditadoView(fieldName: "Descripción", fieldValue: $descripcion)
                .onAppear {
                    self.descripcion = self.item.descripcion
            }
            //Botón
            Button(action: {
                self.item.producto = self.producto
                self.item.marca = self.marca
                self.item.cantidad = self.cantidad
                self.item.descripcion = self.descripcion
                self.item.check = self.check
                do {
                    
                    try self.contexto.save()
                    print ("Editado correctamente")
                    self.atras.wrappedValue.dismiss()
                } catch let error as NSError {
                    print ("Error al editar", error.localizedDescription)
                }
            }) {
                HStack {
                    Text("Editar producto")
                        .font(.system(.title, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                        .padding(.all)
                }
            }.background(Color.blue)
                .padding(.all)
                .navigationBarTitle("Editar producto")
        }
    }
}

struct EditarView_Previews: PreviewProvider {
    static var previews: some View {
        EditarView(item: ListaCompra())
    }
}


struct formularioEditadoView : View {
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
