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
    
    @ObservedObject var pixelArtViewModel = PixelArtViewModel()
    
    var body: some View {
    
        NavigationView {
            TabView {
                
                Home()
                Galeria()
                
            }
                .navigationBarTitle("Teste")
                .navigationBarItems(trailing:
                    Button(action:  {
                        print("help")
                    }) {
                        Image(systemName: "plus")
                    }
                )
        }
    
    }
}

struct Galeria : View {
    var body: some View {
        
        let data = (1...9).map { "Álbum \($0)" }
        
        let columns = [
            GridItem(.flexible(minimum: 40), spacing: 0),
            GridItem(.flexible(minimum: 40))
        ]
        
        ScrollView{
            LazyVGrid(columns: columns, spacing: 0) {
                
                ForEach(data, id: \.self) { item in
                    
                    VStack(alignment: .leading) {
                        Image("teste")
                        Text(item)
                            
                    }
                        .padding()
                    
                }
                
            }
        }
            .tabItem{
                Image(systemName: "folder")
            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Galeria()
    }
}

