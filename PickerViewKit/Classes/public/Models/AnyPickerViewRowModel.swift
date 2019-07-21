//
//  AnyPickerViewRowModel.swift
//  PickerViewKit
//
//  Created by crelies on 21.07.19.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import Foundation

public struct AnyPickerViewRowModel {
    private let isEqualTo: (AnyPickerViewRowModel) -> Bool
    public let value: Any
    
    public init<T: Equatable>(_ value: T) {
        self.value = value
        self.isEqualTo = { anotherModel in
            guard let anotherModel = anotherModel as? T else {
                return false
            }
            
            return value == anotherModel
        }
    }
}

extension AnyPickerViewRowModel: Equatable {
    public static func ==(lhs: AnyPickerViewRowModel, rhs: AnyPickerViewRowModel) -> Bool {
        return lhs.isEqualTo(rhs)
    }
}
