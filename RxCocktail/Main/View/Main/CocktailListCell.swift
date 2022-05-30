//
//  CocktailListCell.swift
//  RxCocktail
//
//  Created by 임준화 on 2021/12/29.
//

import UIKit
import Then
import SnapKit

final class CocktailListCell: BaseTableViewCell<    drinks>{
    static let identifier = "CocktailList"
    
    private lazy var drinkName = UILabel()
    private lazy var category = UILabel()
    private lazy var glass = UILabel()
    
    override func configureCell(){
        super.configureCell()
        addView()
        setLayout()
    }
    private func addView(){
        [drinkName, category, glass].forEach{ addSubview($0) }
    }
    private func setLayout(){
        drinkName.snp.makeConstraints {
            $0.left.equalTo(bounds.width*0.1)
            $0.centerY.equalToSuperview()
        }
        category.snp.makeConstraints {
            $0.left.equalTo(drinkName.snp.right).offset(bounds.width*0.09)
            $0.centerY.equalToSuperview()
        }
        glass.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(category.snp.right).offset(20)
        }
    }
    override func bind(_ model: drinks) {
        drinkName.text = model.strDrink
        category.text = model.strCategory
        glass.text = model.strGlass
    }
}
