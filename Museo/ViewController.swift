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
        
        // Registro il long press
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressGestureRecognized(gestureRecognizer: )))
        tableView.addGestureRecognizer(longPress)
    }

    @objc func longPressGestureRecognized(gestureRecognizer: UIGestureRecognizer) {
        let optionMenu = UIAlertController(title: nil, message: "Cosa vuoi fare?", preferredStyle: .actionSheet)
        
        // Opzione annulla, è un'entry separata nel menu a popup UIAlertController
        let annullaOpzione = UIAlertAction(title: "Annulla", style: .cancel, handler: nil)
        optionMenu.addAction(annullaOpzione)
        
        // Costruisco l'handler, è una variabile contenente una funzione anonima
        let longPress = gestureRecognizer as! UILongPressGestureRecognizer
        let locationInView = longPress.location(in: tableView)
        let index = tableView.indexPathForRow(at: locationInView)
        let callActionHandler = { (action: UIAlertAction) -> Void in
            print("Selezionato l'elemento \(index!.row)")
            
            var intestazione: String = "Successo"
            var messaggio: String = "Elemento spostato con successo"
            
            if index?.section == 0 {
                self.museo.moveOperaToDeposito(index!.row)
            } else {
                do {
                    try self.museo.moveOperaToSala(index!.row)
                } catch {
                    intestazione = "Errore"
                    messaggio = "Sala piena, opera non spostata"
                }
            }
            
            let alertMessage = UIAlertController(title: intestazione, message: messaggio, preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
            
            self.tableView?.reloadData()
            self.tableView?.reloadSections([0,1], with: .fade) // Non dovrebbe essere necessario, bug del simulatore?
        }
        
        let sezioneString: String
        if index?.section == 0 {
            sezioneString = "nel deposito"
        } else {
            sezioneString = "nella sala"
        }
        
        let moveOpzione = UIAlertAction(title: "Sposta \(sezioneString)", style: .default, handler: callActionHandler)
        optionMenu.addAction(moveOpzione)
        
        self.present(optionMenu, animated: true, completion: nil)
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

