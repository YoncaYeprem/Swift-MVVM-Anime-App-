//
//  AnimeViewModel.swift
//  animeapp
//
//  Created by YONCA YEPREM on 16.09.2022.
//

import Foundation

protocol AnimeViewModelProtocol{
    var animeDidChange: ((Bool, Bool) -> Void)? { get set }
    
    func fetchAnimeList()
}

class AnimeViewModel:AnimeViewModelProtocol {
    
    var animeDidChange: ((Bool, Bool) -> Void)?
    
    var animeModel:AnimeModel? {
        didSet{
            self.animeDidChange!(true,false)
        }
    }
    
    func fetchAnimeList() {
        self.animeModel = nil
        
        ApiService.init().fetchAnime(params: nil, completionHandler: { result in
            switch result {
            case .success(let data):
                print(data.count)
                let mappedData = try? JSONDecoder().decode(AnimeModel.self, from: data) as AnimeModel
                self.animeModel = mappedData
                break
            case .failure(let error):
                print(error.description)
                
            }
        }, url:"https://anime-facts-rest-api.herokuapp.com/api/v1")
    }
    
    
}
