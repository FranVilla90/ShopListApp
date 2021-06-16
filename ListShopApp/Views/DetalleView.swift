//
//  DetalleView.swift
//  ListShopApp
//
//  Created by Francisco José Villa on 16/04/2020.
//  Copyright © 2020 Francisco José Villa. All rights reserved.
//

import SwiftUI

struct DetalleView: View {
    
    var item:ListaCompra
    @Environment(\.managedObjectContext) var contexto
    @Environment(\.presentationMode) var atras
    
    
    var body: some View {
        VStack {
            
            productoView(productoName: "Producto", productoValue: self.item.producto)
                .font(.system(.title, design: .rounded))
            productoView(productoName: "Marca", productoValue: self.item.marca)
                .font(.system(.headline , design: .rounded))
            productoView(productoName: "Cantidad", productoValue: self.item.cantidad)
                .font(.system(.headline, design: .rounded))
            productoView(productoName: "Descripción", productoValue: self.item.descripcion)
                .font(.system(.body, design: .rounded))
            Spacer ()
            
            HStack{
                Button(action: {
                    if self.item.check == false {
                        self.item.check = true
                        //Modificar en Core Data
                        do {
                            try self.contexto.save()
                            self.atras.wrappedValue.dismiss()
                            print ("Comprado correctamente")
                        } catch let error as NSError {
                            print ("Error al editar", error.localizedDescription)
                        }
                        
                    } else {
                        self.item.check = false
                        //Modificar en Core Data
                        self.item.check = self.item.check
                        do {
                            try self.contexto.save()
                            self.atras.wrappedValue.dismiss()
                            print ("Devuelto correctamente")
                            
                        } catch let error as NSError {
                            print ("Error al editar", error.localizedDescription)
                        }
                    }
                    
                }) {
                    
                    HStack {
                        if self.item.check == false {
                            HStack{
                                Image (systemName: "cart.fill")
                                    .font(.system(.title, design: .rounded))
                                    
                                    .foregroundColor(.white)
                                    .padding()
                                Text ("Comprar")
                                    .font(.system(.headline, design: .rounded))
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding(.all)
                            
                            }
                        } else {
                            Image (systemName: "cart.fill")
                                .font(.system(.title, design: .rounded))
                                .foregroundColor(.white)
                                .padding()
                            Text ("En el carrito")
                                .font(.system(.headline, design: .rounded))
                                .bold()
                                .foregroundColor(.white)
                                .padding(.all)
                        }
                    }.background(Color.blue)
                    .cornerRadius(10)
                        .padding(.all)
                    .fixedSize()
                    
                    
                }
                
                NavigationLink (destination: EditarView(item:self.item)) {
                    HStack{
                        Image(systemName: "pencil")
                            .font(.system(.title, design: .rounded))
                            .foregroundColor(.white)
                            .padding(10)
                        Text ("Editar")
                            .font(.system(.body, design: .rounded))
                            .bold()
                            .foregroundColor(.white)
                            .padding(.all)
                    }.background(Color.red)
                    .cornerRadius(10)
                        .padding(.all)
                    .fixedSize()
                    
                    
                    
                }
            } //Termina el HStack
        }
    }
}

struct DetalleView_Previews: PreviewProvider {
    static var previews: some View {
        DetalleView(item: ListaCompra())
    }
}


struct productoView : View {
    var productoName = ""
    var productoValue: String
    var body: some View {
        VStack{
            Text("\(productoName): \(productoValue)")
                .padding(.horizontal)
            
            Divider()
                .frame(height: 1)
                .background(Color.gray)
                .padding(.horizontal)
        }
    }
}


