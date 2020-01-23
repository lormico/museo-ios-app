//
//  Museo.swift
//  Museo
//
//  Created by partecipante on 23/01/2020.
//  Copyright © 2020 DXC. All rights reserved.
//

import Foundation

class Museo {
    
    private var nomeMuseo: String
    private var maxDimensioneSala: Int
    private var sala: [Opera] = []
    private var deposito: [Opera] = []
    
    init(nomeMuseo: String, dimensioneSala: Int) {
        self.nomeMuseo = nomeMuseo
        self.maxDimensioneSala = dimensioneSala
    }
    
    func setDeposito(listaOpere: [Opera]) {
        self.deposito = listaOpere
    }
    
    func dimSala() -> Int {
        return sala.count
    }
    
    func dimDeposito() -> Int {
        return deposito.count
    }
    
    func getOperaSala(_ i: Int) -> Opera {
        return sala[i]
    }
    
    func getOperaDeposito(_ i: Int) -> Opera {
        return deposito[i]
    }
    
    func moveOperaToSala(_ i: Int) {
        self.sala.append(getOperaDeposito(i))
        self.deposito.remove(at: i)
    }
    
    func moveOperaToDeposito(_ i: Int) {
        self.deposito.append(getOperaSala(i))
        self.sala.remove(at: i)
    }
    
}
