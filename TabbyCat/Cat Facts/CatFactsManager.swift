//
//  CatFactsManager.swift
//  TabbyCat
//
//  Created by Sabrina C. Sales on 21/08/2023.
//

import Foundation


class CatFactsManager: ObservableObject {
    
    let apiURL = URL(string: "https://catfact.ninja/fact")!
    
    @Published var catFact: CatFact?
    
    func getCatFact() { //main thread
        catFact = nil
        Task { //background thread
            let (data, _) =  try await URLSession.shared.data(from: apiURL)
            
            try await MainActor.run { //..aaand back to main thread 
                catFact = try JSONDecoder().decode(CatFact.self, from: data)
            }
        }
    }
}
