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
    
    private var selectedTab: Tab = .home
    var tabSelecionada: Tab {
        get {
            return selectedTab
        }
        set {
            PXSalvando = nil
            selectedTab = newValue
        }
    }
    
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
    
}
