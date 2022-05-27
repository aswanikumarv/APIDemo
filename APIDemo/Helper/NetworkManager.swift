//
//  NetworkManager.swift
//  TableWithJson
//
//  Created by Ashwin  on 23/02/22.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData<T: Decodable>(urlString: String, completion: @escaping (Result<T, CustomError>) -> ()) {
        
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                completion(.failure(.sessionError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.unexpected(code: 100)))
                return
            }
            
            do {
                let parsedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(parsedData))
            }
            catch {
                print("error while parsing data")
                completion(.failure(.dataParsingError))
                return
            }
            
        }.resume()
    }
}
