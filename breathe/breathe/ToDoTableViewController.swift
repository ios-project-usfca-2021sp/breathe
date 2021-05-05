////
////  ToDoTableViewController.swift
////  breathe
////
////  Created by Anoushka Erram on 4/29/21.
////
//
//import UIKit
//import Parse
//
//class ToDoTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
//
//   
//    @IBOutlet var tabView: UITableView!
//    
//    var todoArray = [PFObject]() //change type
//    var numOfTask: Int!
//    
//    let myRefreshControl = UIRefreshControl()
//    
//
//    override func viewDidLoad() {
//        //only happens once when you reboot the app
//        super.viewDidLoad()
//        
////        myRefreshControl.addTarget(self, action: #selector(loadTasks), for: .valueChanged)
////        tableView.refreshControl = myRefreshControl
////        tableView.rowHeight = UITableView.automaticDimension
////        tableView.estimatedRowHeight = 150
//        
//        tableView.delegate = self
//        tableView.dataSource = self
//        
//        
//        
//
//        // Uncomment the following line to preserve selection between presentations
//        // self.clearsSelectionOnViewWillAppear = false
//
//        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        // self.navigationItem.rightBarButtonItem = self.editButtonItem
//    }
//    override func viewDidAppear(_ animated: Bool) {
//        //loads whenever you come to this page
//        getTasks()
//        
//    }
//    
//    //viewDidAppear: view controller shows up
//    //call the parse function to load/return data in viewDidAppear
//
//    
//    //create separate function to call Parse
//    //include reload data
//    
//    func getTasks(){
//        
//        let query = PFQuery(className: "Tasks")
//        
//        query.findObjectsInBackground(){tasks in
//            if let tasks = tasks{
//                self.toDoArray = tasks
//                self.tableView.reloadData()
//            }
//            
//        }
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return todoArray.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell") as! ToDoTableViewCell
//        let task = todoArray[indexPath.row]
//        cell.taskTitle.text = task["brief"] as? String
//        cell.taskDesc.text = task["detail"] as? String
//        
//        return cell
//    }
//    
//    
//    
//    
//
//    // MARK: - Table view data source
////
////    override func numberOfSections(in tableView: UITableView) -> Int {
////        // #warning Incomplete implementation, return the number of sections
////        return 0
////    }
////    
////    @objc func loadTasks(){
////        numOfTask = 20
////
////        let myParam = ["count": numOfTask]
////        let check = PFObject(className: "Tasks")
////
////        task["brief"] = taskTitle.text!
////        task["detail"] = taskDescrip.text!
////
////    }
////
////    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        // #warning Incomplete implementation, return the number of rows
////        return 0
////    }
//
//    /*
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
//
//        // Configure the cell...
//
//        return cell
//    }
//    */
//
//    /*
//    // Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
//    */
//
//    /*
//    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }    
//    }
//    */
//
//    /*
//    // Override to support rearranging the table view.
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//
//    }
//    */
//
//    /*
//    // Override to support conditional rearranging of the table view.
//    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the item to be re-orderable.
//        return true
//    }
//    */
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
