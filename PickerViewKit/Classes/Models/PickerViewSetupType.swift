//
//  PickerViewSetupType.swift
//  PickerViewKit
//
//  Created by crelies on 19.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import Foundation

public enum PickerViewSetupType {
	case single(column: PickerViewColumn)
	case keyValue(columns: [PickerViewColumn])
	case multi(columns: [PickerViewColumn])
}

extension PickerViewSetupType: Equatable {
	public static func ==(lhs: PickerViewSetupType, rhs: PickerViewSetupType) -> Bool {
		switch (lhs, rhs) {
			case (.single(let lhsColumn), .single(let rhsColumn)):
				return lhsColumn == rhsColumn
			case (.keyValue(let lhsColumns), .keyValue(let rhsColumns)):
				return lhsColumns == rhsColumns
			case (.multi(let lhsColumns), .multi(let rhsColumns)):
				return lhsColumns == rhsColumns
			default:
				return false
		}
	}
}
