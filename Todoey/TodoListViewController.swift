//
//  ViewController.swift
//  Todoey
//
//  Created by Jack Winterschladen on 04/08/2022.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["Shopping List", "Work things", "Events"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        if #available(iOS 14.0, *) {
            var cellContent = cell.defaultContentConfiguration()
            cellContent.text = itemArray[indexPath.row]
            cell.contentConfiguration = cellContent
        } else {
            // Fallback on earlier versions
            cell.textLabel?.text = itemArray[indexPath.row]
        }
        
        return cell
    }
    
    //MARK: - TableView Delegate Methods
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in

            self.itemArray.append(textField.text!)
            print("Successfully added item.")
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
}

