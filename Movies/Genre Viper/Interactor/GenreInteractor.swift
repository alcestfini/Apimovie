//
//  GenreInteractor.swift
//  Movies
//
//  Created by Anaidyd Alcestfini on 26/03/21.
//

import Foundation
import Alamofire
import Moya


class GenreInteractor: GenrePresenterToInteractorProtocol {
    var presenter: GenreInteractorToPresenterProtocol?
    
    var genre: GenreModel?
    
    func fetchGenre() {
        let loggerConfig = NetworkLoggerPlugin.Configuration(logOptions: .verbose)
        let networkLogger = NetworkLoggerPlugin(configuration: loggerConfig)
        let provider = MoyaProvider<MovieApi>(plugins: [networkLogger])
        provider.request(.genre(apikey: "API_KEY")) { (result) in
            switch result {
            case .success(let response):
                do{
                    let genres: GenreModel = try response.map(GenreModel.self)
                    self.presenter?.genreFetched(genreModel: genres)
                }
                catch {
                    debugPrint("error")
                }
                break
            case .failure(_):
                self.presenter?.genreFetchedFailed()
                break
            }
        }
        
    }
    

    }
