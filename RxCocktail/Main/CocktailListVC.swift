//
//  CocktailListVC.swift
//  RxCocktail
//
//  Created by 임준화 on 2021/12/29.
//

import UIKit
import Then
import SnapKit
import RxViewController
import RxSwift

final class CocktailListVC: baseVC<CocktailListReactor>{
    private let searchBar = UISearchBar()
    
    private let tableView = UITableView().then{
        $0.register(cocktailListCell.self, forCellReuseIdentifier: cocktailListCell.identifier)
        $0.separatorStyle = .none
        $0.rowHeight = 80
    }
}
