//
//  ClearList.swift
//  ClearListSwiftUI
//
//  Created by Admin on 25/08/23.
//

import Foundation

struct ClearList<Data: RandomAccessCollection, Content: View>: View where Data.Element: Hashable {
    let data: Data
    let content: (Data.Element) -> Content
    init(data: Data, content: @escaping (Data.Element) -> Content) {
        UICollectionView.appearance().backgroundColor = .clear
        self.data = data
        self.content = content
    }

    var body: some View {
        List {
            ForEach(data, id: \.self) { element in
                content(element)
                    .listRowInsets(EdgeInsets())
            }
        }
    }
}
