//
//  ActivityDetailsView.swift
//  KeepTrack
//
//  Created by Salih Özdemir on 11.03.2023.
//

import SwiftUI

struct ActivityDetailsView: View {
    @ObservedObject var activities = Activities()
    var activityIndex: Int = 0
    
    // create some variables for user to be able to edit existing name and description
    
    var body: some View {
        VStack(alignment: .leading) {
            (activities.items[activityIndex].description != "" ? Text(activities.items[activityIndex].description) : nil)
            
            Divider()
                .padding(.vertical)
            
            Text("You did this \(activities.items[activityIndex].count) times so far.")
            
            Spacer()
            
            HStack {
                Spacer()
                
                Button("Increment") {
                    activities.items[activityIndex].count += 1
                }
            }
            .padding()
        }
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity
              //alignment: .topLeading
            )
        .padding()
        .navigationTitle(Text(activities.items[activityIndex].name))
    }
}

struct ActivityDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetailsView(activities: Activities(), activityIndex: 0)
    }
}
