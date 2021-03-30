//
//  MovieViewController.swift
//  Movies
//
//  Created by Seraphina Tatiana   on 09/02/21.
//

import UIKit
import Alamofire
import Moya

class MovieViewController: BaseViewController {
    @IBOutlet weak var listMovie: UITableView!
    @IBOutlet weak var backButton:
        UIBarButtonItem!
    
    var movieModel : MovieModel?
    var presenter : ListMovieViewToPresenterProtocol?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        listMovie.delegate = self
        listMovie.dataSource = self
        
       
        let nibClass = UINib(nibName: "MovieTableViewCell", bundle: nil)
        listMovie.register(nibClass, forCellReuseIdentifier: "movieIdentifier")
        presenter?.getListMovie()
        
    }
    
    @IBAction func backButton(_ sender: Any) { self.dismiss(animated: true, completion: nil)
    }
}
extension MovieViewController: ListMoviePresenterToViewProtocol{
    func showListMovie(movieModel : MovieModel){
        self.movieModel = movieModel
        listMovie.reloadData()
        self.removeSpinner()
    }
    func showError(){
        debugPrint("eror")
    }
}


extension MovieViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieModel?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listMovie.dequeueReusableCell(withIdentifier: "movieIdentifier") as! MovieTableViewCell
        
        let moviesModel: Result = (movieModel?.results[indexPath.row])!
        cell.titleMovie.text = moviesModel.title
        cell.overviewText.text = moviesModel.overview
        let listMovie = MovieTapGesture(target: self, action: #selector(MovieViewController.openDetail))
        cell.contentMovie.isUserInteractionEnabled = true
        listMovie.movie = String(moviesModel.id)
        cell.contentMovie.addGestureRecognizer(listMovie)
        
        return cell
    }
    @objc func openDetail(sender: MovieTapGesture){
        var context: ListMovieViewModel = ListMovieViewModel()
        context.idMovie = sender.movie
        presenter?.goToDetailMovie(context: context)
        
    }
}


