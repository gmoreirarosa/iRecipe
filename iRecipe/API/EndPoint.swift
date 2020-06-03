//
//  EndPoint.swift
//  iRecipe
//
//  Created by Guilherme Moreira on 25/06/19.
//  Copyright © 2019 Guilherme Moreira. All rights reserved.
//

import Foundation

extension RequestMaker {

    enum Endpoint {

        case list
        case favorites

        var url: String {
            switch self {
            case .list:
                return "recipes\(applyFilter())"
            case .favorites:
                return "recipes\(destrinchIdsAsParams())"
            }
        }
    }
}

private func destrinchIdsAsParams() -> String {
    var favoriteIds = Set<Int>()

    if let data = UserDefaults.standard.array(forKey: "favorites.ids") as? [Int] {
        favoriteIds = Set(data)
    }

    guard !favoriteIds.isEmpty else {
        return "?id="
    }

    var localCopiedIds = favoriteIds
    var result = "?id=\(localCopiedIds.removeFirst())"

    for id in localCopiedIds {
        result += "&id=\(id)"
    }

    return result
}

private func applyFilter() -> String {

    var result = "/?"

    if let times = UserDefaults.standard.object(forKey: FilterDetailPresenter.filterTimeKey) as? [String] {

        for time in times {
            result.append("&time=\(time)")
        }
    }

    if let level = UserDefaults.standard.string(forKey: FilterDetailPresenter.filterLevelKey) {
        result.append("&level=\(level)")
    }

    return result
}
