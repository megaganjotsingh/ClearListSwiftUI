//
//  ClearLazy.swift
//  ClearListSwiftUI
//
//  Created by Admin on 25/08/23.
//

import Foundation

struct ClearLazyVList<Data: RandomAccessCollection, Content: View>: View where Data.Element: Hashable {
    let data: Data
    let content: (Data.Element) -> Content
    let column: [GridItem]
    let spacing: CGFloat
    
    init(data: Data, column: [GridItem], spacing: CGFloat, content: @escaping (Data.Element) -> Content) {
        UICollectionView.appearance().backgroundColor = .clear
        self.data = data
        self.content = content
        self.column = column
        self.spacing = spacing
    }

    var body: some View {
        LazyVGrid(columns: column, spacing: spacing) {
            ForEach(data, id: \.self) { element in
                content(element)
                    .listRowInsets(EdgeInsets())
            }
        }
    }
}
