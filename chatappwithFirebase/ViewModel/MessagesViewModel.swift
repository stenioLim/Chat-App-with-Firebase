//
//  MessagesViewModel.swift
//  chatappwithFirebase
//
//  Created by stenio Lima on 21/06/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessagesViewModel: ObservableObject {
    @Published private(set) var messages: [Message] = []
    @Published private(set) var lastMessageId = ""
    let db = Firestore.firestore()
    init(){
        getMessages()
    }
    func getMessages() {
        db.collection("Messages").addSnapshotListener{ querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(String(describing:error))")
                return
            }
            
            self.messages = documents.compactMap{ document -> Message? in
                do {
                    return try document.data(as: Message.self)
                    
                }catch{
                    print("Error decoding document into message: \(error)")
                    return nil
                }
                
            }
            self.messages.sort{$0.timestamp < $1.timestamp}
            if let id = self.messages.last?.id{
                self.lastMessageId = id
            }
        }
    }
    func sendMessage(text:String)
    {
        do{
            let newMessage = Message(id: "\(UUID())", text: text, received: false, timestamp: Date())
            try db.collection("Messages").document().setData(from:newMessage)
            
        }catch{
            print("Error adding mensage to Firestore: \(error)")
        }
    }}
