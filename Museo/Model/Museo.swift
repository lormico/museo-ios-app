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
    
    func moveOperaToSala(_ i: Int) throws {
        if self.sala.count >= self.maxDimensioneSala {
            throw NSError(domain: "", code: 0, userInfo: [:])
        }
        let opera = getOperaDeposito(i)
        opera.esposto = true
        self.sala.append(opera)
        self.deposito.remove(at: i)
    }
    
    func moveOperaToDeposito(_ i: Int) {
        let opera = getOperaSala(i)
        opera.esposto = false
        self.deposito.append(opera)
        self.sala.remove(at: i)
    }
    
}
