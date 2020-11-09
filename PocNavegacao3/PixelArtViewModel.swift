//
//  PixelArtViewModel.swift
//  PocNavegacao3
//
//  Created by Lucas Claro on 04/11/20.
//

import SwiftUI

public enum Tab: Hashable{
    case home, album
}

struct navegacao {
    
    var pixelArts = [PixelArt]()
    
    var albuns = [Album]()
    
    private var selectedTab: Tab = .home
    var tabSelecionada: Tab {
        get {
            return selectedTab
        }
        set {
            PXSalvando = nil
            AlbumAberto = nil
            selectedTab = newValue
        }
    }
    
    
    var AlbumAberto: Album?
    
    
    private var PXSalvando : String?
    var salvandoEmAlbum: String? {
        set{
            selectedTab = .album
            PXSalvando = newValue
        }
        get{
            return PXSalvando
        }
    }
    
}

class PixelArtViewModel : ObservableObject {
    
    @Published var nav = navegacao()
    
    
    //MARK: Intents
    
    func createFakeData(){
        let album = Album(name: "Paisagens")
        nav.albuns.append(album)
        let pixelart = PixelArt(name: "Desenho")
        nav.pixelArts.append(pixelart)
        var pixelart2 = PixelArt(name: "Paisagem")
        pixelart2.album = album.id
        nav.pixelArts.append(pixelart2)
        let pixelart3 = PixelArt(name: "Teste")
        nav.pixelArts.append(pixelart3)
    }
    
}
