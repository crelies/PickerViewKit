//
//  PickerViewComponent.swift
//  PickerViewKit
//
//  Created by crelies on 14.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import Foundation

public struct PickerViewComponent {
    let rows: [PickerViewRowProtocol]
    
    public init(rows: [PickerViewRowProtocol]) {
        self.rows = rows
    }
}
