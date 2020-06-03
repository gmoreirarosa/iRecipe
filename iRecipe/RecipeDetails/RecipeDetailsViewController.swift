//
//  RecipeDetailsViewController.swift
//  iRecipe
//
//  Created by Tais Jaques da Silva on 24/06/19.
//  Copyright © 2019 Guilherme Moreira. All rights reserved.
//

import UIKit

class RecipeDetailsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    private let presenter: RecipeDetailsPresenterType = RecipeDetailsPresenter()
    var recipe: Recipe?
    var secondSectionIndexPaths = [IndexPath]()
    var selectedTab: DetailSelectedTab = .ingredients
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configTable()
        
        if let recipe = self.recipe {
            
            let favoriteIcon = self.presenter.isFavorite(with: recipe.id) ? "ic-favoriteOn" : "ic-favoriteOff"
            
            DispatchQueue.main.async {
                self.favoriteButton.setImage(UIImage(named: favoriteIcon), for: .normal)
                self.tableView.reloadData()
            }
        }
    }
    
    private func configTable() {
        //self.recipeTableView.dataSource = presenter
        //self.recipeTableView.delegate = self
    }
    
    @IBAction func backButtonTouch(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func favoriteButtonTouch(_ sender: Any) {
        if let currentRecipe = recipe {
           let buttonIconName = self.presenter.favoriteRecipe(with: currentRecipe.id)
            
            favoriteButton.setImage(UIImage(named: buttonIconName), for: .normal)
        }
    }
}


extension RecipeDetailsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 2
        } else {
            return Int.maxValue(firstValue: recipe?.ingredients?.count ?? 0, secondValue: recipe?.ingredients?.count ?? 0)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.item == 0 {
                if let cell = tableView.dequeueReusableCell(withIdentifier: "illustration-cell", for: indexPath) as? IllustrationTableViewCell {
                    cell.config(imageUrl: recipe?.imageURL ?? "")
                    return cell
                }
            } else if indexPath.item == 1 {
                if let cell = tableView.dequeueReusableCell(withIdentifier: "information-cell", for: indexPath) as? InformationTableViewCell {
                    cell.config(recipe: recipe)
                    return cell
                }
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "process-cell", for: indexPath) as? ProcessTableViewCell {
                if selectedTab == .ingredients {
                    if indexPath.item < recipe?.ingredients?.count ?? 0 {
                        cell.config(contentText: recipe?.ingredients?[indexPath.item] ?? "", hasCheckBox: false)
                    }
                } else {
                    if indexPath.item < recipe?.steps?.count ?? 0 {
                        cell.config(contentText: recipe?.steps?[indexPath.item] ?? "", hasCheckBox: true)
                    }
                }
                
                if !secondSectionIndexPaths.contains(indexPath) {
                    secondSectionIndexPaths.append(indexPath)
                }
                
                return cell
            }
        }
        
        return UITableViewCell()
    }
}

extension RecipeDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else {
            return 48
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "buttons-header") as? TabSelectorTableViewCell {
            cell.tabSelectDelegate = self
            cell.config()
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

extension RecipeDetailsViewController: TabSelectDelegate {
    func changeSelectedTab(selectedTab: DetailSelectedTab) {
        self.selectedTab = selectedTab
        
        self.tableView.reloadRows(at: secondSectionIndexPaths,
                                  with: selectedTab == .ingredients ? .right : .left)
    }
}
