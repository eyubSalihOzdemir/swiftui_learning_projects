//
//  FriendsView.swift
//  Users
//
//  Created by Salih Özdemir on 24.03.2023.
//

import SwiftUI

struct FriendsView: View {
    var friends: [Friend]
    
    var body: some View {
        List(friends) { friend in
            Text(friend.name)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct FriendsView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendsView()
//    }
//}
