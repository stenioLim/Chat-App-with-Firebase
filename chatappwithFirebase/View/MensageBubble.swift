//
//  MensageBubble.swift
//  chatappwithFirebase
//
//  Created by stenio Lima on 20/06/24.
//

import SwiftUI

struct MessageBubble: View {
    var message: Message
    @State var showTime = false
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing){
            if showTime {
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .padding(message.received ? .leading : .trailing )
                    .font(.system(size: 13))
                    .foregroundColor(.gray.opacity(0.8))
            }
            HStack{
                Text(message.text)
                    .padding()
                    .background(message.received ? Color(.gray).opacity(0.3) : Color(.blue).opacity(0.7))
                    .foregroundColor(message.received ? Color(.black) : Color(.white))
                    .fontWeight(.semibold)
                    .cornerRadius(25)
                
                
                                
            }.frame(maxWidth: 300, alignment:  message.received ? .leading : .trailing)
                .onTapGesture {
                    showTime.toggle()
                }
            VStack(alignment:message.received ? .leading : .trailing){
                Circle()
                    .fill(message.received ? Color(.gray).opacity(0.3) : Color(.blue).opacity(0.7))
                    .frame(width: 10)
            }
        }
       
        .frame(maxWidth: .infinity, alignment:  message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing )
        .padding(.horizontal, 10)
    }
}

#Preview {
    MessageBubble(message: Message(id: "12345", text: "This message is test, i've been coding SwiftUI aplication", received: false , timestamp: Date()))
}
