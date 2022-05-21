//
//  DustVC.swift
//  RxDust
//
//  Created by 임준화 on 2021/12/26.
//

import UIKit
import Then
import SnapKit
import RxRelay
import RxViewController

final class CocktialListVC: baseVC<CocktailListReactor>{
    
    private let tableView = UITableView().then {
        $0.register(CocktailListCell.self, forCellReuseIdentifier: CocktailListCell.identifier)
    }
    override func addView() {
        [tableView].forEach{ view.addSubview($0) }
    }
    override func setLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    override func configureVC() {
    }
    
    // MARK: - Reactor
    override func bindAction(reactor: CocktailListReactor) {
        self.rx.viewWillAppear
            .map { _ in Reactor.Action.fetchCocktail }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    override func bindState(reactor: CocktailListReactor) {
        let shareState = reactor.state.share(replay: 1)
        
        shareState
            .compactMap { $0.cockTails }
            .bind(to: self.tableView.rx.items(cellIdentifier: CocktailListCell.identifier, cellType: CocktailListCell.self)) { index, element, cell in
                cell.model = element
            }
            .disposed(by: disposeBag)
    }
}
