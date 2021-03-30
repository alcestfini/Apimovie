//
//  DetailMovieInteractor.swift
//  Movies
//
//  Created by Anaidyd Alcestfini on 26/03/21.
//

import Foundation
import Alamofire
import Moya


class DetailMovieInteractor: DetailMoviePresenterToInteractorProtocol {
    var detail: DetailModel?
    weak var presenter: DetailMovieInteractorToPresenterProtocol?

    
    func fetchDetailMovie(idMovie: String) {
        let loggerConfig = NetworkLoggerPlugin.Configuration(logOptions: .verbose)
        let networkLogger = NetworkLoggerPlugin(configuration: loggerConfig)

        let provider = MoyaProvider<MovieApi>(plugins: [networkLogger])
        provider.request(.detail(movieId: idMovie)) { [self] (result) in
            switch result {
            case .success(let response):
                do{
                    let details: DetailModel = try response.map(DetailModel.self)
                    self.presenter?.detailFetched(detailMovie: details)
                    
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
    
    

