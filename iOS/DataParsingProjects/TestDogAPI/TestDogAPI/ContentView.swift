//
//  ContentView.swift
//  TestDogAPI
//
//  Created by Joel Sereno on 10/4/23.
//

import SwiftUI

struct DogItem: Codable {
    let message: String
}


struct ContentView: View {
    
    @State var randomDogURL = ""
    
    @State var appURL = URL(string: "https://images.dog.ceo/breeds/poodle-toy/n02113624_2934.jpg")
    
    @State private var refreshScreen = false
    var body: some View {
        ZStack {
            Color.init(uiColor: UIColor.darkGray)
                .ignoresSafeArea()
            VStack {
                // using Apple example of error handling for AsyncImage
                AsyncImage(url: appURL) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(5)
                            .padding()
                        
                    } else if phase.error != nil {
                        Label("Could not load image", systemImage: "photo")
                            .foregroundColor(Color.red)
                    } else {
                        ProgressView("Loading...")
                            .foregroundColor(Color.white)
                            .tint(Color.white)
                        
                    }
                } // end AsyncImage
                
                Button {
                    grabLatestImage()
                } label: {
                    Text("🐶 Next Dog 📷")
                        .bold()
                        .font(.title)
                        .padding()
                        .padding([.horizontal], 30)
                        .background(Color.indigo)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
            } // end VStack
            .padding()
        }
    }
    
    
    func grabLatestImage(){
        
        var dogImage = ""
        // get JSON URL
        let url = URL(string: "https://dog.ceo/api/breeds/image/random")!
        
        // create URL request
        let urlRequest = URLRequest(url: url)
        
        // create URL Session task
        let task = URLSession.shared.dataTask(with: urlRequest) { data, reponse, error in
            
            if let data = data, let string = String(data: data, encoding: .utf8) {
                
                // convert string to Data format
                let DogData = Data(string.utf8)
                
                // create decoder and use it to decode based off of MenuList created earlier
                let decoder = JSONDecoder()
                let dogImageURLString = try! decoder.decode(DogItem.self, from: DogData)
                
                //print(dogImageURLString.message)
                appURL = URL(string: dogImageURLString.message)
                
                
            } else {
                print("unsuccessful decoding - data not valid")
            }
        }
        task.resume()
        
        //print("dogImage: \(dogImage)")
        //return dogImage
    }
}

#Preview {
    ContentView()
}
