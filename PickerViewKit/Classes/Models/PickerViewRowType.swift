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

extension PickerViewRowType: Equatable {
    public static func ==(lhs: PickerViewRowType, rhs: PickerViewRowType) -> Bool {
        switch (lhs, rhs) {
            case (.plain(let lhsTitle), .plain(let rhsTitle)):
                return lhsTitle == rhsTitle
            
            case (.attributed(let lhsAttributedTitle), .attributed(let rhsAttributedTitle)):
                return lhsAttributedTitle == rhsAttributedTitle
            
            case (.custom(let lhsView), .custom(let rhsView)):
                return lhsView() == rhsView()
            
            default:
                return false
        }
    }
}
