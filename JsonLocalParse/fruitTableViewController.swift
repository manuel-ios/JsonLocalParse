//
//  fruitTableViewController.swift
//  JsonLocalParse
//
//  Created by Manuel Osorio Catalan on 28/01/21.
//

import UIKit

class fruitTableViewController: UITableViewController {

    var fruitsList:[Fruits] =  [Fruits]()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()  

 
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fruitsList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell?.textLabel?.text =  fruitsList[indexPath.row].pregunta
        cell?.detailTextLabel?.text =  fruitsList[indexPath.row].Respuesta
        return cell!
    }
    func fetchData()  {
        guard let fileLocation = Bundle.main.url(forResource: "fruits", withExtension: "json") else {
            return
        }
        do{
            let data =  try Data(contentsOf: fileLocation)
            let receivedData =  try JSONDecoder().decode([Fruits].self, from: data)
            self.fruitsList = receivedData
            DispatchQueue.main.async {
            self.tableView.reloadData()
            }
            
        }catch{
          //  print(error)
           print("Error")
        }
    }

}
