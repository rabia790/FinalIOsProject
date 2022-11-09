//
//  EmployeeDataViewController.swift
//  Project3
//
//  Created by gadgetzone on 06/11/22.
//

import UIKit

class EmployeeDataViewController: UIViewController {
    
    @IBOutlet weak var employeeTableView: UITableView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var firstnameLabel: UILabel!
    @IBOutlet weak var empId: UILabel!
    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var noDataFoundLabel: UILabel!
    
    var firstname: String! = nil
    var employeeId: String! = nil
    var age:String! = nil
    var noOfProject: String! = nil
    var income: String! = nil
    var occupation: String! = nil
    var vColor: String! = nil
    var plate: String! = nil
    var model: String! = nil
    var vType: String! = nil
    var vName: String! = nil
    var carType: String! = nil
    var data = [String]()
    var tabledata: [String]! 
    var dataArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = UserDefaults.standard.value(forKey: "DataArray") as? [String] {
            dataArray = data
        }
        employeeTableView.delegate = self
        employeeTableView.dataSource = self
        self.noDataFoundLabel.isHidden = false
        employeeTableView.reloadData()
    }
    
    @IBAction func addButtonAction(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(vc, animated: false)
    }
}
extension EmployeeDataViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = employeeTableView
            .dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EmployeeTableViewCell
        
      
      
        cell.firstnameLabel?.text = firstname
        cell.empId.text = employeeId
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EmpAllDataViewController") as! EmpAllDataViewController
        self.navigationController?.pushViewController(vc, animated: false)
        vc.firstname = firstname
        vc.age = age
        vc.noOfProject = noOfProject
        vc.income = income
        vc.occupation = occupation
        vc.vColor = vColor
        vc.plate = plate
        vc.model = model
        vc.vType = vType
        vc.vName = vName
        vc.cType = carType
    }
}

