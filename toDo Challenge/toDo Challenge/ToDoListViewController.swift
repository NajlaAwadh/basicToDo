//
//  ViewController.swift
//  toDo Challenge
//
//  Created by Najla Awadh on 20/12/2021.
//

import UIKit

class ToDoListViewController: UIViewController  {
    
    
    static var todos = [""]
//tabel
    var tabelView : UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(ToDoCell.self, forCellReuseIdentifier: "cell")
        return $0
    } (UITableView())
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // navigation item
        NSLayoutConstraint.activate([
            tabelView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tabelView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tabelView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tabelView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        tabelView.dataSource = self
        tabelView.delegate = self
        
        let vc  = UINavigationController(rootViewController: ToDoListViewController())
    }
//alert
@objc func alert(){}
}
//MARK: - extention
extension ToDoListViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ToDoCell
        cell.textLabel?.text = todos[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UpdateViewController()
        vc.todo = todos[indexPath.row]
        
    }
    func add(indexPath: Int ,  newValue: String) {
        todos[indexPath] = newValue
    }
   
}

//MARK: class
class ToDoCell : UITableViewCell{
  
    
    

}

protocol cell {
    func add(indexPath: Int ,  newValue: String)
}
