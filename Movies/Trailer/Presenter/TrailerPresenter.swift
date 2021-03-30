//
//  TrailerPresenter.swift
//  Movies
//
//  Created by Anaidyd Alcestfini on 29/03/21.
//

import Foundation

class TrailerPresenter: TrailerViewToPresenterProtocol {
    var view: TrailerPresenterToViewProtocol?
    
    var interactor: TrailerPresenterToInteractorProtocol?
    
    var router: TrailerPresenterToRouterProtocol?
    var context: ListMovieViewModel = ListMovieViewModel()
    func getTrailer() {
        interactor?.fetchTrailer(idMovie: context.idMovie)
    }
    
    func goToListTrailer() {
        guard let view = view else { return }
        router?.navigateToListTrailer(view: view)
    }
}
    
extension TrailerPresenter: TrailerInteractorToPresenterProtocol {
    func trailerFetched(trailerModel: TrailerModel) {
        view?.showTrailer(trailerModel: trailerModel)
    }
    
    func trailerFetchedFailed() {
        view?.showError()
    }
    
        
    }
    

