//
//  NetworkManager.swift
//  RxCocktail
//
//  Created by 임준화 on 2021/12/29.
//

import Moya
import RxSwift

protocol NetworkManagerType: class{
    func getCocktail(query: String) -> Observable<Response>
    var provider: MoyaProvider<CocktailAPI> {get}
}

final class NetworkManager: NetworkManagerType{
    
    var provider: MoyaProvider<CocktailAPI> = .init()
    static let shared = NetworkManager()
    
    func getCocktail(query: String) -> Observable<Response> {
        return provider.rx.request(.getCocktail(query), callbackQueue: .main).asObservable()
    }
}
