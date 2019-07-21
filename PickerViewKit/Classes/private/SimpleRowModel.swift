//
//  SimpleRowModel.swift
//  PickerViewKit
//
//  Created by crelies on 23.09.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import Foundation

struct SimpleRowModel {
    let name: String
}

extension SimpleRowModel: Equatable {
    static func ==(lhs: SimpleRowModel, rhs: SimpleRowModel) -> Bool {
        return lhs.name == rhs.name
    }
}
