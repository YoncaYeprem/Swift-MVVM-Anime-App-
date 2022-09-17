//
//  AnimeCollectionViewCell.swift
//  animeapp
//
//  Created by YONCA YEPREM on 16.09.2022.
//

import UIKit
import Kingfisher

class AnimeCollectionViewCell: UICollectionViewCell {

    static let identifier = "AnimeCollectionViewCell"
    
    @IBOutlet weak var animeLabel: UILabel!
    @IBOutlet weak var animeImage: UIImageView!
    
    var animeItem:Anime? {
        didSet {
            if let anime = animeItem {
                self.animeLabel.text = anime.animeName.replacingOccurrences(of: "_", with: " ").capitalized
                self.animeImage.kf.setImage(with: URL(string: anime.animeImg))
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
