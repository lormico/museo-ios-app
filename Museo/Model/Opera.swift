//
//  Opera.swift
//  Museo
//
//  Created by partecipante on 22/01/2020.
//  Copyright © 2020 DXC. All rights reserved.
//

import Foundation

class Opera {
    
    let codice: String
    let titolo: String
    let autore: String
    var esposto: Bool
    
    init(codice: String, titolo: String, autore: String, esposto: Bool) {
        self.codice = codice
        self.titolo = titolo
        self.autore = autore
        self.esposto = esposto
    }
    
}
