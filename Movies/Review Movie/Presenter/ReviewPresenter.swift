//
//  ReviewPresenter.swift
//  Movies
//
//  Created by Anaidyd Alcestfini on 29/03/21.
//

import Foundation

class ReviewPresenter: ReviewMovieViewToPresenterProtocol {
    weak var view: ReviewMoviePresenterToViewProtocol?
    
    var interactor: ReviewMoviePresenterToInteractorProtocol?
    
    var router: ReviewMoviePresenterToRouterProtocol?
    
    var context: ListMovieViewModel = ListMovieViewModel()
    
    func getReviewMovie() {
        interactor?.fetchReviewMovie(idMovie: context.idMovie)
    }
}


extension ReviewPresenter: ReviewMovieInteractorToPresenterProtocol {
    func reviewFetched(reviewModel: ReviewModel) {
        view?.showReviewMovie(reviewModel: reviewModel)

    }
    func reviewFetchedFailed() {
        view?.showError()
    }

}



