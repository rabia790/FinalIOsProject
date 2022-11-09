//
//  EmployeeTableViewCell.swift
//  Project3
//
//  Created by gadgetzone on 06/11/22.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var firstnameLabel: UILabel!
    @IBOutlet weak var empId: UILabel!
    @IBOutlet weak var dataView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.dataView.isHidden = false
        
        // Configure the view for the selected state
    }
}
