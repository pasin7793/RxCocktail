//
//  MainFlow.swift
//  RxCocktail
//
//  Created by 임준화 on 2021/12/29.
//

import RxFlow
import UIKit

final class MainFlow: Flow{
    var root: Presentable{
        return self.rootVC
    }
    
    enum tabIndex: Int{
        case cockTail = 0
    }
    let rootVC: UITabBarController = .init()
    private let cockTailListFlow: cockTailListFlow
    
    init(){
        
    }
}
