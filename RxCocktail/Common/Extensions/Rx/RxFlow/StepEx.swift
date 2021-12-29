//
//  StepEx.swift
//  RxCocktail
//
//  Created by 임준화 on 2021/12/29.
//

import RxFlow

extension Step{
    var asTestStep: TestStep?{
        return self as? TestStep
    }
}
