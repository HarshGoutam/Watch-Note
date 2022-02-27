//
//  CreditView.swift
//  notes WatchKit Extension
//
//  Created by Harsh Goutam on 02/02/22.
//

import SwiftUI

struct CreditView: View {
    // MARK: - propertys
    var body: some View {
        VStack(spacing:3){
            //profile
            
            //header
            Header(title: "Credits")

            
            //content
            
            Text("Harsh Goutam")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            Text("developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
        }//vstack
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}
