//
//  ContentView.swift
//  Users
//
//  Created by Salih Özdemir on 23.03.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showCachedSheet = false
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<CachedUser>
    
    @State private var downloadedUsers = [User]()
    @State private var loading = true
    
    var body: some View {
        NavigationView {
            switch loading {
            case true:
                ProgressView()
            case false:
                VStack {
                    List(users) { user in
                        NavigationLink {
                            UserDetailView(user: user)
                        } label: {
                            HStack {
                                Circle()
                                    .foregroundColor(user.isActive ? .green : .red)
                                    .frame(width: 7)

                                VStack(alignment: .leading) {
                                    Text(user.wrappedName)
                                    Text(user.wrappedCompany)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
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
            print("loading data from CACHE")
            
            // we have the data but we might want to update it, maybe later though
            
            loading = false
            return
        }
        
        // we do not have any data we must get it from the web
        // call getDataFromWeb
        
        print("loading data from WEB")
        
        await getDataFromWeb()
        if !downloadedUsers.isEmpty {
            downloadedUsers.forEach { user in
                let newUser = CachedUser(context: moc)
                newUser.id = user.id
                newUser.isActive = user.isActive
                newUser.name = user.name
                newUser.age = user.age
                newUser.company = user.company
                newUser.email = user.email
                newUser.address = user.address
                newUser.about = user.about
                newUser.registered = user.registered
                newUser.friends?.addingObjects(from: user.friends ?? [])
                newUser.tags = user.tags?.joined(separator: ",") ?? ""
                
                try? moc.save()
            }
        }
        
        loading = false
    }
    
    func getDataFromWeb() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Failed to convert URL!")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            if let decodedResponse = try? decoder.decode([User].self, from: data) {
                downloadedUsers = decodedResponse
            } else {
                print("Could not decode data!")
            }
        } catch {
            print("Invalid data!")
            return
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
