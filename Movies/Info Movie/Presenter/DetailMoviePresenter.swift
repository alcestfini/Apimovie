//
//  GenrePresenter.swift
//  Movies
//
//  Created by Anaidyd Alcestfini on 26/03/21.
//

import Foundation

class DetailMoviePresenter: DetailMovieViewToPresenterProtocol {
    
    var view: DetailMoviePresenterToViewProtocol?
    var interactor: DetailMoviePresenterToInteractorProtocol?
    var router: DetailMoviePresenterToRouterProtocol?
    var context: ListMovieViewModel = ListMovieViewModel()
    
    func getDetailMovie() {
        interactor?.fetchDetailMovie(idMovie: context.idMovie)
    }
    
    func goToListReview(context: ListMovieViewModel) {
    guard let view = view else { return }
    router?.navigateToDetailMovie(view: view, context: context)
    }
    
    func goToTrailer(context: ListMovieViewModel) {
        guard let view = view else { return }
        router?.navigateToTrailerMovie(view: view, context: context)
    }
    
}
extension DetailMoviePresenter: DetailMovieInteractorToPresenterProtocol {
    func detailFetched(detailMovie: DetailModel) {
        view?.showDetailMovie(detailModel: detailMovie)
    }
    
    func detailFetchedFailed() {
        view?.showError()
    }
    
}


