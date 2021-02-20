//
//  Webservice.swift
//  CryptoCrazy
//
//  Created by yunus olgun on 19.02.2021.
//

import Foundation

class Webservice {
    
    func downloadCurrencies(url: URL, completion: @escaping ([CryptoCurrency]?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                
                if let cryptoList = cryptoList {
                    completion(cryptoList)
                }
            }
        }.resume()
    }
    
}
