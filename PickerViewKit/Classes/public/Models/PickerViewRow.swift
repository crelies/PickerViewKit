//
//  PickerViewRow.swift
//  PickerViewKit
//
//  Created by crelies on 14.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import Foundation

public struct PickerViewRow {
    var view: UIView {
        switch type {
            case .plain(let title):
                let label = UILabel()
                label.text = title
                return label
            case .attributed(let title):
                let label = UILabel()
                label.attributedText = title
                return label
            case .custom(let view):
                return view()
        }
    }
    
	public let type: PickerViewRowType
	public let model: AnyPickerViewRowModel
	
    public init<T: Equatable>(type: PickerViewRowType, model: T) {
		self.type = type
        self.model = AnyPickerViewRowModel(model)
	}
}

extension PickerViewRow: Equatable {
    public static func ==(lhs: PickerViewRow, rhs: PickerViewRow) -> Bool {
        let isTypeEqual = lhs.type == rhs.type
        let isModelEqual = lhs.model == rhs.model
        return isTypeEqual && isModelEqual
    }
}
