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
    
    var opgaver : [Opgave]  = []
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
        
        TaskTableView.dataSource = self
        TaskTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        hentOpgaver()
        TaskTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return opgaver.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let opgave30 = opgaver[indexPath.row]
        if opgave30.vigtighed {
            cell.textLabel!.text = "‼️\(opgave30.opgavenavn!)"
        } else {
            cell.textLabel!.text = opgave30.opgavenavn!
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
        let opgaven = opgaver[indexPath.row]
        performSegue(withIdentifier: "valgtOpgaveSegue", sender: opgaven)
    }
    
    
  
    
    
    @IBAction func tilføjOpgave(_ sender: Any) {
        performSegue(withIdentifier: "tilføjopgsegue", sender: nil )
    }
    
    
    func hentOpgaver() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
           opgaver = try context.fetch(Opgave.fetchRequest()) as! [Opgave]
            print(opgaver)
        } catch {
        print("HOV! Der er noget galt!")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
     
        
        if segue.identifier == "valgtOpgaveSegue"{
            let nextVC = segue.destination as! seOpgViewController
            nextVC.opgaver = sender as? Opgave
           
            
            
        
        
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated..
    }


}

