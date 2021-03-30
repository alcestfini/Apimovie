//
//  GenreViewController.swift
//  Movies
//
//  Created by Seraphina Tatiana   on 09/02/21.
//

import UIKit
import Alamofire
import Moya

class GenreViewController: BaseViewController {
    
    @IBOutlet weak var listGenre: UITableView!
    
    var genreModel : GenreModel!
    var presenter : GenreViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showSpinner(onView: self.view)
        
        listGenre.delegate = self
        listGenre.dataSource = self
        // self.showSpinner(onView: self.view)
        
        let nibClass = UINib(nibName: "GenreTableViewCell", bundle: nil)
        listGenre.register(nibClass, forCellReuseIdentifier: "genreIdentifier")
        presenter?.getGenre()
        
    }
    
}
extension GenreViewController: GenrePresenterToViewProtocol{
    func showGenre(genreModel : GenreModel){
        self.genreModel = genreModel
        listGenre.reloadData()
        self.removeSpinner()
    }
    func showError(){
        debugPrint("eror")
    }
}

extension GenreViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genreModel?.genres.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listGenre.dequeueReusableCell(withIdentifier: "genreIdentifier") as! GenreTableViewCell
        
        let genresModel: Genre = (genreModel?.genres[indexPath.row])!
        cell.genreLabel.text = genresModel.name
        
        
        let genreMovie = GenreTapGesture(target: self, action: #selector(GenreViewController.openMovie))
        cell.detailGenre.isUserInteractionEnabled = true
        genreMovie.genre = String(genresModel.id)
        cell.detailGenre.addGestureRecognizer(genreMovie)
        return cell
    }
    
    @objc func openMovie(sender: GenreTapGesture){
        var context: GenreViewModel = GenreViewModel()
        context.idGenre = sender.genre
        context.namaGenre = "tes"
        presenter?.goToListMovie(context: context)
    }
    
}


