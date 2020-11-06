//
//  SwiftUIView.swift
//  PocNavegacao3
//
//  Created by Lucas Claro on 05/11/20.
//

import SwiftUI

struct AddAlbum: View {
    
//    @ObservedObject var addAlbumViewModel : 
    
    var body: some View {
        NavigationView{
        
            VStack{
                
                HStack{
                    Image("teste")
                        .resizable()
                        .frame(width: 60, height: 60, alignment:  .center)
                    Text("Escolha um álbum para [nome]").font(.callout)
                }
                .padding(.top)
                
                Divider()
                
                let data = (1...9).map { "Álbum \($0)" }
                
                let columns = [
                    GridItem(.flexible(minimum: 40), spacing: 0),
                    GridItem(.flexible(minimum: 40))
                ]
                
                ScrollView{
                    LazyVGrid(columns: columns, spacing: 0) {
                        
                        VStack(alignment: .leading) {
                            Image("teste")
                            Text("Novo Álbum")
                                
                        }
                            .padding()
                        
                        ForEach(data, id: \.self) { item in
                            
                            VStack(alignment: .leading) {
                                Image("teste")
                                Text(item)
                                    
                            }
                                .padding()
                            
                        }
                        
                    }
                }
                
            }//Vstack
        
                .navigationBarItems(leading:
                    Button(action: {
                        
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title)
                    }
                )
                .navigationBarTitle("Álbuns")
                .navigationBarTitleDisplayMode(.inline)
                
        }
               
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AddAlbum()
    }
}
