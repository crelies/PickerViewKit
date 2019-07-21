//
//  MockPickerViewRowModel.swift
//  PickerViewKit_Tests
//
//  Created by crelies on 18.03.18.
//  Copyright © 2018 Christian Elies. All rights reserved.
//

import Foundation
import PickerViewKit

struct MockPickerViewRowModel {
    let name: String
}

extension MockPickerViewRowModel: Equatable {
    public static func ==(lhs: MockPickerViewRowModel, rhs: MockPickerViewRowModel) -> Bool {
        return lhs.name == rhs.name
    }
}
