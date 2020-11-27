//
//  ContentView.swift
//  PocNavegacao3
//
//  Created by Lucas Claro on 03/11/20.
//

//
//  ContentView.swift
//  PocNavegacao
//
//  Created by Lucas Claro on 03/11/20.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var pixelArtViewModel : PixelArtViewModel
    
    var body: some View {
    
        NavigationView {
            TabView (selection: $pixelArtViewModel.nav.tabSelecionada){
                
                Home()
                    .tabItem{
                        Image(systemName: "house")
                    }
                    .tag(Tab.home)
                Galeria()
                    .tabItem{
                        Image(systemName: "folder")
                    }
                    .tag(Tab.album)
                
            }
                .if(pixelArtViewModel.nav.AlbumAberto != nil) {
                    $0
                        .navigationBarTitle(pixelArtViewModel.nav.AlbumAberto!.name)
                        .navigationBarTitleDisplayMode(.inline)
                        
                        .navigationBarItems(
                            leading:
                                Button(action:  {
                                pixelArtViewModel.exitAlbum()
                            }) {
                                Image(systemName: "chevron.left")
                                    .font(.title)
                            },
                            trailing:
                                AddButton(destination: CustomController().onDisappear(perform: {
                                    pixelArtViewModel.nav.fetch()
                                }))
                        )
                }
                .if(pixelArtViewModel.nav.AlbumAberto == nil) {
                    $0
                        .navigationBarTitle(pixelArtViewModel.nav.tabSelecionada == .home ? "Seus Desenhos" : "Álbuns")
                        .navigationBarTitleDisplayMode(.automatic)
                        .navigationBarItems(trailing:
                            AddButton(destination: CustomController().onDisappear(perform: {
                                pixelArtViewModel.nav.fetch()
                            }))
                        )
                }
        }
    
    }

    
    struct AddButton<Destination : View>: View {
        var destination : Destination
        
        var body: some View {
            NavigationLink(destination: destination) {
                Image(systemName: "plus").font(.title)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Galeria()
    }
}

