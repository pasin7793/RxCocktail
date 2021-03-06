//
//  AppFlow.swift
//  RxDust
//
//  Created by 임준화 on 2021/12/25.
//

import RxFlow
import RxRelay
import RxSwift

struct AppStepper: Stepper{
    let steps: PublishRelay<Step> = .init()
    private let disposeBag: DisposeBag = .init()
    
    func readyToEmitSteps() {
        steps.accept(TestStep.cocktailListIsRequired)
    }
}

final class AppFlow: Flow{
    var root: Presentable{
        return self.rootWindow
    }
    
    private let rootWindow: UIWindow
    init(
        with window: UIWindow
    ){
        self.rootWindow = window
    }
    
    deinit{
        print("\(type(of: self)): \(#function)")
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step.asTestStep else {return .none}
        
        switch step {
        case .cocktailListIsRequired:
            return coordinateToCockTailList()
        default:
            return .none
        }
    }
}

private extension AppFlow{
    func coordinateToCockTailList() -> FlowContributors{
        let flow = CocktailListFlow(with: .init())
        Flows.use(flow, when: .created){ [unowned self] root in
            self.rootWindow.rootViewController = root
        }
        let nextStep = OneStepper(withSingleStep: TestStep.cocktailListIsRequired)
        return .one(flowContributor: .contribute(withNextPresentable: flow, withNextStepper: nextStep))
    }
}
