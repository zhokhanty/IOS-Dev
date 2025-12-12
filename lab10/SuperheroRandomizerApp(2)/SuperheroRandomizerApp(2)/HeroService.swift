//
//  HeroService.swift
//  SuperheroRandomizerApp(2)
//
//  Created by Zhalgas Bagytzhan on 09.12.2025.
//

import Foundation

protocol HeroServiceDelegate: AnyObject {
    func onHeroDidUpdate(model: HeroModel)
    func onHeroFetchFailed(error: String)
}

class HeroService {
    weak var delegate: HeroServiceDelegate?
    var currentHero: HeroModel?
    
    func fetchRandomHero() {
        let randomId = Int.random(in: 1...563)
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(randomId).json"
        
        guard let url = URL(string: urlString) else {
            delegate?.onHeroFetchFailed(error: "Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            if let error = error {
                DispatchQueue.main.async {
                    self?.delegate?.onHeroFetchFailed(error: error.localizedDescription)
                }
                return
            }
            
            guard let data = data,
                  let hero = try? JSONDecoder().decode(HeroModel.self, from: data) else {
                DispatchQueue.main.async {
                    self?.delegate?.onHeroFetchFailed(error: "Failed to decode data")
                }
                return
            }
            
            DispatchQueue.main.async {
                self?.delegate?.onHeroDidUpdate(model: hero)
            }
        }.resume()
    }
    
    func fetchImage(from urlString: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            DispatchQueue.main.async {
                completion(data)
            }
        }.resume()
    }
}
