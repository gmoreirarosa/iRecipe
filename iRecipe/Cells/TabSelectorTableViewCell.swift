//
//  TabSelectorTableViewCell.swift
//  iRecipe
//
//  Created by Tais Jaques da Silva on 01/07/19.
//  Copyright © 2019 Guilherme Moreira. All rights reserved.
//

import UIKit

protocol TabSelectDelegate {
    func changeSelectedTab(selectedTab: DetailSelectedTab)
}

class TabSelectorTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ingredientsButton: UIButton!
    @IBOutlet weak var stepByStepButton: UIButton!
    @IBOutlet weak var selectorView: UIView!
    @IBOutlet weak var selectorLeadingContraint: NSLayoutConstraint!
    
    lazy var selectedButton = ingredientsButton
    var tabSelectDelegate: TabSelectDelegate?
    
    func config() {
        self.selectorView.removeConstraint(selectorLeadingContraint)
    }
    
    
    @IBAction func stepByStepAction(_ sender: Any) {
        
        if selectedButton == ingredientsButton {

            stepByStepButton.backgroundColor = UIColor.init(named: "ItensColor")
            stepByStepButton.setTitleColor(UIColor.white, for: .normal)

            ingredientsButton.backgroundColor = UIColor.clear
            ingredientsButton.setTitleColor(UIColor.init(named: "ButtonDisabledColor"), for: .normal)

            
            
//            UIView.animate(withDuration: 0.2) {
//                self.selectorView.frame = CGRect.init(x: 200, y: 0, width: self.selectorView.frame.width, height: self.selectorView.frame.height)
//            }
            selectedButton = stepByStepButton
            tabSelectDelegate?.changeSelectedTab(selectedTab: .stepByStep)
        }
    }
    
    @IBAction func ingredientsAction(_ sender: Any) {
        
        if selectedButton == stepByStepButton {
            ingredientsButton.backgroundColor = UIColor.init(named: "ItensColor")
            ingredientsButton.setTitleColor(UIColor.white, for: .normal)
            
            stepByStepButton.backgroundColor = UIColor.clear
            stepByStepButton.setTitleColor(UIColor.init(named: "ButtonDisabledColor"), for: .normal)
            
            selectedButton = ingredientsButton
            tabSelectDelegate?.changeSelectedTab(selectedTab: .ingredients)
        }
    }
}
