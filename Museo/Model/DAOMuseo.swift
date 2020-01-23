//
//  DAOMuseo.swift
//  Museo
//
//  Created by partecipante on 23/01/2020.
//  Copyright © 2020 DXC. All rights reserved.
//

import Foundation

class DAOMuseo {
    
    func caricaJson() -> [Opera] {
        
        var listaOpere: [Opera] = []
        
        do {
            // Uso Bundle per i percorsi
            if let file = Bundle.main.url(forResource: "gallery", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                
                // invece di fare tanti if let... else { gestisci se è andato male }, uso guard
                guard let data_list = json as? NSArray else { return [] }
                
                for i in 0..<data_list.count {
                    guard let opera_obj = data_list[i] as? NSDictionary else { continue }
                    
                    guard let codice = opera_obj["codice"] as? String else { continue }
                    guard let titolo = opera_obj["titolo"] as? String else { continue }
                    guard let autore = opera_obj["autore"] as? String else { continue }
                    guard let immagine = opera_obj["immagine"] as? String else { continue }
                    guard let dimensioni = opera_obj["dimensioni"] as? String else { continue }
                    
                    let opera: Opera
                    guard let tipo_opera = opera_obj["tipo"] as? String else { continue }
                    if tipo_opera == "quadro" {
                        guard let tecnica = opera_obj["tecnica"] as? String else { continue }
                        opera = Quadro(codice: codice, titolo: titolo, autore: autore, esposto: false, immagine: immagine, dimensioni: dimensioni, tecnica: tecnica)
                        listaOpere.append(opera)
                    } else if tipo_opera == "statua" {
                        guard let materiale = opera_obj["materiale"] as? String else { continue }
                        opera = Statua(codice: codice, titolo: titolo, autore: autore, esposto: false, immagine: immagine, dimensioni: dimensioni, materiale: materiale)
                        listaOpere.append(opera)
                    }
                    
                }
                
            } else {
                print("ERRORE! File inesistente")
            }
        } catch {
            print("ECCEZIONE!")
        }
        
        return listaOpere

    }
    
}
