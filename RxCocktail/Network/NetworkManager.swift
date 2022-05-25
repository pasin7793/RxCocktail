//
//  NetworkManager.swift
//  RxCocktail
//
//  Created by 임준화 on 2021/12/29.
//

import Moya
import RxSwift

protocol NetworkManagerType: class{
    func getCocktail() -> Single<Response>
}

final class NetworkManager: NetworkManagerType{
    private let provider = MoyaProvider<CocktailAPI>()
    static let shared = NetworkManager()
    
    func getCocktail() -> Single<Response> {
        return provider.rx.request(.getCocktail, callbackQueue: .global())
    }
}
