//
//  ViewController.swift
//  Museo
//
//  Created by partecipante on 22/01/2020.
//  Copyright © 2020 DXC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var museo: [Opera] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    // Parte del delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let delegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate // as mi fa la conversione (! conversione unwrapped)
        museo = delegate.museo
    }

    // Parte del datasource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Scoda la cella se già esiste, sennò inizializza una nuova cella
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as? TableViewCell
        
        cell?.titolo.text = museo[indexPath.row].titolo
        cell?.autore.text = museo[indexPath.row].autore
        cell?.extra.text = museo[indexPath.row].codice
        cell?.immagine.image = UIImage(named: museo[indexPath.row].immagine)
        
        return cell!
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return museo.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("burp")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Prepara la schermata successiva
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dettaglioOperaSegue" {
            let indice = (tableView.indexPathForSelectedRow?.row)!
            let opera = museo[indice]
            
            if let detailView = segue.destination as? DetailViewController {
                detailView.opera = opera
            }
        }
    }
}

