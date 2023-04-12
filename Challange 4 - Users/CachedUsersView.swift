//
//  CachedUsersView.swift
//  Users
//
//  Created by Salih Özdemir on 28.03.2023.
//

import SwiftUI

struct CachedUsersView: View {
    var users: FetchedResults<CachedUser>
    
    var body: some View {
        VStack {
            List(users) { user in
                Text(user.wrappedName)
            }
        }
    }
}

//struct CachedUsersView_Previews: PreviewProvider {
//    static var previews: some View {
//        CachedUsersView(users: [])
//    }
//}
