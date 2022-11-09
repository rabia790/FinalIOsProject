//
//  EmpAllDataViewController.swift
//  Project3
//
//  Created by gadgetzone on 06/11/22.
//

import UIKit

class EmpAllDataViewController: UIViewController {
    @IBOutlet weak var empName: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var NumberOfProject: UILabel!
    @IBOutlet weak var AnnualIncome: UILabel!
    @IBOutlet weak var occupationName: UILabel!
    @IBOutlet weak var vehicalColor: UILabel!
    @IBOutlet weak var Platename: UILabel!
    @IBOutlet weak var modelName: UILabel!
    @IBOutlet weak var carTypeLabel: UILabel!
    @IBOutlet weak var vehicalName: UILabel!
    @IBOutlet weak var vehicalType: UILabel!
    @IBOutlet weak var carType: UILabel!
    var firstname: String! = nil
    var age: String! = nil
    var noOfProject: String! = nil
    var income: String! = nil
    var occupation: String! = nil
    var vColor: String! = nil
    var plate: String! = nil
    var model: String! = nil
    var vType: String! = nil
    var vName: String! = nil
    var cType: String! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.empName.text = firstname
        self.ageLabel.text = age
        self.NumberOfProject.text = noOfProject
        self.AnnualIncome.text = income
        self.occupationName.text = occupation
        self.vehicalColor.text = vColor
        self.Platename.text = plate
        self.modelName.text = model
        self.vehicalName.text = vName
        self.vehicalType.text = vType
        self.carTypeLabel.text = cType
        
    }
}
