//
//  CocktailAPI.swift
//  RxCocktail
//
//  Created by 임준화 on 2021/12/29.
//

import Moya

enum CocktailAPI{
    case getCocktail(String)
}

extension CocktailAPI: TargetType{
    
    var baseURL: URL{
        return URL(string: "www.thecocktaildb.com")!
    }
    var path: String{
        switch self {
        case .getCocktail:
            return "/api/json/v1/1/search.php?f=a"
        }
    }
    
    var method: Method{
        switch self {
        case .getCocktail:
            return .get
        }
    }
    var task: Task{
        switch self {
        case let .getCocktail(query):
            return .requestParameters(parameters: ["query":query], encoding: URLEncoding.queryString)
        }
    }
    var headers: [String : String]? {
        return nil
    }
}
