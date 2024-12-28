//
//  TypeOperation.swift
//  tabviewexample
//
//  Created by Eddy Mendoza on 22/12/24.
//

import Foundation

struct TypeOperation {
    let id: String = UUID().uuidString
    let name: String
    let icon: String
    var isSystemIcon: Bool = true
}

let listOperationsFrecuently: [TypeOperation] = [
    TypeOperation(name: "send money", icon: "dollarsign.circle"),
    TypeOperation(name: "transfer savings", icon: "arrow.left.arrow.right"),
    TypeOperation(name: "recharge and withdraw", icon: "phonemoney", isSystemIcon: false),
    TypeOperation(name: "service payment", icon: "dollarsign.square"),
]
