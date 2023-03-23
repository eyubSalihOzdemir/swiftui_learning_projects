//
//  CandiesCountriesView.swift
//  CoreDataProject
//
//  Created by Salih Özdemir on 20.03.2023.
//

import SwiftUI

struct CandiesCountriesView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var countries: FetchedResults<Country>
    
    var body: some View {
        VStack(spacing: 0) {
            List {
                ForEach(countries, id: \.self) { country in
                    Section(country.wrappedFullName) {
                        ForEach(country.candyArray, id: \.self) { candy in
                            Text(candy.wrappedName)
                        }
                    }
                }
            }
            
            Button("Add Examples") {
                let countryUK = Country(context: moc)
                countryUK.shortName = "UK"
                countryUK.fullName = "United Kingdom"
                
                let countryCH = Country(context: moc)
                countryCH.shortName = "CH"
                countryCH.fullName = "Switzerland"
                
                let candy1 = Candy(context: moc)
                candy1.name = "Mars"
                candy1.origin = countryUK
                
                let candy2 = Candy(context: moc)
                candy2.name = "KitKat"
                candy2.origin = countryUK
                
                let candy3 = Candy(context: moc)
                candy3.name = "Twix"
                candy3.origin = countryUK
                
                let candy4 = Candy(context: moc)
                candy4.name = "Toblerone"
                candy4.origin = countryCH
                
                try? moc.save()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CandiesCountriesView_Previews: PreviewProvider {
    static var previews: some View {
        CandiesCountriesView()
    }
}
