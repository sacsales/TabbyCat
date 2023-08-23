//
//  CatBounceView.swift
//  TabbyCat
//
//  Created by Sabrina C. Sales on 21/08/2023.
//

import SwiftUI


struct CatBounceView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> CatBounceViewController {
        let storyboard = UIStoryboard(name: "CatBounceScreen", bundle: .main)
        
        if let viewController = storyboard.instantiateViewController(withIdentifier: "CatBounce") as? CatBounceViewController {
            
            return viewController
        } else {
            fatalError("Couldn't instantiate.")
        }
    }
    
    func updateUIViewController(_ uiViewController: CatBounceViewController, context: Context) {
        //empty
    }
}

struct CatBounceView_Previews: PreviewProvider {
    static var previews: some View {
        CatBounceView()
    }
}
