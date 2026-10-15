//
//  ChildView.swift
//  practice2
//
//  Created by Admin on 10/15/26.
//

import SwiftUI

struct ChildView: View {
    @Binding var count: Int
    
    var body: some View {
        Text(String(count))
        Button("+1") {
            count += 1
        }
        .buttonStyle(.borderedProminent)
    }
}

//#Preview {
//    ChildView(count: 0)
//}
