//
//  CocktailListReactor.swift
//  RxCocktail
//
//  Created by 임준화 on 2021/12/29.
//

import Foundation
import ReactorKit
import RxFlow
import RxCocoa

final class CocktailListReactor: Reactor,Stepper{
    
    var steps: PublishRelay<Step> = .init()
    private let disposeBag = DisposeBag()
    
    enum Action{
        case fetchCocktail
    }
    enum Mutation{
        case setCocktail([drinks])
    }
    struct State{
        var cockTails: [drinks] = []
    }
    var initialState: State = State()
    
}

extension CocktailListReactor{
    func mutate(action: Action) -> Observable<Mutation>{
        switch action {
        case .fetchCocktail:
            return fetchCocktail()
        default:
            return .empty()
        }
    }
}
extension CocktailListReactor{
    func fetchCocktail() -> Observable<Mutation>{
        return NetworkManager.shared.getCocktail(query: <#T##String#>)
            .filterSuccessfulStatusCodes()
            .map(AirQualityResponse.self)
            .map{ $0.response.body.items ?? [] }
            .catch { [weak self] err in
                print(err.localizedDescription)
                self?.steps.accept(TestStep.alert(title: "DustInGwangju", message: "몰?루"))
                return .never()
            }
            .asObservable()
            .map {Mutation.setAirQuality($0)}
    }
}
