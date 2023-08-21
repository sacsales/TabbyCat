//
//  CatFactsView.swift
//  TabbyCat
//
//  Created by Sabrina C. Sales on 21/08/2023.
//

import SwiftUI

struct CatFactsView: View {
    
    @StateObject var catFactsManager = CatFactsManager()
    
    var body: some View {
        VStack {
            if let catFact = catFactsManager.catFact {
                Text(catFact.fact)
                    .padding()
                Button {
                    catFactsManager.getCatFact()
                } label: {
                    Text("Generate new fact")
                        .padding()
                        .foregroundColor(.white)
                        .bold()
                        .background(.teal)
                        .cornerRadius(12)
                }
            } else {
                ProgressView()
                    .progressViewStyle(.circular)
            }
            
           
        }
        .onAppear() {
            catFactsManager.getCatFact()
        }
    }
}

struct CatFactsView_Previews: PreviewProvider {
    static var previews: some View {
        CatFactsView()
    }
}
