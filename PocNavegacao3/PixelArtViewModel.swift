//
//  PixelArtViewModel.swift
//  PocNavegacao3
//
//  Created by Lucas Claro on 04/11/20.
//

import SwiftUI

struct navegacao {
    var pixelArts = [PixelArt]()
    
    var salvandoEmAlbum: Bool = false
}

class PixelArtViewModel : ObservableObject {
    
    @Published private var nav = navegacao()
    
}
