//
//  NetworkLayer.swift
//  Random User
//
//  Created by Александр Иванов on 21.03.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func getPerson(completion: @escaping (Result<PersonResult?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    func getPerson(completion: @escaping (Result<PersonResult?, Error>) -> Void) {
        
        let urlString = "https://randomuser.me/api"
        guard let url = URL(string: urlString) else { return }
        
        //create urlsession task and resume it
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            //return if error
            if let error = error {
                completion(.failure(error))
                return
            }
            
            //return decodeded result in escaping completion
            do {
                let obj = try JSONDecoder().decode(PersonResult.self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
        
    }
    
    
}
