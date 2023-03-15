//
//  TableViewController.swift
//  SELENA-SLEDAI
//
//  Created by Georgy on 15.02.2023.
//

import UIKit
import RealmSwift
class TableViewController: UITableViewController {
    let realm = try!Realm(configuration: .init(schemaVersion: 2))
    var selenasObject = try! Realm().objects(SelenaSledaiRealm.self)
    var expandedCell:Int?
    
    var expandedCellHeight:CGFloat?
    @IBOutlet var selenaTableView: UITableView!
    
    @IBOutlet weak var resultLabel: UILabel!
    var result:Int = 0 {
        didSet{
            resultLabel.text = "Итого: \(result)"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<selenasObject.count {
            result += selenasObject[i].Checked ? selenasObject[i].Wt:0
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selenasObject.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.checkButton.tag = indexPath.row

        if indexPath.row == expandedCell {
            cell.expandThis.text = selenasObject[indexPath.row].Definition
        }
        else{
            cell.expandThis.text = ""
        }
        
        cell.checkButton.toggle(if: selenasObject[indexPath.row].Checked)
        cell.cellDescriptor.text = selenasObject[indexPath.row].Desriptor
        cell.cellWt.text = "\(selenasObject[indexPath.row].Wt)"
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if expandedCell == indexPath.row  {
            
            return 200
        }
        return 60
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        
        let lastIndexPath = IndexPath(row: expandedCell ?? 0, section: 0) // Закрываемая ячейка
        if expandedCell == indexPath.row {// если ячейка уже открыта то закрываем
            expandedCell = nil
        } else{
            expandedCell = indexPath.row // если не открыта то открываем
        }
        tableView.reloadRows(at: [lastIndexPath,indexPath], with: .fade) // обновляем закрываемую и открываемую ячейку
    }
   

    @IBAction func TestAction(_ sender: CheckButton) {
        try! realm.write{
            selenasObject[sender.tag].Checked.toggle()
            realm.add(selenasObject)
        }
        result += selenasObject[sender.tag].Checked ? +selenasObject[sender.tag].Wt: -(selenasObject[sender.tag].Wt)
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade) // обновляем ячейку на которую нажали
    }
}
