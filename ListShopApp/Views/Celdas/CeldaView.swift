//
//  CeldaView.swift
//  ListShopApp
//
//  Created by Francisco José Villa on 16/04/2020.
//  Copyright © 2020 Francisco José Villa. All rights reserved.
//

import SwiftUI

struct CeldaView: View {
    
    
    @Environment(\.managedObjectContext) var contexto
    @Environment(\.presentationMode) var atras
    
    var cantidad: String
    var producto: String
    var marca: String
    var check: Bool 
    
    var body: some View {
            HStack {
                Text (self.cantidad)
                    .padding(15)
                    .background(Color.purple)
                    .clipShape(Circle())
                    .foregroundColor(.white)
                    .font(.headline)
                VStack{
                    VStack{
                        if check == false {
                        Text (self.producto)
                            .font(.system(.title, design: .rounded))
                            .bold()
                        Text (self.marca)
                            .font (.system(.headline, design: .rounded))
                            
                        }else {
                            Text (self.producto)
                                .font(.system(.title, design: .rounded))
                            .strikethrough(true, color: .red)
                            Text (self.marca)
                                .font (.system(.headline, design: .rounded))
                                .strikethrough(true, color: .red)
                        }
                    }
                }
                HStack{
                    
                    if check == false {
                        Image(systemName: "cart.fill")
                            .font(.title)
                            .hidden()
                            .foregroundColor(.white)
                    } else {
                        Image (systemName: "cart.fill")
                            .font(.title)
                            .foregroundColor(.blue)
                            .padding(25)
                    }
                    
                }
            }
        }
}

struct CeldaView_Previews: PreviewProvider {
    static var previews: some View {
        CeldaView(cantidad: "", producto: "", marca: "", check: false)
    }
}

