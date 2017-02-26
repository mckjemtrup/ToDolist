//
//  seOpgViewController.swift
//  ToDo
//
//  Created by Michael Kjemtrup on 26/02/2017.
//  Copyright © 2017 Michael Kjemtrup. All rights reserved.
//

import UIKit

class seOpgViewController: UIViewController {
    
   
    
    var opgaver : Opgave? = nil
    
    
   
    @IBOutlet weak var OPGLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
  
        
        if opgaver!.vigtighed {
            OPGLabel!.text = "‼️\(opgaver!.opgavenavn!)"
        } else {
            OPGLabel!.text = "\(opgaver!.opgavenavn!)"
        }
        
      
        
    }

    
    @IBAction func SubmitBtnPushed(_ sender: Any) {
let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(opgaver!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
        
       
    }
    
    
   
    

}
