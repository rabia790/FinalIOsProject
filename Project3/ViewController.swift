//
//  ViewController.swift
//  Project3
//
//  Created by rabia on 06/11/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var unselectedButton: UIButton!
    @IBOutlet weak var selectedButton: UIButton!
    @IBOutlet weak var fName: UITextField!
    @IBOutlet weak var lName: UITextField!
    @IBOutlet weak var birthYear: UITextField!
    @IBOutlet weak var monthlySalary: UITextField!
    @IBOutlet weak var occupationRate: UITextField!
    @IBOutlet weak var employeeId: UITextField!
    @IBOutlet weak var VehicalModel: UITextField!
    @IBOutlet weak var plateNumber: UITextField!
    @IBOutlet weak var TypeTextField: UITextField!
    @IBOutlet weak var colorTextfield: UITextField!
    @IBOutlet weak var chooseTypeButton: UIButton!
    @IBOutlet weak var chooseColorButton: UIButton!
    @IBOutlet weak var bugsNumberView: UIStackView!
    @IBOutlet weak var sideCarView: UIView!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var employeeTypeView: UIStackView!
    @IBOutlet weak var employeeTypeTextField: UITextField!
    @IBOutlet weak var employeeType: UILabel!
    @IBOutlet weak var carLabel: UILabel!
    @IBOutlet weak var vehicalLabe: UILabel!
    @IBOutlet weak var moterBikeLabel: UILabel!
    @IBOutlet weak var carType: UITextField!
    @IBOutlet weak var carTypeView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var typePicker: UIPickerView!
    var colorPicker: UIPickerView!
    let type = ["Manager", "Tester", "Programmer"]
    let color = ["red", "Blue", "Yellow", "Green", "Orange", "Purple", "Pink", "Brown", "White", "Black", "Beige"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = (CGSize(width: 600, height: 900.0))
        sideCarView.isHidden = true
        carTypeView.isHidden = true
        typePicker = UIPickerView()
        colorPicker = UIPickerView()
        typePicker.dataSource = self
        typePicker.delegate = self
        colorPicker.dataSource = self
        colorPicker.delegate = self
        TypeTextField.inputView = typePicker
        colorTextfield.inputView = colorPicker
        self.employeeTypeView.isHidden = true
    }
    
    @IBAction func selectedButtonTapped(_ sender: Any) {
        if selectedButton.tag == 0 {
            selectedButton.setImage(UIImage(named: "icon_radioSelected"), for: .normal)
            unselectedButton.setImage(UIImage(named: "icon_radioUnSelected"), for: .normal)
            sideCarView.isHidden = true
            carTypeView.isHidden = false
            carLabel.text = "car"
        }
    }
    
    @IBAction func unselectedButtonTapped(_ sender: Any) {
        if unselectedButton.tag == 1 {
            unselectedButton.setImage(UIImage(named: "icon_radioSelected"), for: .normal)
            selectedButton.setImage(UIImage(named: "icon_radioUnSelected"), for: .normal)
            sideCarView.isHidden = false
            carTypeView.isHidden = true
            moterBikeLabel.text = "Motercycle"
        }
    }
    
    @IBAction func yesButtonTapped(_ sender: UIButton) {
        if yesButton.tag == 0 {
            yesButton.setImage(UIImage(named: "icon_radioSelected"), for: .normal)
            noButton.setImage(UIImage(named: "icon_radioUnSelected"), for: .normal)
        }
    }
    
    @IBAction func noButtonTapped(_ sender: UIButton) {
        if noButton.tag == 1 {
            noButton.setImage(UIImage(named: "icon_radioSelected"), for: .normal)
            yesButton.setImage(UIImage(named: "icon_radioUnSelected"), for: .normal)
        }
    }
    
    @IBAction func registrationButtonAction(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EmployeeDataViewController") as! EmployeeDataViewController
        self.navigationController?.pushViewController(vc, animated: false)
        vc.firstname = "Name " + fName.text!
        vc.employeeId = employeeId.text
        vc.age = birthYear.text
        if(TypeTextField.text == "Programmer") {
            vc.noOfProject = "He/She Completed " + employeeTypeTextField.text! + " Projects"
        }
        else if (TypeTextField.text == "Tester") {
            vc.noOfProject = "He/She corrected " + employeeTypeTextField.text! + " Bugs"
        }
        else {
            vc.noOfProject = "He/She brought " + employeeTypeTextField.text! + " new client"
        }
        vc.income = monthlySalary.text
        vc.occupation = occupationRate.text
        vc.vColor = colorTextfield.text
        vc.plate = plateNumber.text
        vc.model = VehicalModel.text
        vc.carType = carType.text
        if(selectedButton.tag == 0) {
            vc.vType = "Employee has a " + carLabel.text!
        }
        else {
            vc.vType = "Employee has a " + moterBikeLabel.text!
        }
        if(yesButton.tag == 1) {
            vc.vName = "With a side car"
        }
        if(noButton.tag == 0) {
            vc.vName = "Without a side car"
        }
    }
}

extension ViewController : UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        var count = 0
        if(typePicker == pickerView)
        {
            count = type.count
        }
        else if(colorPicker == pickerView)
        {
            count = color.count
        }
        return count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var data = ""
        if(typePicker == pickerView)
        {
            data =  type[row]
        }
        else if(colorPicker == pickerView)
        {
            data =  color[row]
        }
        return data
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(typePicker == pickerView) {
            TypeTextField.text = type[row]
            self.view.endEditing(true)
            self.employeeTypeView.isHidden = false
            if TypeTextField.text == "Tester" {
                employeeType.text = "Bugs"
            }
            if TypeTextField.text == "Programmer" {
                employeeType.text = "Projects"
                
            }
            if TypeTextField.text == "Manager" {
                employeeType.text = "Client"
                
            }
        }
        else if(colorPicker == pickerView) {
            colorTextfield.text = color[row]
            self.view.endEditing(true)
        }
    }
}
