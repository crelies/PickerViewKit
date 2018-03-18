//
//  PickerViewType.swift
//  PickerViewKit
//
//  Created by crelies on 17.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import Foundation

public enum PickerViewType {
	case single(component: PickerViewComponent)
	case keyValue(components: [PickerViewComponent])
	case multi(components: [PickerViewComponent])
}

extension PickerViewType: Equatable {
    public static func ==(lhs: PickerViewType, rhs: PickerViewType) -> Bool {
        switch (lhs, rhs) {
            case (.single(let lhsComponent), .single(let rhsComponent)):
                return lhsComponent == rhsComponent
            case (.keyValue(let lhsComponents), .keyValue(let rhsComponents)):
                return lhsComponents == rhsComponents
            case (.multi(let lhsComponents), .multi(let rhsComponents)):
                return lhsComponents == rhsComponents
            default:
                return false
        }
    }
}
