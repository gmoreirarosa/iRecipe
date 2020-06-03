//
//  RecipeTimeButtonView.swift
//  iRecipe
//
//  Created by Tais Jaques da Silva on 05/07/19.
//  Copyright © 2019 Guilherme Moreira. All rights reserved.
//

import UIKit

class RecipeTimeButtonView: UIView {
    
    var selected = false
    let nibName = "RecipeTimeButtonView"
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var timeButton: UIButton!
    @IBOutlet weak var clockImageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeButtonHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var timeButtonWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var timeButtonBackgroundImageView: UIImageView!
    
    @IBAction func timeButtonAction(_ sender: Any) {
        self.selected = !self.selected
        toggleTimeButton(selected: self.selected)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        contentView.fixInView(self)
    }
    
    func toggleTimeButton(selected: Bool) {
        if selected {
            self.clockImageView.image = UIImage(named: "ic-clock60")
            self.timeButtonBackgroundImageView.image = UIImage(named: "timeButtonBackgroundBig")
            self.timeLabel.textColor = .white
        } else {
            self.clockImageView.image = UIImage(named: "ic-clock15")
            self.timeButtonBackgroundImageView.image = UIImage(named: "timeButtonBackground")
            self.timeLabel.textColor = UIColor(named: "TitleColor")
        }
        
        self.layoutIfNeeded()
   }
    
    func config(label: String, selected: Bool) {
        self.selected = selected
        self.timeLabel.text = label
        self.toggleTimeButton(selected: selected)
    }
}
