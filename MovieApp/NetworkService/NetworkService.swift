//
//  NetworkService.swift
//  MovieApp
//
//  Created by Engkit on 11/08/23.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed(statusCode: Int)
    case decodingError
    case encodingError
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

class NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
    
    func performRequest<T: Decodable>(method: HTTPMethod = .get, url: URL) async throws -> T {
        let queryItems = [URLQueryItem(name: "api_key", value: AppConstants.apiKey)]
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = queryItems
        
        guard let finalURL = components?.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: finalURL)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
//        if let payload = payload {
//            do {
//                let encoder = JSONEncoder()
//                let payloadData = try encoder.encode(payload)
//                request.httpBody = payloadData
//            } catch {
//                throw NetworkError.encodingError
//            }
//        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse,
           (200..<300).contains(httpResponse.statusCode) {
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                return decodedData
            } catch let error {
                print(error)
                throw NetworkError.decodingError
            }
        } else {
            throw NetworkError.requestFailed(statusCode: (response as? HTTPURLResponse)?.statusCode ?? 0)
        }
    }
}
