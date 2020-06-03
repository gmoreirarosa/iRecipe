//
//  RecipeTableListViewController.swift
//  iRecipe
//
//  Created by Guilherme Moreira on 22/06/19.
//  Copyright © 2019 Guilherme Moreira. All rights reserved.
//

import UIKit

class RecipeListViewController: UIViewController {
    
    @IBOutlet weak var recipeCollectionView: UICollectionView!
    @IBOutlet weak var viewModeButton: UIButton!
    
    private let presenter: RecipeListPresenterType = RecipeListPresenter()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = false
        self.presenter.fetchData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configTable()
        
        self.presenter.view = self
        self.presenter.fetchData()
    }
    
    private func configTable() {
        self.recipeCollectionView.dataSource = presenter
        self.recipeCollectionView.delegate = self
    }
    
    @IBAction func viewModeButtonTouch(_ sender: Any) {
        if (self.viewModeButton.currentImage == UIImage(named: "ic-halfcell")) {
            self.viewModeButton.setImage(UIImage(named: "ic-fullcell"), for: .normal)
        } else {
            self.viewModeButton.setImage(UIImage(named: "ic-halfcell"), for: .normal)
        }
        
        DispatchQueue.main.async {
            self.presenter.fetchData()
        }
    }
    
    @IBAction func filterButtonTouch(_ sender: Any) {
        let storyboard = self.storyboard
        if let filterDetailViewController = storyboard?.instantiateViewController(withIdentifier: "FilterDetailViewController") as? FilterDetailViewController {
            self.navigationController?.pushViewController(filterDetailViewController, animated: true)
        }
    }
    
}

extension RecipeListViewController: RecipeListViewType {
    func reloadData() {
        self.recipeCollectionView.reloadData()
    }
}

extension RecipeListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = self.storyboard
        if let recipeDetailViewController = storyboard?.instantiateViewController(withIdentifier: "RecipeDetailViewController") as? RecipeDetailsViewController {
            
            recipeDetailViewController.recipe = self.presenter.recipeAt(index: indexPath.item)
            self.navigationController?.pushViewController(recipeDetailViewController, animated: true)
        }
    }
    
}

extension RecipeListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var width = 375
        
        if (self.viewModeButton.currentImage == UIImage(named: "ic-fullcell")) {
            width = 160
        }
        
        return CGSize(width: width, height: 170)
    }
}
