//
//  Statua.swift
//  Museo
//
//  Created by partecipante on 22/01/2020.
//  Copyright © 2020 DXC. All rights reserved.
//

import Foundation

class Statua: Opera {
    
    let altezza: String
    let materiale: String
    
    init(codice: String, titolo: String, autore: String, esposto: Bool, immagine: String, altezza: String, materiale: String) {
        self.altezza = altezza
        self.materiale = materiale
        super.init(codice: codice, titolo: titolo, autore: autore, esposto: esposto, immagine: immagine)
    }
}
