//
//  TableViewController.swift
//  NewDemoForViewHeight
//
//  Created by macbook on 10/27/18.
//  Copyright © 2018 macbook. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var Tbl: UITableView!
    var index : IndexPath? = nil
    
    var arr : [Model] = [Model(name: "All"),Model(name: "India"),Model(name: "Srilanka"),Model(name: "Nepal"),Model(name: "Canada"),Model(name: "Switzerland"),Model(name: "China"),Model(name: "India"),Model(name: "Srilanka"),Model(name: "Nepal"),Model(name: "Canada"),Model(name: "Switzerland"),Model(name: "China"),Model(name: "India"),Model(name: "Srilanka"),Model(name: "Nepal"),Model(name: "Canada"),Model(name: "Switzerland"),Model(name: "China"),Model(name: "India"),Model(name: "Srilanka"),Model(name: "Nepal"),Model(name: "Canada"),Model(name: "Switzerland"),Model(name: "China")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let Headerview = HeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 40))
        return Headerview
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
     
        let cell : TblCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TblCell
        
        cell.Label.text = arr[indexPath.row].name
        
        
        if arr[indexPath.row].isSelected
        {
            //cell.accessoryType = .checkmark
            cell.Button.setImage(UIImage(named: "checked"), for: .normal)
        }
        else
        {
            //cell.accessoryType = .none
            cell.Button.setImage(UIImage(named: "notchecked"), for: .normal)
        }
        
        cell.Button.tag = indexPath.row
        cell.selectionStyle = .none
    
        cell.Button.addTarget(self, action: #selector(TapedButton), for: .touchUpInside)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if indexPath.row == 0
        {
            arr[indexPath.row].isSelected = !arr[indexPath.row].isSelected
            for index in arr.indices
            {
                arr[index].isSelected = arr[indexPath.row].isSelected
            }
        }
        else
        {
            arr[indexPath.row].isSelected = !arr[indexPath.row].isSelected

            if arr.dropFirst().filter({ $0.isSelected }).count == arr.dropFirst().count
            {
                arr[0].isSelected = true
            }
            else
            {
                arr[0].isSelected = false
            }
        }

        tableView.reloadData()
            /*tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            tableView.reloadData()
        
          tableView.deselectRow(at: indexPath, animated: true)

        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            if cell.accessoryType == .checkmark{
                cell.accessoryType = .none
            }
            else{
                cell.accessoryType = .checkmark
            }
        }*/
    }
    
    @objc func TapedButton(sender:UIButton)
    {
        Tbl.reloadData()
        if sender.isSelected
        {
            sender.isSelected = false
            if sender.tag == 0
            {
                
                arr[sender.tag].isSelected = !arr[sender.tag].isSelected
                
                for index1 in arr.indices
                {
                    arr[index1].isSelected = arr[sender.tag].isSelected
                }
            }
            else
            {
                arr[sender.tag].isSelected = !arr[sender.tag].isSelected
                
                if arr.dropFirst().filter({ $0.isSelected }).count == arr.dropFirst().count
                {
                    arr[0].isSelected = true
                }
                else
                {
                    arr[0].isSelected = false
                }
            }
            
        }
            
        else
        {
            sender.isSelected = true
            if sender.tag == 0
            {
                arr[sender.tag].isSelected = !arr[sender.tag].isSelected
                
                for index1 in arr.indices
                {
                    arr[index1].isSelected = arr[sender.tag].isSelected
                }
            }
            else
            {
                arr[sender.tag].isSelected = !arr[sender.tag].isSelected
                
                if arr.dropFirst().filter({ $0.isSelected }).count == arr.dropFirst().count
                {
                    arr[0].isSelected = true
                }
                else
                {
                    arr[0].isSelected = false
                }
            }
        }
        
       
        
//        if sender.isSelected
//        {
//            sender.isSelected = false
//        }
//        else
//        {
//            sender.isSelected = true
//        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

}

class TblCell : UITableViewCell
{
    @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var Button: UIButton!

}

extension UITableView {
    func lastIndexpath() -> IndexPath {
        let section = max(numberOfSections - 1, 0)
        let row = max(numberOfRows(inSection: section) - 1, 0)
        
        return IndexPath(row: row, section: section)
    }
}


