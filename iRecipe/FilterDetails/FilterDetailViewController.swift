//
//  FiltroViewController.swift
//  iRecipe
//
//  Created by Guilherme Moreira on 04/07/19.
//  Copyright © 2019 Guilherme Moreira. All rights reserved.
//

import UIKit

class FilterDetailViewController: UIViewController {

    private let presenter: FilterDetailPresenter = FilterDetailPresenter()

    @IBOutlet weak var timeButtonView15: RecipeTimeButtonView!
    @IBOutlet weak var timeButtonView30: RecipeTimeButtonView!
    @IBOutlet weak var timeButtonView60: RecipeTimeButtonView!

    @IBOutlet weak var easyButton: UIButton!
    @IBOutlet weak var mediumButton: UIButton!
    @IBOutlet weak var hardButton: UIButton!

    @IBOutlet weak var easyLabel: UILabel!
    @IBOutlet weak var mediumLabel: UILabel!
    @IBOutlet weak var hardLabel: UILabel!

    var selectedLevel: String?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let times = UserDefaults.standard.object(forKey: FilterDetailPresenter.filterTimeKey) as? [String] ?? [String]()

        self.tabBarController?.tabBar.isHidden = true
        timeButtonView15.config(label: "15 min", selected: times.contains("15min"))
        timeButtonView30.config(label: "30 min", selected: times.contains("30min"))
        timeButtonView60.config(label: "60 min", selected: times.contains("60min"))

        if let level = UserDefaults.standard.string(forKey: FilterDetailPresenter.filterLevelKey) {

            if level == "Tranquilo" {
                easySelected()

            } else if level == "Regular" {
                mediumSelected()

            } else {
                hardSelected()
            }
        }

        self.view.layoutIfNeeded()

    }

    @IBAction func cancelButtonTouch(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func applyButtonTouch(_ sender: Any) {
        self.filter()
    }

    @IBAction func cleanButtonTouch(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: FilterDetailPresenter.filterTimeKey)
        UserDefaults.standard.removeObject(forKey: FilterDetailPresenter.filterLevelKey)

        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func easyButtonTouch(_ sender: Any) {
        easySelected()
    }

    @IBAction func mediumButtonTouch(_ sender: Any) {
        mediumSelected()
    }

    @IBAction func hardButtonTouch(_ sender: Any) {
        hardSelected()
    }

    func easySelected() {

        self.selectedLevel = "Tranquilo"

        self.easyButton.backgroundColor = UIColor(named: "ItensColor")
        self.easyLabel.textColor = UIColor(named: "ItensColor")

        self.mediumButton.backgroundColor = UIColor(named: "BackgroundDisabledColor")
        self.mediumLabel.textColor = UIColor(named: "TitleColor")

        self.hardButton.backgroundColor = UIColor(named: "BackgroundDisabledColor")
        self.hardLabel.textColor = UIColor(named: "TitleColor")
    }

    func mediumSelected() {

        self.selectedLevel = "Regular"

        self.easyButton.backgroundColor = UIColor(named: "BackgroundDisabledColor")
        self.easyLabel.textColor = UIColor(named: "TitleColor")

        self.mediumButton.backgroundColor = UIColor(named: "ItensColor")
        self.mediumLabel.textColor = UIColor(named: "ItensColor")

        self.hardButton.backgroundColor = UIColor(named: "BackgroundDisabledColor")
        self.hardLabel.textColor = UIColor(named: "TitleColor")
    }

    func hardSelected() {

        self.selectedLevel = "Complicado"

        self.easyButton.backgroundColor = UIColor(named: "BackgroundDisabledColor")
        self.easyLabel.textColor = UIColor(named: "TitleColor")

        self.mediumButton.backgroundColor = UIColor(named: "BackgroundDisabledColor")
        self.mediumLabel.textColor = UIColor(named: "TitleColor")

        self.hardButton.backgroundColor = UIColor(named: "ItensColor")
        self.hardLabel.textColor = UIColor(named: "ItensColor")
    }

    func filter() {

        var selectedTimes = [String]()

        if self.timeButtonView15.selected {
            selectedTimes.append("15min")
        }

        if self.timeButtonView30.selected {
            selectedTimes.append("30min")
        }

        if self.timeButtonView60.selected {
            selectedTimes.append("60min")
        }

        self.presenter.applyFilter(time: selectedTimes, level: selectedLevel)

        self.navigationController?.popViewController(animated: true)
    }
}

enum RecipeLevel: String {
    case easy = "Tranquilo"
    case medium = "Regular"
    case hard = "Complicado"
}

enum RecipeTime: String {
    case short = "15min"
    case medium = "30min"
    case long = "60min"
}

class FilterDetailPresenter: NSObject {

    static var filterTimeKey = "filter.time"
    static var filterLevelKey = "filter.level"

    private var time: [String]? {
        didSet {
            UserDefaults.standard.set(self.time, forKey: FilterDetailPresenter.filterTimeKey)
        }
    }

    private var level: String? {
        didSet {
            UserDefaults.standard.set(self.level, forKey: FilterDetailPresenter.filterLevelKey)
        }
    }

    override init() {

        self.time = UserDefaults.standard.object(forKey: FilterDetailPresenter.filterTimeKey) as? [String] ?? [String]()

        if let level = UserDefaults.standard.string(forKey: FilterDetailPresenter.filterLevelKey) {
            self.level = level
        }

        super.init()
    }

    func applyFilter(time: [String]?, level: String?) {
        self.time = time
        self.level = level
    }
}
