//
//  Provider.swift
//  Museo
//
//  Created by partecipante on 23/01/2020.
//  Copyright © 2020 DXC. All rights reserved.
//

import Foundation

class Provider {
    
    var museo: Museo
    
    static let shared = Provider() // Fa in modo che sia Singleton
    
    private init() {
        museo = Museo(nomeMuseo: "Van Goghenheim", dimensioneSala: 10)
        let daoMuseo = DAOMuseo()
        museo.setDeposito(listaOpere: daoMuseo.caricaJson())
    }
    
}
