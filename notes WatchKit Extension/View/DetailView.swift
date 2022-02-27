//
//  DetailView.swift
//  notes WatchKit Extension
//
//  Created by Harsh Goutam on 02/02/22.
//

import SwiftUI

struct DetailView: View {
    let Note : note
    let count: Int
    let index: Int
    
    @State private var isCreditsPresent: Bool = false
    @State private var isSettingPresent: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 3){
            Header()
            //content
            Spacer()
            ScrollView(.vertical){
                Text(Note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            Spacer()
            HStack(alignment: .center){
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingPresent.toggle()
                    }
                    .sheet(isPresented: $isSettingPresent,  content: {
                        Setting()
                    })
                Spacer()
                Text("\(count)/\(index+1)")
                Spacer()
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditsPresent.toggle()
                    }
                    .sheet(isPresented: $isCreditsPresent, content: {
                        CreditView()
                    })
            }
            
        }//vstack end
        .padding(3)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var sampleData: note = note(id: UUID(), text: "Hello World!")
    static var previews: some View {
        DetailView(Note: sampleData, count: 5, index: 1)
    }
}
