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

struct Navegacao {
    
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
    
    private var AlAberto: Album?
    var AlbumAberto: Album? {
        set{
            selectedTab = .album
            AlAberto = newValue
        }
        get{
            return AlAberto
        }
    }
    
    
    private var PXSalvando : PixelArt?
    var salvandoEmAlbum: PixelArt? {
        set{
            selectedTab = .album
            PXSalvando = newValue
        }
        get{
            return PXSalvando
        }
    }
    
    var criandoAlbum : Bool = false
    var nomeAlbum : String = ""
    
}

class PixelArtViewModel : ObservableObject {
    
    @Published var nav = Navegacao()
    
    func fetch() {
        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
            return
        }
        
        let enumerator = FileManager.default.enumerator(atPath: directory.path!)
        
        while let filename = enumerator?.nextObject() as? String {
            if filename.hasPrefix("draw") && filename.hasSuffix(".png") {
                print(filename)
            }
        }
    }
    
    //MARK: Intents
    
    func createFakeData(){
//        let album = Album(name: "Paisagens")
//        nav.albuns.append(album)
//        let pixelart = PixelArt(name: "Desenho")
//        nav.pixelArts.append(pixelart)
//        var pixelart2 = PixelArt(name: "Paisagem")
//        pixelart2.album = album.id
//        nav.pixelArts.append(pixelart2)
//        let pixelart3 = PixelArt(name: "Teste")
//        nav.pixelArts.append(pixelart3)
        fetch()
    }
    
    func exitAlbum() {
        nav.AlbumAberto = nil
    }
    
    func saveOrRemoveFromAlbum(pixelArt: PixelArt) {
        if nav.tabSelecionada == .home {
            
            if pixelArt.album == nil{
                //Caso esteja na home e a PX n tenha um álbum, leva pra tela de escolha do álbum
                nav.salvandoEmAlbum = pixelArt
                
            } else {
                
                //Caso esteja na home e a PX já tenha um álbum, leva até esse álbum
                guard let index = nav.albuns.firstIndex(where: { $0.id == pixelArt.album }) else { return }
                nav.AlbumAberto = nav.albuns[index]
            }
            
        } else {
            
            // Senão, remove o álbum da pixelArt selecionada
            guard let index = nav.pixelArts.firstIndex(matching: pixelArt) else { return }
            nav.pixelArts[index].album = nil
        }
    }
    
    func newAlbum() -> Void {
        if nav.nomeAlbum != "" {
            let al = Album(name: nav.nomeAlbum)
            
            guard let index = nav.pixelArts.firstIndex(matching: nav.salvandoEmAlbum!) else { return }
            nav.pixelArts[index].album = al.id
            
            nav.albuns.append(al)
            
            nav.AlbumAberto = al
            nav.salvandoEmAlbum = nil
            nav.criandoAlbum = false
        }
    }
    
    func touchAlbum(album: Album) {
        if nav.salvandoEmAlbum != nil {
            guard let index = nav.pixelArts.firstIndex(matching: nav.salvandoEmAlbum!) else { return }
            nav.pixelArts[index].album = album.id
        }
        nav.salvandoEmAlbum = nil
        nav.criandoAlbum = false
        nav.AlbumAberto = album
    }
    
    func DeleteAlbum(album : Album) {
        guard let index = nav.albuns.firstIndex(matching: album) else { return }
        
        let PXs = nav.pixelArts.filter {$0.album == album.id}
        
        for px in PXs {
//            guard let i = nav.pixelArts.firstIndex(matching: px) else { return }
//            nav.pixelArts[i].album = nil
            saveOrRemoveFromAlbum(pixelArt: px)
        }
        
        nav.albuns.remove(at: index)
    }
}
