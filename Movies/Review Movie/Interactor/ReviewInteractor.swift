//
//  ReviewInteractor.swift
//  Movies
//
//  Created by Anaidyd Alcestfini on 29/03/21.
//

import Foundation
import Alamofire
import Moya


class ReviewInteractor: ReviewMoviePresenterToInteractorProtocol {
    var presenter: ReviewMovieInteractorToPresenterProtocol?
    var review: ReviewModel?

    func fetchReviewMovie(idMovie: String) {
        let loggerConfig = NetworkLoggerPlugin.Configuration(logOptions: .verbose)
        let networkLogger = NetworkLoggerPlugin(configuration: loggerConfig)
        let provider = MoyaProvider<MovieApi>(plugins: [networkLogger])
        provider.request(.review(movieId: idMovie)) { [self] (result) in
            switch result {
            case .success(let response):
                do{
                    let reviews: ReviewModel = try response.map(ReviewModel.self)
                    self.presenter?.reviewFetched(reviewModel: reviews)
//                    self.reviewModel = reviews
//                    self.listReview.reloadData()
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
