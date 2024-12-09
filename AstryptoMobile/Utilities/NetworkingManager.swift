//
//  NetworkingManager.swift
//  AstryptoMobile
//
//  Created by sstonn on 8/12/24.
//

import Foundation
import Combine

class NetworkingManager {
    enum NetworkingError: LocalizedError {
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(let url):
                return "[❌] Bad URL response from: \(url)"
            case .unknown:
                return "[❌] Unknown Error"
            }
        }
    }
    
    static func fetchData<T: Decodable>(
        url: URL
    ) -> AnyPublisher<T, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap{ try handleURLResponse(url: url, output: $0) }
            .receive(on: DispatchQueue.main)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    static func downloadImage(url: URL) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .userInitiated))
            .tryMap{ try handleURLResponse(url: url, output: $0) }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(url: URL, output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURLResponse(url: url)
        }
        
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>){
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print("Error: \(error.localizedDescription)")
            break
        }
    }
}
