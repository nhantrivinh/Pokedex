//
//  PokemonDetailedVC.swift
//  Pokedex_by_JVinCi
//
//  Created by AndAnotherOne on 4/22/16.
//  Copyright © 2016 AndAnotherOne. All rights reserved.
//

import UIKit

class PokemonDetailedVC: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet var mainImg: UIImageView!
    @IBOutlet var lblDesc: UILabel!
    @IBOutlet var lblType: UILabel!
    @IBOutlet var lblDef: UILabel!
    @IBOutlet var lblHeight: UILabel!
    @IBOutlet var lblId: UILabel!
    @IBOutlet var lblWeight: UILabel!
    @IBOutlet var lblAtk: UILabel!
    @IBOutlet var lblNextEvolution: UILabel!
    @IBOutlet var currentEvoImg: UIImageView!
    @IBOutlet var nextEvoImage: UIImageView!
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        label.text = pokemon.name.capitalizedString
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        currentEvoImg.image = img
        
        
        pokemon.downloadPokemonDetails { () -> () in
            self.updateUI()
        }

    }
    
    func updateUI() {
        lblDesc.text = pokemon.desc
        lblType.text = pokemon.type
        lblDef.text = pokemon.def
        lblHeight.text = pokemon.height
        lblId.text = "\(pokemon.pokedexId)"
        lblWeight.text = pokemon.weight
        lblAtk.text = pokemon.attack

        if pokemon.nextEvolutionId == "" {
            lblNextEvolution.text = "No Evolution"
            nextEvoImage.hidden = true
        } else {
            nextEvoImage.hidden = false
            nextEvoImage.image = UIImage(named: "\(pokemon.nextEvolutionId)")
            var str = "Next Evolution: \(pokemon.nextEvolutionTxt)"
            if pokemon.nextEvolutionLvl != "" {
                str += " - LVL \(pokemon.nextEvolutionLvl)"
                lblNextEvolution.text = str
            }
        }
        
    }
 
    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    


}
