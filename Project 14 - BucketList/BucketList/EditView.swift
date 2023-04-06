//
//  EditView.swift
//  BucketList
//
//  Created by Salih Özdemir on 6.04.2023.
//

import SwiftUI

enum LoadingState {
    case loading, loaded, failed
}

struct EditView: View {
    @Environment(\.dismiss) var dismiss
    
    var location: Location

    @StateObject private var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Place name", text: $viewModel.name)
                    TextField("Description", text: $viewModel.description)
                }
                
                Section("Nearby...") {
                    switch viewModel.loadingState {
                    case .loading:
                        ProgressView()
                    case .loaded:
                        ForEach(viewModel.pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ") +
                            Text(page.description)
                                .italic()
                        }
                    case .failed:
                        Text("Please try again later.")
                    }
                }
            }
            .navigationTitle("Place details")
            .toolbar {
                Button("Save") {
                    onSave(viewModel.getNewLocation())
                    dismiss()
                }
            }
            .task {
                await viewModel.fetchNearbyPlaces()
            }
        }
    }
    
    init(location: Location, onSave: @escaping (Location) -> Void) {
        self.location = location
        self.onSave = onSave
        
        self._viewModel = StateObject(wrappedValue: ViewModel(location: location))
    }
    
    var onSave: (Location) -> Void
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(location: Location.example) { newLocation in }
    }
}
