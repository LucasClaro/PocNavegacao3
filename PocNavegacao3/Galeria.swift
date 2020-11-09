//
//  Galeria.swift
//  PocNavegacao3
//
//  Created by Lucas Claro on 06/11/20.
//

import SwiftUI

struct Galeria: View {
    
    @EnvironmentObject var pixelArtViewModel : PixelArtViewModel
    
    var body: some View {
        
        VStack{
            
            if (pixelArtViewModel.nav.salvandoEmAlbum != nil) {
                HStack{
                    Image("teste")
                        .resizable()
                        .frame(width: 60, height: 60, alignment:  .center)
                    Text("Escolha um álbum para \(pixelArtViewModel.nav.salvandoEmAlbum!)").font(.callout)
                }
                .padding(.top)
                
                Divider()
            }
            
            let data = (1...9).map { "Álbum \($0)" }
            
            let columns = [
                GridItem(.flexible(minimum: 40), spacing: 0),
                GridItem(.flexible(minimum: 40))
            ]
            
            ScrollView{
                LazyVGrid(columns: columns, spacing: 0) {
                    
                    if (pixelArtViewModel.nav.salvandoEmAlbum != nil) {
                        VStack(alignment: .leading) {
                            Image("teste")
                            Text("Novo Álbum")
                                
                        }
                            .padding()
                    }
                    
                    ForEach(data, id: \.self) { item in
                        
                        VStack(alignment: .leading) {
                            Image("teste")
                            Text(item)
                                
                        }
                            .padding()
                        
                    }
                    
                }
            }
        }
        
    }
}

struct Galeria_Previews: PreviewProvider {
    static var previews: some View {
        Galeria()
    }
}
