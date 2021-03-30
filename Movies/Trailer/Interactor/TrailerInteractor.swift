//
//  TrailerInteractor.swift
//  Movies
//
//  Created by Anaidyd Alcestfini on 29/03/21.
//

import Foundation
import Alamofire
import Moya

class TrailerInteractor: TrailerPresenterToInteractorProtocol {
    
    var presenter: TrailerInteractorToPresenterProtocol?
    
    var trailer: TrailerModel?
    var movie_id: String!
    
    func fetchTrailer(idMovie: String) {
        let loggerConfig = NetworkLoggerPlugin.Configuration(logOptions: .verbose)
        let networkLogger = NetworkLoggerPlugin(configuration: loggerConfig)
        let provider = MoyaProvider<MovieApi>(plugins: [networkLogger])
        provider.request(.trailer(movieId: idMovie)) { [self] (result) in
            switch result {
            case .success(let response):
                do{
                    let trailers: TrailerModel = try response.map(TrailerModel.self)
                    self.presenter?.trailerFetched(trailerModel: trailers)
                    
                }
                catch {
                    debugPrint("error")
                }
                break
            case .failure(let error):
                debugPrint(error)
                break
                
            }
        }
    }
}


