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
    
    private let disposeBag: DisposeBag = .init()
    var steps: PublishRelay<Step> = .init()
    
    enum Action{
        case fetchCocktail
    }
    enum Mutation{
        case setCocktail(_ drinks: [drinks])
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
        return NetworkManager.shared.getCocktail()
            .filterSuccessfulStatusCodes()
            .map(drinksResponse.self)
            .map{ $0.response }
            .catch { [weak self] err in
                print(err.localizedDescription)
                self?.steps.accept(TestStep.alert(title: "에러", message: "칵테일이 없다잉?"))
                return .never()
            }
            .asObservable()
            .map {Mutation.setCocktail($0)}
    }
}
