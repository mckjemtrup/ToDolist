//
//  ViewController.swift
//  ToDo
//
//  Created by Michael Kjemtrup on 26/02/2017.
//  Copyright © 2017 Michael Kjemtrup. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var TaskTableView: UITableView!
    
    var opgaver : [opgave]  = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        opgaver = opretOpgave()
        
        TaskTableView.dataSource = self
        TaskTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return opgaver.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let opgave = opgaver[indexPath.row]
        if opgave.vigtighed {
            cell.textLabel?.text = "‼️\(opgave.opgnavn)"
        } else {
            cell.textLabel?.text = opgave.opgnavn
        }
        
        return cell
    }
    
    func opretOpgave() -> [opgave] {
        let opgave1 = opgave()
        
        opgave1.opgnavn = "Gå med hunden"
        opgave1.vigtighed = false
        
        
        let opgave2 = opgave()
        
        opgave2.opgnavn = "Hent mælk"
        opgave2.vigtighed = true
        
        let opgave3 = opgave()
        
        opgave3.opgnavn = "Lav aftensmad "
        opgave3.vigtighed = false
        
        return [opgave1, opgave2, opgave3]
    }
    
    
    @IBAction func tilføjOpgave(_ sender: Any) {
        performSegue(withIdentifier: "tilføjopgsegue", sender: nil )
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated..
    }


}

