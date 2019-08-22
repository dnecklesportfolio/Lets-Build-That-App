//
//  Service.swift
//  AppStoreJSONAPis
//
//  Created by Dwayne Neckles on 8/20/19.
//  Copyright © 2019 Dwayne Neckles. All rights reserved.
//

import Foundation
class Service {
static let shared = Service()
    
    func fetchApps(searchTerm:String, completion:@escaping ([Result], Error?)->()) {
         print("finish getting apps from service layer")
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        guard let url = URL(string: urlString) else {return }
        //fetch data from internet
        URLSession.shared.dataTask(with: url) {(data, resp, err) in
            
            if let err = err {
                print("Failed to fetch apps: ", err)
                completion([],nil)
                return
            }
            
            //success
            guard let data = data else {return }
            
            do {
                let searchResult = try
                    JSONDecoder().decode(SearchResult.self, from:data)
                completion(searchResult.results, nil)
                  print("success decode json: ")
            }catch {
                print("Failed to decode json: ", error)
                completion([],error)
            }
            
            
            }.resume() //fires off the request
    }

}
