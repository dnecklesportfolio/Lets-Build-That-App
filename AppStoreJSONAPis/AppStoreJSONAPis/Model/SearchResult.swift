//
//  SearchResult.swift
//  AppStoreJSONAPis
//
//  Created by Dwayne Neckles on 8/20/19.
//  Copyright © 2019 Dwayne Neckles. All rights reserved.
//

import Foundation
//then create structs to model each result
struct SearchResult:Decodable  {
    let resultCount: Int
    let results:[Result]
   
}
struct Result:Decodable {
    let trackName: String
    let primaryGenreName:String
    var averageUserRating:Float? // incase it doesnt have a rating
    let artworkUrl100:String //app icon
    let screenshotUrls:[String]
}
