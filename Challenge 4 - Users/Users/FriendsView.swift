//
//  FriendsView.swift
//  Users
//
//  Created by Salih Özdemir on 24.03.2023.
//

import SwiftUI

struct FriendsView: View {
    var friends: [CachedFriend]
    
    var body: some View {
        List(friends) { friend in
            Text(friend.wrappedName)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct FriendsView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendsView()
//    }
//}
