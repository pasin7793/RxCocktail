//
//  CocktailListFlow.swift
//  RxCocktail
//
//  Created by 임준화 on 2021/12/29.
//

import RxFlow
import RxRelay

struct CockTailListStepper: Stepper{
    let steps: PublishRelay<Step> = .init()
    
    var initialStep: Step{
        return TestStep.cocktailListIsRequired
    }
}

final class CocktailListFlow: Flow{
    var root: Presentable{
        return self.rootVC
    }
    
    let stepper: CockTailListStepper
    private let rootVC = UINavigationController()
    
    init(
        with stepper: CockTailListStepper
    ){
        self.stepper = stepper
    }
    deinit {
        print("\(type(of: self)): \(#function)")
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step.asTestStep else {return .none}
        switch step {
        case .cocktailListIsRequired:
            return coordinateToCocktailList()
        default:
            return .none
        }
    }
}

private extension CocktailListFlow{
    func coordinateToCocktailList() -> FlowContributors{
        let reactor = CocktailListReactor()
        let vc = CocktialListVC(reactor: reactor)
        self.rootVC.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: reactor))
    }
}
