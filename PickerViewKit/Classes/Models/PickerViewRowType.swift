//
//  PickerViewRowType.swift
//  PickerViewKit
//
//  Created by crelies on 16.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import Foundation

public enum PickerViewRowType {
	case plain(title: String)
	case attributed(title: NSAttributedString)
	case custom(view: () -> UIView)
}
