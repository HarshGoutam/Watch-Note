//
//  Setting.swift
//  notes WatchKit Extension
//
//  Created by Harsh Goutam on 05/02/22.
//

import SwiftUI

struct Setting: View {
    //MARK: - PROPERTY'S
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var value: Float = 1.0
    //couses refresh of view
    
    //MARK: - Functions
    func update(){
        lineCount = Int(value)
    }
    
    
    //MARK: - BODY
    
    var body: some View {
        VStack(spacing: 8){
            //header
            Header(title: "Settings")
            //line count
            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.bold)
            //slider
            Slider(value: Binding(get: {
                self.value
            }, set: {(newValue) in
                self.value = newValue
                self.update()
            }), in: 1...4,step: 1)
                .accentColor(.accentColor)
        }//vstack
    }
}

struct Setting_Previews: PreviewProvider {
    static var previews: some View {
        Setting()
    }
}
