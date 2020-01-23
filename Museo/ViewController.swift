//
//  ViewController.swift
//  Museo
//
//  Created by partecipante on 22/01/2020.
//  Copyright © 2020 DXC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var museo: Museo = Provider.shared.museo
    
    @IBOutlet weak var tableView: UITableView!
    
    // Parte del delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // Parte del datasource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Scoda la cella se già esiste, sennò inizializza una nuova cella
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as? TableViewCell
        
        var opera: Opera
        if indexPath.section == 0 {
            opera = museo.getOperaSala(indexPath.row)
        } else {
            opera = museo.getOperaDeposito(indexPath.row)
        }
        
        cell?.titolo.text = opera.titolo
        cell?.autore.text = opera.autore
        cell?.extra.text = opera.codice
        cell?.immagine.image = UIImage(named: opera.immagine)
        
        return cell!
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Sala"
        } else {
            return "Deposito"
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return museo.dimSala()
        } else {
            return museo.dimDeposito()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("burp")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Prepara la schermata successiva
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dettaglioOperaSegue" {
            let indice = (tableView.indexPathForSelectedRow?.row)!
            let sezione = (tableView.indexPathForSelectedRow?.section)!
            
            var opera: Opera
            if sezione == 0 {
                opera = museo.getOperaSala(indice)
            } else {
                opera = museo.getOperaDeposito(indice)
            }
            
            if let detailView = segue.destination as? DetailViewController {
                detailView.opera = opera
            }
        }
    }
}

