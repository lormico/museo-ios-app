//
//  TableViewCell.swift
//  Museo
//
//  Created by partecipante on 22/01/2020.
//  Copyright © 2020 DXC. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var immagine: UIImageView!
    
    @IBOutlet weak var titolo: UILabel!
    @IBOutlet weak var autore: UILabel!
    @IBOutlet weak var extra: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
