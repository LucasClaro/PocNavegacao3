//
//  Home.swift
//  PocNavegacao3
//
//  Created by Lucas Claro on 06/11/20.
//

import SwiftUI

struct Home: View {
    
    var body: some View{
        
        VStack{
            
            Button(action: {
                print("Tema")
            }){
                HStack{
                    Text("Ver desafio diário")
                        .padding(.horizontal)
                    
                    Image(systemName: "eye")
                        .padding(.horizontal)
                }
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(40)
            }
                .padding()
            
            let data = (1...25).map { "Item \($0)" }
            
            let columns = [
                GridItem(.flexible(minimum: 40), spacing: 0),
                GridItem(.flexible(minimum: 40), spacing: 0),
                GridItem(.flexible(minimum: 40))
            ]
            
            ScrollView{
                LazyVGrid(columns: columns, spacing: 0) {
                    
                    ForEach(data, id: \.self) { item in
                        Image("teste").resizable()
                            .aspectRatio(1, contentMode: .fill)
                            .contextMenu{
                                contMenu()
                            }
                    }
                    
                }
            }
            
        }
            .tabItem{
                Image(systemName: "house")
            }
        
    } // body
    
    func contMenu() -> some View {
        Group{
            Button(action: {
                
                
                
            }) {
                HStack{
                    Text("Adicionar ao álbum")
                    Spacer()
                    Image(systemName: "folder")
                }
            }
            
            Button(action: {}) {
                HStack{
                    Text("Compartilhar")
                    Spacer()
                    Image(systemName: "square.and.arrow.up")
                }
            }
            
            Button(action: {}) {
                HStack{
                    Text("Editar")
                    Spacer()
                    Image(systemName: "pencil")
                }
            }
            
            Button(action: {}) {
                HStack{
                    Text("Excluir")
                    Spacer()
                    Image(systemName: "trash")
                }
            }
        }
    }
} // struct

//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//      Home()
//    }
//}
