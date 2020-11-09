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
                .navigationBarTitle("Teste")
                .navigationBarItems(trailing:
                    Button(action:  {
                        print("oi")
                    }) {
                        Image(systemName: "plus")
                    }
                )
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Galeria()
    }
}

