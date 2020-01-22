//
//  AppDelegate.swift
//  Museo
//
//  Created by partecipante on 22/01/2020.
//  Copyright © 2020 DXC. All rights reserved.
//

// Rappresenta il contesto applicativo = può essere vista da tutte le altre classi

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var museo: [Opera] = []

    private func leggiJson() {
        // Uso Bundle per i percorsi
        do {
            if let file = Bundle.main.url(forResource: "gallery", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                
                // invece di fare tanti if let... else { gestisci se è andato male }, uso guard
                guard let data_list = json as? NSArray else { return }
                
                for i in 0..<data_list.count {
                    guard let opera_obj = data_list[i] as? NSDictionary else { continue }

                    guard let codice = opera_obj["codice"] as? String else { continue }
                    guard let titolo = opera_obj["titolo"] as? String else { continue }
                    guard let autore = opera_obj["autore"] as? String else { continue }
                    guard let immagine = opera_obj["immagine"] as? String else { continue }
                    
                    let opera: Opera
                    guard let tipo_opera = opera_obj["tipo"] as? String else { continue }
                    if tipo_opera == "quadro" {
                        guard let tecnica = opera_obj["tecnica"] as? String else { continue }
                        opera = Quadro(codice: codice, titolo: titolo, autore: autore, esposto: true, immagine: immagine, tecnica: tecnica)
                        museo.append(opera)
                    } else if tipo_opera == "statua" {
                        guard let materiale = opera_obj["materiale"] as? String else { continue }
                        opera = Statua(codice: codice, titolo: titolo, autore: autore, esposto: true, immagine: immagine, altezza: "TBD", materiale: materiale)
                        museo.append(opera)
                    }

                }
            } else {
                print("ERRORONE! File inesistente")
            }
        } catch {
            print("ECCEZIONE!")
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        leggiJson()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

