//
//  PickerViewSetupError.swift
//  PickerViewKit
//
//  Created by crelies on 17.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import Foundation

public enum PickerViewSetupError: Error {
	case keyValueWrongNumberOfColumns
	
	var description: String {
		switch self {
			case .keyValueWrongNumberOfColumns:
				return "Key value picker view needs exactly 2 columns."
		}
	}
}
