//
//  ApiClient.swift
//  BlueToothPrj
//
//  Created by EricM on 12/3/20.
//

import Foundation

//struct ApiClient {
//
//    func fetchCovidData(completion: @escaping (Result <[Country], Error>) -> ()){
//        let endpointUrl = "https://api.covid19api.com/summary"
//
//        guard let url = URL(string: endpointUrl) else {
//            print("bad url")
//            return
//        }
//
//        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let error = error {
//                return completion(.failure(error))
//            }
//            if let data = data {
//                do{
//                    let countries = try JSONDecoder().decode(Summary.self, from: data).countries
//                    return completion(.success(countries))
//                }
//                catch{
//                    completion(.failure(error))
//                }
//            }
//        }
//
//        dataTask.resume()
//    }
//}
