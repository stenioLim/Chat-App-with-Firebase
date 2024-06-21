//
//  TitleRow .swift
//  chatappwithFirebase
//
//  Created by stenio Lima on 20/06/24.
//

import SwiftUI

struct TitleRow_: View {
    var imageURL = URL(string: "https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=2576&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
    var name = "Sufia Lim"
    
    var body: some View {
        HStack(spacing: 20){
            AsyncImage(url: imageURL) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
                
            }placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading){
                Text(name)
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    
                Text("online")
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Image(systemName: "phone.fill")
                .foregroundColor(.green)
                .padding(20)
                .background{
                    Circle()
                        .fill(.white)
                        .cornerRadius(50)
                        .shadow(radius: 5)
                }
        }.padding()
    }
}

#Preview {
    TitleRow_()
        .background(Color(.gray).opacity(0.1))
}
