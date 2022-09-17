//
//  AnimeModel.swift
//  animeapp
//
//  Created by YONCA YEPREM on 16.09.2022.
//

import Foundation

// MARK: - AnimeModel
struct AnimeModel: Codable {
    let success: Bool
    let data: [Anime]
}

// MARK: - Datum
struct Anime: Codable {
    let animeID: Int
    let animeName: String
    let animeImg: String

    enum CodingKeys: String, CodingKey {
        case animeID = "anime_id"
        case animeName = "anime_name"
        case animeImg = "anime_img"
    }
}
