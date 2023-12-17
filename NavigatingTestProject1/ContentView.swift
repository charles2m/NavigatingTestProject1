//
//  ContentView.swift
//  NavigatingTestProject1
//
//  Created by Charles Martin Martinière on 17/12/2023.
//

import SwiftUI

struct ContentView: View {
    

    @State var isPresentend = false
    
    @State var shouldNavigateToChinese = false
    var body: some View {
        
        
        NavigationView {
            
            ZStack{
                NavigationLink("", destination: LearnChineseView(), isActive: $shouldNavigateToChinese)
                                   .hidden()
                Button {
                    isPresentend = true
                } label: {
                    Text("SheetView")
                }
                
            }
            .sheet(isPresented: $isPresentend) {  DetailsLocalisationView(isPresented: $isPresentend, shouldNavigateToChinese: $shouldNavigateToChinese)
            }
            
            
        }
    }
}

struct DetailsLocalisation_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
   

struct DetailsLocalisationView: View {
    @Binding var isPresented:Bool
    @Binding var shouldNavigateToChinese: Bool
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        
        .overlay(
            Button{
                self.isPresented = false
                self.shouldNavigateToChinese = true
            }label:{
                Image(systemName: "xmark")
                    .font(.headline)
                    .padding(16)
                    .background(.thickMaterial)
                    .cornerRadius(10)
                    .shadow(radius:4)
                    .padding()
            }
            
            , alignment: .topLeading)
        .padding()
    }
    
}
struct LearnChineseView: View {
    
    var body: some View {
        
        Text("Hello Chinese")
        
    }
}

struct LearnChineseView_Previews: PreviewProvider {
    static var previews: some View {
        LearnChineseView()
    }
}

