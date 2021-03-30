


import Foundation
import UIKit

class ListMovieRouter: ListMoviePresenterToRouterProtocol{
    func navigateToListMovie(view: ListMoviePresenterToViewProtocol, context: ListMovieViewModel)  {
        if let view = view as? UIViewController {
            let viewController = MovieConfigurator.shared.createDetailModule(context: context)
            viewController.modalPresentationStyle = .fullScreen
            view.present(viewController, animated: true, completion: nil)
        }
    }
}
