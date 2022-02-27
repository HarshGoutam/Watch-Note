//
//  Header.swift
//  notes WatchKit Extension
//
//  Created by Harsh Goutam on 02/02/22.
//

import SwiftUI

struct Header: View {
    
    
    var title:String = ""
    var body: some View {
        VStack {
            //title
            if title != ""{
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
            }
            //seperator
            
            HStack{
                Capsule()
                    .frame(height:1)
                Image(systemName: "note.text")
                Capsule()
                    .frame(height:1)
            }
            .foregroundColor(.accentColor)
        }//vstack
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Header(title: "Credits")
            Header()
        }
    }
}
