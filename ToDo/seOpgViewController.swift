//
//  seOpgViewController.swift
//  ToDo
//
//  Created by Michael Kjemtrup on 26/02/2017.
//  Copyright © 2017 Michael Kjemtrup. All rights reserved.
//

import UIKit

class seOpgViewController: UIViewController {
    
   
    
    var opgaver = opgave()
    var tidlVC = OversigtViewController()
    
    @IBOutlet weak var vigtigLabel: UILabel!
    @IBOutlet weak var OPGLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
  
        
        if opgaver.vigtighed {
            OPGLabel.text = "‼️\(opgaver.opgnavn)"
        } else {
            OPGLabel.text = opgaver.opgnavn
        }
        
      
        
    }

    
    @IBAction func SubmitBtnPushed(_ sender: Any) {
        tidlVC.opgaver.remove(at: tidlVC.valgtIndex)
        tidlVC.TaskTableView.reloadData()
        navigationController!.popViewController(animated: true)
        
       
    }
    
    
   
    

}
