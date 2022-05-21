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

extension CocktailListFlow{
    func mutate(action: Action) -> Observable<Mutation>{
        switch action {
        case let .fetchCocktail(query):
            return fetchCocktail(query: query)
        }
    }
}
extension CocktailListFlow{
    func reduce()
}
