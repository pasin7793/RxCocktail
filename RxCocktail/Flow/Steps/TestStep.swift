//
//  TestStep.swift
//  RxCocktail
//
//  Created by 임준화 on 2021/12/29.
//

import RxFlow

enum TestStep: Step{
    
    case alert(title: String?, message: String?)
    case dismiss
    
    case cocktailListIsRequired
}
