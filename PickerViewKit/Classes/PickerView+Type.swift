//
//  PickerView+Type.swift
//  PickerViewKit
//
//  Created by crelies on 19.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import Foundation

// MARK: - Adds a property to a `UIPickerView` which describes his type.
public extension UIPickerView {
	private struct AssociatedKeys {
		static var type = "Type"
	}
	
	var type: PickerViewType? {
		get {
			return objc_getAssociatedObject(self, &AssociatedKeys.type) as? PickerViewType
		}
		set {
			if let newValue = newValue {
				objc_setAssociatedObject(self, &AssociatedKeys.type, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
			}
		}
	}
}
