//
//  ParentView.swift
//  practice2
//
//  Created by Admin on 10/15/26.
//

import SwiftUI

struct ParentView: View {
    @State var count = 0
    
    var body: some View {
        Text(String(count))
        Button("+1") {
            count += 1
        }
        .buttonStyle(.borderedProminent)
        
        ChildView(count: $count)
            .padding(100)
            .background(Color.brown)
    }
}

#Preview {
    ParentView()
}
