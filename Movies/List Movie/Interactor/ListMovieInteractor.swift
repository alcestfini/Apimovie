//
//  ListMovieInteractor.swift
//  Movies
//
//  Created by Anaidyd Alcestfini on 26/03/21.
//

import Foundation
import Alamofire
import Moya


class ListMovieInteractor: ListMoviePresenterToInteractorProtocol {
    weak var presenter: ListMovieInteractorToPresenterProtocol?
    
    var movie: MovieModel?

    
    func fetchMovie(idGenre: String) {
        let loggerConfig = NetworkLoggerPlugin.Configuration(logOptions: .verbose)
        let networkLogger = NetworkLoggerPlugin(configuration: loggerConfig)
        let provider = MoyaProvider<MovieApi>(plugins: [networkLogger])
        provider.request(.movie(genreId: idGenre)) { (result) in
            switch result {
            case .success(let response):
                do{
                    let movie: MovieModel = try response.map(MovieModel.self)
                    self.presenter?.movieFetched(movieModel: movie)
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
