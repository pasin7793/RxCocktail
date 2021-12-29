//
//  AppFlow.swift
//  RxCocktail
//
//  Created by 임준화 on 2021/12/29.
//

import RxFlow
import RxRelay
import RxSwift

struct AppStepper: Stepper{
    let steps: PublishRelay<Step> = .init()
    private let disposeBag: DisposeBag = .init()
    
    func readyToEmitSteps() {
        Observable.just(TestStep.mainTabbarIsRequired)
            .bind(to: steps)
            .disposed(by: disposeBag)
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
        case .mainTabbarIsRequired:
            return coordinateToMainTabbar()
        default:
            return .none
        }
    }
}

private extension AppFlow{
    func coordinateToMainTabbar() -> FlowContributors{
        let flow =
    }
}
