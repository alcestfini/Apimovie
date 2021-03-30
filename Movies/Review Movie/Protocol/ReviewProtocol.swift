//
//  ReviewProtocol.swift
//  Movies
//
//  Created by Anaidyd Alcestfini on 29/03/21.
//

import Foundation
import UIKit

protocol ReviewMovieViewToPresenterProtocol: class {
    var view: ReviewMoviePresenterToViewProtocol? { get set }
    var interactor: ReviewMoviePresenterToInteractorProtocol? { get set }
    var router: ReviewMoviePresenterToRouterProtocol? { get set }
    var context: ListMovieViewModel { get set }
    
    func getReviewMovie()
}
// MARK: - View
protocol ReviewMoviePresenterToViewProtocol: class {
    func showReviewMovie(reviewModel : ReviewModel)
    func showError()
}
// MARK: - Interactor
protocol ReviewMoviePresenterToInteractorProtocol: class {
    var presenter: ReviewMovieInteractorToPresenterProtocol? { get set }
    var review: ReviewModel? { get }
    
    func fetchReviewMovie(idMovie: String)
}
// MARK: - Presenter
protocol ReviewMovieInteractorToPresenterProtocol: class {
    func reviewFetched(reviewModel : ReviewModel)
    func reviewFetchedFailed()
}
// MARK: - Router
protocol ReviewMoviePresenterToRouterProtocol: class {
    func navigateToListReview(view: ReviewMoviePresenterToViewProtocol)
}



