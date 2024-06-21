//
//  MessageField.swift
//  chatappwithFirebase
//
//  Created by stenio Lima on 21/06/24.
//

import SwiftUI

struct MessageField: View {
    @EnvironmentObject var messageManeger: MessagesViewModel
    @State private var message = ""
    
    var body: some View {
        HStack{
        CustomTextField(placeholder: Text("Enter your message"), text: $message )
                
            
            Button{
                messageManeger.sendMessage(text: message)
                message = ""
            }label: {
                Image(systemName: "arrow.up.circle.fill")
                    .font(.system(size: 25))
            } 
            
        }
        .padding()
        .background(.gray.opacity(0.1))
        .cornerRadius(30)
        .padding()
    }
}


struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var edtingChanged: (Bool) -> () = {_ in}
    var commit: () -> () = {}
    
    var body: some View{
        ZStack(alignment: .leading){
            if text.isEmpty {
                placeholder
                    .opacity(0.5)
                
            }
            TextField( "", text: $text, onEditingChanged:  edtingChanged, onCommit: commit)
                
        }
    }
}

#Preview {
    MessageField()
}
