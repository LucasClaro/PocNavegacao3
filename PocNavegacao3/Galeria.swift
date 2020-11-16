//
//  Galeria.swift
//  PocNavegacao3
//
//  Created by Lucas Claro on 06/11/20.
//

import SwiftUI

struct Galeria: View {
    
    @EnvironmentObject var pixelArtViewModel : PixelArtViewModel
    
    @State var alertTemp : Bool = false
    @State var alertText : String = ""
    
    var body: some View {
        
        if pixelArtViewModel.nav.AlbumAberto != nil {
            AlbumAberto()
        } else {
            
            VStack{
                
                if (pixelArtViewModel.nav.salvandoEmAlbum != nil) {
                    HStack{
                        Image("teste")
                            .resizable()
                            .frame(width: 60, height: 60, alignment:  .center)
                        Text("Escolha um álbum para \(pixelArtViewModel.nav.salvandoEmAlbum!.name)").font(.callout)
                    }
                    .padding(.top)
                    
                    
                    Divider()
                }
                
                //            let data = (1...9).map { "Álbum \($0)" }
                
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
                                .onTapGesture {
                                    pixelArtViewModel.nav.criandoAlbum = true
                                }
                            .alert(isPresented: $pixelArtViewModel.nav.criandoAlbum) { () -> Alert in
                                Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))

                            }
                                
                            
                        }
                        
                        ForEach(pixelArtViewModel.nav.albuns) { item in
                            
                            VStack(alignment: .leading) {
                                Image("teste")
                                Text(item.name)
                                
                            }
                            .onTapGesture {
                                pixelArtViewModel.touchAlbum(album: item)
                            }
                            .padding()
                            
                        }
                        
                    }
                }
            }
        }//Else
        
        
        
    }
    
    func AlbumAberto() -> some View{
        let columns = [
            GridItem(.flexible(minimum: 40), spacing: 0),
            GridItem(.flexible(minimum: 40), spacing: 0),
            GridItem(.flexible(minimum: 40))
        ]
        
        let data = pixelArtViewModel.nav.pixelArts.filter { item in
            return item.album == pixelArtViewModel.nav.AlbumAberto!.id
        }
        
        return ScrollView{
            LazyVGrid(columns: columns, spacing: 0) {
                
                ForEach(data) { item in
                    Image("teste").resizable()
                        .aspectRatio(1, contentMode: .fill)
                        .contextMenu{
                            ContMenu(pixelArt: item)
                        }
                }
                
            }
        }
    }// func AlbumAberto
    
}

struct Galeria_Previews: PreviewProvider {
    static var previews: some View {
        Galeria()
    }
}
