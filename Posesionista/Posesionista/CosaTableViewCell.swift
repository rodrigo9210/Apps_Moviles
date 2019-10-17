//
//  CosaTableViewCell.swift
//  Posesionista
//
//  Created by Arce Anguiano Rodrigo Roberto on 10/16/19.
//  Copyright © 2019 Arce Anguiano Rodrigo Roberto. All rights reserved.
//

import UIKit

class CosaTableViewCell: UITableViewCell {

    @IBOutlet weak var labelDeNombre: UILabel!
    @IBOutlet weak var labelDeSerie: UILabel!
    @IBOutlet weak var labelDePrecio: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
