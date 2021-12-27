//
//  PokemonViewController.swift
//  Estudo CRUD
//
//  Created by Luana Martinez de La Flor on 01/12/21.
//

import UIKit
import Kingfisher

class PokemonViewController: UIViewController {

    var listPokemmonPokeDetails: Pokemon!
    
    
    @IBOutlet weak var inPokeImage: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbId: UILabel!
    @IBOutlet weak var lbPeso: UILabel!
    @IBOutlet weak var lbAltura: UILabel!
    @IBOutlet weak var lbTipo: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbName.text = listPokemmonPokeDetails.name
        lbId.text = String(listPokemmonPokeDetails.id!)
        lbPeso.text = String( listPokemmonPokeDetails.height!)
        lbAltura.text = String(listPokemmonPokeDetails.weight!)
        lbTipo.text = listPokemmonPokeDetails.types.first?.type.name
        
        if let url = URL(string:  listPokemmonPokeDetails.sprites.other.officialArtWork.front_default){
            inPokeImage.kf.setImage(with: url)
        }
        
        
        
        
        
        
        
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
