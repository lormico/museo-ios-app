//
//  DetailViewController.swift
//  Museo
//
//  Created by partecipante on 23/01/2020.
//  Copyright © 2020 DXC. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var immagine: UIImageView!
    
    @IBOutlet weak var titolo: UILabel!
    @IBOutlet weak var autore: UILabel!
    @IBOutlet weak var materiale: UILabel!
    @IBOutlet weak var altezza: UILabel!
    @IBOutlet weak var esposta: UILabel!
    
    var opera: Opera?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titolo.text = opera?.titolo
        autore.text = opera?.autore
        altezza.text = opera?.dimensioni
        
        var esposto = ""
        if (opera?.esposto)! {
            esposto = "Esposto"
        } else {
            esposto = "In magazzino"
        }
        esposta.text = esposto
        
        if let statua = opera as? Statua {
            materiale.text = statua.materiale
        } else if let quadro = opera as? Quadro {
            materiale.text = quadro.tecnica
        }
        
        immagine.image = UIImage(named: (opera?.immagine)!)
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
