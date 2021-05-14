//
//  ContentView.swift
//  Shared
//
//  Created by Seogun Kim on 2021/05/14.
//

import SwiftUI

struct ContentView: View {
    
    @State var title: String? = nil
    @State var isLoading: Bool = false
    @State var currentID: String? = "Seogun123"
    
    // MARK: BODY
    var body: some View {
        NavigationView {
            VStack {
                Text("안녕하세요 서근 개발 블로그입니다.")
                
                if let text = title {
                    Text(text)
                }
                
                if isLoading {
                    ProgressView()
                }
                
                Text(isLoading.description)
                    .foregroundColor(isLoading ? Color.blue : Color.red)
                
            }
            .navigationBarTitle("Safe Coding")
            
            .onAppear {
                data2()
            }
        }
    }
    func data() {
        
        if let userID = currentID {
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                title = "로그인 되어있는 아이디 : \(userID)"
                isLoading = false
            }
        } else {
            title = "계속하려면 로그인해주세요."
        }
    }
    
    func data2() {
        guard let userID = currentID else {
            title = "계속하려면 로그인해주세요."
            return
        }
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            title = "로그인 되어있는 아이디 : \(userID)"
            isLoading = false
        }
    }
}

// MARK: PRESVIVEWS
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
