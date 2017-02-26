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
    
  
    
      
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func opretOpgave(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
        
        let opgaven = Opgave(context: context)
        
        opgaven.opgavenavn = opgaveNavnTekstBoks.text!
        opgaven.vigtighed = vigtighedsswitch.isOn
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        
       
        navigationController! .popViewController(animated: true)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
