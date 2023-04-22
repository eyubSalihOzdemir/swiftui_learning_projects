//
//  TagsView.swift
//  Users
//
//  Created by Salih Özdemir on 24.03.2023.
//

import SwiftUI

struct TagsView: View {
    var tags: [String]
    
    var body: some View {
        List(tags, id: \.self) { tag in
            Text(tag)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct TagsView_Previews: PreviewProvider {
//    static var previews: some View {
//        TagsView()
//    }
//}
