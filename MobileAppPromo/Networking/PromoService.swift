//
//  PromoService.swift
//  MobileAppPromo
//
//  Created by Evita Sihombing on 27/03/24.
//

import Foundation
import Alamofire

class PromoService {
    static let shared = PromoService()

    func fetchPromos(completion: @escaping (Result<[Promo], Error>) -> Void) {
        let url = "https://demo5853970.mockable.io/promos"
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let data):
                do {
                    guard let jsonDict = data as? [String: Any],
                          let promosDict = jsonDict["promos"] as? [[String: Any]] else {
                        throw AFError.responseSerializationFailed(reason: .decodingFailed(error: DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "Failed to decode JSON"))))
                    }
                    let jsonData = try JSONSerialization.data(withJSONObject: promosDict, options: [])
                    let promos = try JSONDecoder().decode([Promo].self, from: jsonData)
                    completion(.success(promos))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
