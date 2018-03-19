//
//  PickerViewType.swift
//  PickerViewKit
//
//  Created by crelies on 17.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import Foundation

public enum PickerViewType {
	case single
	case keyValue
	case multi
	
	init(pickerViewSetupType: PickerViewSetupType) {
		switch pickerViewSetupType {
			case .single:
				self = .single
			case .keyValue:
				self = .keyValue
			case .multi:
				self = .multi
		}
	}
}

extension PickerViewType: Equatable {
    public static func ==(lhs: PickerViewType, rhs: PickerViewType) -> Bool {
        switch (lhs, rhs) {
            case (.single, .single):
                return true
            case (.keyValue, .keyValue):
                return true
            case (.multi, .multi):
                return true
            default:
                return false
        }
    }
}
