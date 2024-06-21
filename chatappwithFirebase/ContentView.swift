//
//  ContentView.swift
//  chatappwithFirebase
//
//  Created by stenio Lima on 20/06/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var messagesManager = MessagesViewModel()
    var body: some View {
        
        
        VStack {
            VStack {
                TitleRow_()
                    .background(Color(.gray).opacity(0.1))
                ScrollViewReader { proxy in 
                    ScrollView{
                        ForEach(messagesManager.messages, id: \.id) { Messages in
                            MessageBubble(message: Messages)
                        }
                    }
                    .padding(.top, 20)
                    .background(.white)
                    .onChange(of: messagesManager.lastMessageId ){ id in
                        withAnimation{
                            proxy .scrollTo(id, anchor: .bottom)
                }
                    
            }
                        
        }
                        
    }
                    
}
           
            MessageField()
            .environmentObject(messagesManager)
        }
        
    }
                              


#Preview {
    ContentView()
}
