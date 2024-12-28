//
//  OperationComponent.swift
//  tabviewexample
//
//  Created by Eddy Mendoza on 22/12/24.
//

import SwiftUI

struct ItemOperation: View {
    
    let operation : TypeOperation
    
    var body: some View {
        VStack {
            ImageOperation(isSystemIcon: operation.isSystemIcon, icon: operation.icon)
            
            let textFormat = String(format: NSLocalizedString(operation.name, comment: ""))
            
            Text(textFormat)
                .padding(.horizontal, 8)
                .padding(.top, 4)
                .font(.caption)
        }
        .frame(width: 72, height: 112, alignment: .top)
    }
}

#Preview("Item Operation"){
    ItemOperation(operation: listOperationsFrecuently[1])
}

struct ImageOperation: View {
    
    var isSystemIcon: Bool = true
    
    let icon: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray, lineWidth: 1)
                .opacity(0.2)
                .frame(width: 52, height: 52)
                
            if isSystemIcon {
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.cyan)
                    .frame(height: 24)
            } else {
                Image(icon)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.cyan)
                    .frame(height: 24)
            }
        }
    }
}

#Preview {
    ImageOperation(isSystemIcon: false, icon: "phonemoney")
}
