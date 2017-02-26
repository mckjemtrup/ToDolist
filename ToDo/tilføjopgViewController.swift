//
//  tilføjopgViewController.swift
//  ToDo
//
//  Created by Michael Kjemtrup on 26/02/2017.
//  Copyright © 2017 Michael Kjemtrup. All rights reserved.
//

import UIKit

class tilf_jopgViewController: UIViewController {

    @IBOutlet weak var vigtighedsswitch: UISwitch!
    @IBOutlet weak var opgaveNavnTekstBoks: UITextField!
    
   var tidlVC = OversigtViewController()
    
      
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func opretOpgave(_ sender: Any) {
        
        let opgaven = opgave()
        
        opgaven.opgnavn = opgaveNavnTekstBoks.text!
        opgaven.vigtighed = vigtighedsswitch.isOn
        
        tidlVC.opgaver.append(opgaven)
        tidlVC.TaskTableView.reloadData()
        navigationController! .popViewController(animated: true)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
