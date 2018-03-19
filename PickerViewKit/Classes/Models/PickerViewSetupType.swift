//
//  PickerViewSetupType.swift
//  PickerViewKit
//
//  Created by crelies on 19.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import Foundation

public enum PickerViewSetupType {
	case single(component: PickerViewComponent)
	case keyValue(components: [PickerViewComponent])
	case multi(components: [PickerViewComponent])
}

extension PickerViewSetupType: Equatable {
	public static func ==(lhs: PickerViewSetupType, rhs: PickerViewSetupType) -> Bool {
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
