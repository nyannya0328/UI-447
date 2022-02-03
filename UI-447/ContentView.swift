//
//  ContentView.swift
//  UI-447
//
//  Created by nyannyan0328 on 2022/02/03.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab : Int = 1
    var body: some View {
       
        TabView(selection: $currentTab) {
            
            
            ForEach(1...6,id:\.self){index in
                
                GeometryReader{proxy in
                    
                    
                    let minx = proxy.frame(in: .global).minX
                    
                    
                    Image("p\(index)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .offset(x: -minx)
                        .frame(width: getRect().width, height: getRect().height / 2)
                }
                .frame(height: getRect().height / 2)
                .padding(14)
                .cornerRadius(10)
                .background(.white)
                .shadow(color: .red.opacity(0.1), radius: 5, x: 5, y: 5)
                .shadow(color: .black.opacity(0.1), radius: 5, x: -5, y: -5)
                .padding(.horizontal,20)
                .cornerRadius(20)
                .overlay(alignment: .bottomTrailing) {
                    
                    Image("p\(index)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipped()
                        .clipShape(Circle())
                        .offset(x: -10)
                    
                    
                }
            }
            
            
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View{
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
}
