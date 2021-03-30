


import Foundation
import UIKit

class ListMovieRouter: ListMoviePresenterToRouterProtocol{
     func navigateToListMovie(view: ListMoviePresenterToViewProtocol)  {
        if let view = view as? UIViewController {
        //    let viewController = MovieConfigurator.shared.createDetailModule()
          //  view.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
