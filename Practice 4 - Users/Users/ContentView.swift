//
//  ContentView.swift
//  Users
//
//  Created by Salih Özdemir on 23.03.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    @State private var loading = true
    
    var body: some View {
        NavigationView {
            switch loading {
            case true:
                ProgressView()
            case false:
                List(users) { user in
                    NavigationLink {
                        UserDetailView(user: user)
                    } label: {
                        HStack {
                            Circle()
                                .foregroundColor(user.isActive ? .green : .red)
                                .frame(width: 7)
                            
                            VStack(alignment: .leading) {
                                Text(user.name)
                                Text(user.company)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                .navigationTitle("Users")
            }
        }
        .onAppear() {
            Task {
                await loadUsers()
            }
        }
    }
    
    
    func loadUsers() async {
        loading = true
        
        if !users.isEmpty {
            return
        }
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Failed to convert URL!")
            loading = false
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            if let decodedResponse = try? decoder.decode([User].self, from: data) {
                users = decodedResponse
            } else {
                print("Could not decode data!")
            }
            
            loading = false
        } catch {
            print("Invalid data!")
            loading = false
            return
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
