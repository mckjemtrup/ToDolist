//
//  OversigtViewController.swift
//  ToDo
//
//  Created by Michael Kjemtrup on 26/02/2017.
//  Copyright © 2017 Michael Kjemtrup. All rights reserved.
//

import UIKit

class OversigtViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var TaskTableView: UITableView!
    
    var opgaver : [opgave]  = []
    var valgtIndex = 0
    
    
    
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
        let opgave30 = opgaver[indexPath.row]
        if opgave30.vigtighed {
            cell.textLabel?.text = "‼️\(opgave30.opgnavn)"
        } else {
            cell.textLabel?.text = opgave30.opgnavn
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        valgtIndex = indexPath.row
        let opgaven = opgaver[indexPath.row]
        performSegue(withIdentifier: "valgtOpgaveSegue", sender: opgaven)
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
        if segue.identifier == "tilføjopgsegue" {
        let nextVC = segue.destination as! tilf_jopgViewController
            nextVC.tidlVC = self }
        
        if segue.identifier == "valgtOpgaveSegue"{
            let nextVC = segue.destination as! seOpgViewController
            nextVC.opgaver = sender as! opgave
            nextVC.tidlVC = self
            
            
        
        
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated..
    }


}

