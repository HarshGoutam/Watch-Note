//
//  ContentView.swift
//  notes WatchKit Extension
//
//  Created by Harsh Goutam on 01/02/22.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Property
    @State private var notes: [note] = [note]()
    @State private var text: String = ""
    @AppStorage("lineCount") var lineCount:Int = 1
    
    //MARK: - FUNction
    func getDocumentDirectory() -> URL{
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    func save(){
//        dump(notes)
        do{
            let url = getDocumentDirectory().appendingPathComponent("notes")
            let data = try JSONEncoder().encode(notes)
            try data.write(to: url)
        }catch{
            print("SAving data failed!!")
        }
    }
    
    
    func load(){
        DispatchQueue.main.async {
            do{
                //url path
                let url = getDocumentDirectory().appendingPathComponent("notes")
                //property of data
                let data = try Data(contentsOf: url)
                //decode data and assighn it to property
                notes = try JSONDecoder().decode([note].self, from: data)
            }catch{
                //no problem if no data to load
            }
        }
    }
    
    
    func delete(offset: IndexSet){
        withAnimation{
            notes.remove(atOffsets: offset)
            save()
        }
    }
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6){
                TextField("Add New Note",text: $text)
                Button{
                    guard text.isEmpty == false else{return}
                    let Note = note(id: UUID(), text: text)
                    notes.append(Note)
                    text = ""
                    //action
                    save()
                }label:{
                    Image(systemName: "plus.circle")
                        .font(.system(size: 42,weight: .semibold))
                }
                .fixedSize()
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(.accentColor)
//                .buttonStyle(BorderedButtonStyle(tint: .accentColor))
            
            }
            Spacer()
            if notes.count >= 1 {
                List{
                    ForEach(0..<notes.count,id: \.self){ i in
                        NavigationLink(destination:DetailView(Note: notes[i], count: notes.count, index: i)) {
                            HStack{
                                Capsule()
                                    .frame(width: 4)
                                    .foregroundColor(.accentColor)
                                Text(notes[i].text)
                                    .lineLimit(lineCount)
                                    .padding(.leading,5)
                            }
                        }
                    }
                    .onDelete(perform: delete)
                }
            } else {
                Spacer()
                Image(systemName: "note.text")
                    .resizable()
                    .scaledToFit()
                    .opacity(0.25)
                    .padding(25)
                Spacer()
            }
//            Text("\(notes.count)")
            
        }
        .navigationTitle("Notes")
        
        .onAppear(perform: {
            load()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
