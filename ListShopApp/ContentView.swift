//
//  ContentView.swift
//  ListShopApp
//
//  Created by Francisco José Villa on 16/04/2020.
//  Copyright © 2020 Francisco José Villa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var contexto
    @FetchRequest(fetchRequest: ListaCompra.mostrarContactos()) var listaCompra:FetchedResults<ListaCompra>
    
    
    var body: some View {
        NavigationView{
            VStack {
                List{
                    ForEach (self.listaCompra) {item in
                        NavigationLink(destination: DetalleView(item: item)){
                            CeldaView (cantidad: item.cantidad, producto: item.producto, marca: item.marca, check: item.check)
                        }
                    }
                    .onDelete {(IndexSet) in
                        let borrarContacto = self.listaCompra [IndexSet.first!]
                        self.contexto.delete(borrarContacto)
                        do{
                            try self.contexto.save()
                        }catch let error as NSError {
                            print ("No se borro", error.localizedDescription)
                        }
                    }
                    
                    
                }
                
            }
                
            .navigationBarTitle("Lista de la compra")
            .navigationBarItems(leading: EditButton ()                    , trailing:  VStack{
                NavigationLink(destination: AgregaProductoView()){
                    Image(systemName: "plus.app.fill")
                        .foregroundColor(.purple)
                        .font (.system(.title, design: .rounded))
                    
                    //EditButton()
                    
                }
            } )
            
        } //Termina el navegation
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
