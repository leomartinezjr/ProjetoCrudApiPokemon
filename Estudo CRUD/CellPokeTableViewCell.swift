//
//  CellPokeTableViewCell.swift
//  Estudo CRUD
//
//  Created by Luana Martinez de La Flor on 01/12/21.
//

import UIKit
import Kingfisher

class CellPokeTableViewCell: UITableViewCell {

    @IBOutlet weak var ivFotoPoke: UIImageView!
    @IBOutlet weak var lbPokeName: UILabel!
    @IBOutlet weak var lbPokeType: UILabel!
    @IBOutlet weak var ivPokeType: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func prepare(whith pokeli: Pokemon)  {
       
        lbPokeName.text = pokeli.name
        if let url = URL(string: pokeli.sprites.other.officialArtWork.front_default){
            ivFotoPoke.kf.setImage(with: url)
        }
        
        
        lbPokeType.text = pokeli.types[0].type.name
        
        
        
    }
    
}
