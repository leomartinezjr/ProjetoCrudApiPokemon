//
//  ListaPokwTableViewController.swift
//  Estudo CRUD
//
//  Created by Luana Martinez de La Flor on 01/12/21.
//

import UIKit

class ListaPokwTableViewController: UITableViewController {

    
    var listPokemmonPokeDetails: [Pokemon] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       loadingPoke()
    }
    
    
    func loadingPoke(filtro: String = " "){
        
        
        
        REST.loadPokeDetails({ (pokemon) in
            
            self.listPokemmonPokeDetails.append(pokemon)
                DispatchQueue.main.async {
                    self.tableView.reloadData()}
               })
        
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! PokemonViewController
        let pokeList = listPokemmonPokeDetails[tableView.indexPathForSelectedRow!.row]
        vc.listPokemmonPokeDetails = pokeList
    }


   
    

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listPokemmonPokeDetails.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellPokeTableViewCell
        
        
       // let pokelist = listPokemmonPokeName[indexPath.row]
        let pokelist = listPokemmonPokeDetails[indexPath.row]
       // let pokefoto = listPokemmonPokeDetails[indexPath.row].sprites.other.officialArtWork.front_default
        
        
        cell.prepare(whith: pokelist)
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
