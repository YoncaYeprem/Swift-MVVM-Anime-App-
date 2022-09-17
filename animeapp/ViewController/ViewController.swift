//
//  ViewController.swift
//  animeapp
//
//  Created by YONCA YEPREM on 16.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animeCollectionView: UICollectionView!
    
    let viewModel : AnimeViewModel = AnimeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
        fetchMovieList()
        // Do any additional setup after loading the view.
    }
    
    func prepareUI() {
           prepareCollectionView()
           prepareViewModelObserver()
       }
    
    
    func prepareCollectionView(){
        animeCollectionView.delegate = self
        animeCollectionView.dataSource = self
        animeCollectionView.register(UINib(nibName: "AnimeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AnimeCollectionViewCell")
    }
}

extension ViewController {
    
    func fetchMovieList() {
           viewModel.fetchAnimeList()
       }
       
       func prepareViewModelObserver() {
           self.viewModel.animeDidChange = { (finished, error) in
               if !error {
                   self.reloadCollection()
               }
           }
       }
       
       func reloadCollection() {
           self.animeCollectionView.reloadData()
       }
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.animeModel?.data.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell : AnimeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: AnimeCollectionViewCell.identifier, for: indexPath) as? AnimeCollectionViewCell else { fatalError("cell couldnt found")}
        let anime = viewModel.animeModel?.data[indexPath.row]
        cell.animeItem = anime
        return cell
    }
}
