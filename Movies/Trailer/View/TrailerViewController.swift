//
//  TrailerViewController.swift
//  Movies
//
//  Created by Seraphina Tatiana   on 11/02/21.
//

import UIKit
import Moya
import Alamofire


class TrailerViewController: BaseViewController {
    
    @IBOutlet weak var listTrailer: UITableView!
    
    var trailerModel : TrailerModel?
    var movie_id: String?
    var presenter : TrailerViewToPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        listTrailer.delegate = self
        listTrailer.dataSource = self
        
        let nibClass = UINib(nibName: "TrailerTableViewCell", bundle: nil)
        listTrailer.register(nibClass, forCellReuseIdentifier: "trailerIdentifier")
        presenter?.getTrailer()
    }
  
    @IBAction func backButton(_ sender: Any) { self.dismiss(animated: true, completion: nil)
    }
}

extension TrailerViewController: TrailerPresenterToViewProtocol {
    func showTrailer(trailerModel: TrailerModel) {
        self.trailerModel = trailerModel
        listTrailer.reloadData()
    }
    
    func showError() {
        debugPrint("Error")
    }
    
}

extension TrailerViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trailerModel?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTrailer.dequeueReusableCell(withIdentifier: "trailerIdentifier") as! TrailerTableViewCell
        
        let trailer: TrailerDetailModel = (trailerModel?.results[indexPath.row])!
        cell.trailerMovie.load(withVideoId: trailer.key)
        debugPrint(trailer.key)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
