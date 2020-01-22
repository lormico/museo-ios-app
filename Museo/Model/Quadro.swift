//
//  Quadro.swift
//  Museo
//
//  Created by partecipante on 22/01/2020.
//  Copyright © 2020 DXC. All rights reserved.
//

import Foundation

class Quadro: Opera {
    
    let tecnica: String
    
    init(codice: String, titolo: String, autore: String, esposto: Bool, tecnica: String) {
        self.tecnica = tecnica
        super.init(codice: codice, titolo: titolo, autore: autore, esposto: esposto)
    }
}
