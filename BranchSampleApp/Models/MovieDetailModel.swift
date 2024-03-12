//
//  MovieDetailModel.swift
//  BranchSampleApp
//
//  Created by Yashwanthi Manchala on 21/01/24.
//

import Foundation

struct MovieDetailModel : Identifiable, Hashable {
    let id: Int
    let title: String
    let director: String
    let coverImage: String
    let description: String
    let releaseDate: String
    let genre: String
    let price: Int
    let ratings: String
    var isFav: Bool = false
    var isBuy: Bool = false
    var isRent: Bool = false
    var buyPrice: Float
    var rentPrice: Float
}
