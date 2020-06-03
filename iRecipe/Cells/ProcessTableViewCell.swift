//
//  ProcessTableViewCell.swift
//  iRecipe
//
//  Created by Tais Jaques da Silva on 01/07/19.
//  Copyright © 2019 Guilherme Moreira. All rights reserved.
//

import UIKit

class ProcessTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var checkboxButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layoutIfNeeded()
    }
    
    
    var isChecked = false
    
    func config(contentText: String, hasCheckBox: Bool) {
        contentLabel.text = contentText
        
        checkboxButton.isHidden = !hasCheckBox
        
      if hasCheckBox && isChecked {
            contentLabel.textColor = UIColor.init(named: "TextDisabledColor")
        } else {
            contentLabel.textColor = UIColor.init(named: "TextBasicColor")
        }
    }
    
    @IBAction func checkboxAction(_ sender: Any) {
        if isChecked {
            changeToUnChecked()
        } else {
            changeToChecked()
        }
        
        isChecked = !isChecked
    }
    
    func changeToChecked() {
        checkboxButton.backgroundColor = UIColor.init(named: "ItensColor")
        contentLabel.textColor = UIColor.init(named: "TextDisabledColor")
    }
    
    func changeToUnChecked() {
        checkboxButton.backgroundColor = UIColor.white
        contentLabel.textColor = UIColor.init(named: "TextBasicColor")
    }
}
