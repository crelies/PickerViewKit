//
//  PickerViewType.swift
//  PickerViewKit
//
//  Created by crelies on 17.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import Foundation

public enum PickerViewType {
	case singleColumn
	case keyValueColumn
	case multiColumn
	
	init(pickerViewSetupType: PickerViewSetupType) {
		switch pickerViewSetupType {
			case .single:
				self = .singleColumn
			case .keyValue:
				self = .keyValueColumn
			case .multi:
				self = .multiColumn
		}
	}
}

extension PickerViewType: Equatable {
    public static func ==(lhs: PickerViewType, rhs: PickerViewType) -> Bool {
        switch (lhs, rhs) {
            case (.singleColumn, .singleColumn):
                return true
            case (.keyValueColumn, .keyValueColumn):
                return true
            case (.multiColumn, .multiColumn):
                return true
            default:
                return false
        }
    }
}
