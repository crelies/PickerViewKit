//
//  PickerViewSetupError.swift
//  PickerViewKit
//
//  Created by crelies on 17.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import Foundation

public enum PickerViewSetupError: Error {
	case keyValueWrongNumberOfComponents
	
	var description: String {
		switch self {
			case .keyValueWrongNumberOfComponents:
				return "Key value picker view needs exactly 2 components."
		}
	}
}
