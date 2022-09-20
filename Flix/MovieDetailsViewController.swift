//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Angarag Gansukh on 9/19/22.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    var movie: [String:Any]!
    
    @IBOutlet weak var backdropView: UIImageView!
    
    
    @IBOutlet weak var posterView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var synopsisLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)!
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)!
        
        getData(url: backdropUrl, imageView:backdropView)
        getData(url: posterUrl, imageView:posterView)
        
    }
    
    func getData(url: URL, imageView: UIImageView) {
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, let uiImage = UIImage(data: data), error == nil else {
                print(error)
                return
            }
            DispatchQueue.main.async {
                imageView.image = uiImage
            }
        }
        task.resume()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
