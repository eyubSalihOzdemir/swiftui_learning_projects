//
//  ContentView.swift
//  KeepTrack
//
//  Created by Salih Özdemir on 11.03.2023.
//

import SwiftUI

struct CardView: View {
    var activityName: String
    var description: String
    var count: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(activityName)
                    .font(.title2)
                    .multilineTextAlignment(.leading)
                
                (description != "" ? Text(description) : nil)
                    .multilineTextAlignment(.leading)
            }
            
            Spacer()
            
            Text("\(count)")
                .font(.title3)
                .padding([.horizontal], 10)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray.opacity(0.5)))
        .background(.gray.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(10)
    }
}

struct ContentView: View {
    @StateObject var activities = Activities()

    @State private var showAddActivitySheet = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(Array(activities.items.enumerated()), id: \.element) { index, element in
                    NavigationLink {
                        ActivityDetailsView(activities: activities, activityIndex: index)
                    } label: {
                        CardView(activityName: element.name, description: element.description, count: element.count)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .navigationTitle("KeepTrack")
            .toolbar {
                ToolbarItem {
                    Button {
                        showAddActivitySheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddActivitySheet) {
                AddActivityView(activites: activities)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
