//
//  ContextMenu.swift
//  PocNavegacao3
//
//  Created by Lucas Claro on 10/11/20.
//

import SwiftUI

struct ContMenu: View {
    
    @EnvironmentObject var pixelArtViewModel : PixelArtViewModel
    var texto: String
    
    var body: some View {
        Group{
            
            Text(texto)
            
            Button(action: {}) {
                HStack{
                    Text("Remover do Álbum")
                    Spacer()
                    Image(systemName: "clear")
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
}

struct ContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContMenu()
    }
}
