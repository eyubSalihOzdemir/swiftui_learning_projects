//
//  UserDetailView.swift
//  Users
//
//  Created by Salih Özdemir on 23.03.2023.
//

import SwiftUI
import MessageUI

struct UserDetailView: View {
    let user: CachedUser
    
    private let pasteboard = UIPasteboard.general
    
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(user.age), works at \(user.wrappedCompany).")
                .font(.headline)
                .padding(.horizontal)
            
            HStack {
                Text("\(user.wrappedEmail)")
                
                Spacer()
                
                Button {
                    pasteboard.string = user.email
                } label: {
                    Image(systemName: "doc.on.doc")
                }
            }
            .padding()
            
            Text("\(user.wrappedAbout)")
                .padding(.horizontal)
            
            List {
                Section {
                    Group {
                        if !user.friendsArray.isEmpty {
                            NavigationLink {
                                //FriendsView(friends: user.friends!)
                                FriendsView(friends: user.friendsArray)
                            } label: {
                                Text("Friends")
                            }
                        } else {
                            Text("No friends")
                        }
                    }
                    
                    Group {
                        if !user.tagsArray.isEmpty {
                            NavigationLink {
                                TagsView(tags: user.tagsArray)
                            } label: {
                                Text("Tags")
                            }
                        } else {
                            Text("No tags")
                        }
                    }
                }
                
                Button("Send Email") {
                    self.isShowingMailView.toggle()
                }
                .disabled(!MFMailComposeViewController.canSendMail())
                .sheet(isPresented: $isShowingMailView) {
                    MailView(result: self.$result)
                }
            }
            .listStyle(.insetGrouped)
            
            Text("Registered at: \(user.wrappedRegistered.formatted(date: .abbreviated, time: .shortened))")
                .font(.footnote)
                .frame(maxWidth: .infinity)
                .foregroundColor(.secondary)
        }
        .navigationTitle(user.wrappedName)
        .background(Color(UIColor.secondarySystemBackground))
    }
}

//struct UserDetailView_Previews: PreviewProvider {
//    @Environment(\.managedObjectContext) var moc
//
//    let myUser = User(id: "50a48fa3-2c0f-4397-ac50-64da464f9954", isActive: true, name: "Alford Rodriguez", age: 21, company: "Imkan", email: "alfordrodriguez@imkan.com", address: "907 Nelson Street, Cotopaxi, South Dakota, 5913", about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.", registered: Date.now, friends: [Friend(id: "91b5be3d-9a19-4ac2-b2ce-89cc41884ed0", name: "Hawkins Patel"), Friend(id: "0c395a95-57e2-4d53-b4f6-9b9e46a32cf6", name: "Jewel Sexton"), Friend(id: "be5918a3-8dc2-4f77-947c-7d02f69a58fe", name: "Berger Robertson")], tags: ["cillum","consequat","deserunt","nostrud","eiusmod","minim","tempor"])
//
//    let newUser = CachedUser
//    newUser.id = myUser.id
//    newUser.isActive = myUser.isActive
//    newUser.name = myUser.name
//    newUser.age = myUser.age
//    newUser.company = myUser.company
//    newUser.email = myUser.email
//    newUser.address = myUser.address
//    newUser.about = myUser.about
//    newUser.registered = myUser.registered
//    newUser.friends?.addingObjects(from: myUser.friends ?? [])
//    newUser.tags = myUser.tags?.joined(separator: ",") ?? ""
//
//    static var previews: some View {
//        NavigationView {
//            UserDetailView(user: newUser)
//        }
//    }
//}
