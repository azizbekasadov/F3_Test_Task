//
//  ContentView.swift
//  F3_Test_App
//
//  Created by Azizbek Asadov on 08/02/21.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBarView(text: $searchText)
                    .padding([.leading, .trailing], 30)
                    .padding([.top, .bottom], 25)
                List {
                    ResultView()
                    ResultView()
                    ResultView()
                    ResultView()
                    ResultView()
                }
                .padding(.top, -20)
                .navigationBarTitle(Text("Library"))
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, -20)
            .foregroundColor(.white)
            .accentColor(.white)
        }
        .lineSpacing(0)
    }
}

struct ResultView: View {
    
    var results: [Result] = []
    
    var body: some View {
        HStack(alignment:.top, spacing: 20, content: {
            Image("ic_book")
                .frame(width: 80, height: 100, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .overlay(RoundedRectangle(cornerRadius: 6, style: .continuous)
                            .stroke(Color.gray.opacity(0.8), lineWidth: 0.5))
            VStack(alignment: .leading, spacing: 8, content: {
                Text("Title of the book. Университет Вестминистер 02.02.2021 числа в общем Мониторинге не видно этой транзакции только в Мониторинге карты видно.")
                    .font(.headline)
                    .foregroundColor(Color.black)
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
                    
                Text("Университет Вестминистер 02.02.2021 числа в общем Мониторинге не видно этой транзакции только в Мониторинге карты видно. Клиент уточнил с универа говорят что деньги не поступили 998903491662")
                    .font(.subheadline)
                    .foregroundColor(Color.gray.opacity(0.8))
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
            })
        })
        .padding([.top, .bottom], 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
