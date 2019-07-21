//
//  PickerViewConfiguration.swift
//  PickerViewKit
//
//  Created by crelies on 15.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import UIKit

public struct PickerViewConfiguration {
	weak var pickerView: UIPickerView?
	let columns: [PickerViewColumn]
	weak var delegate: PickerViewDelegate?
	let rowHeight: CGFloat
	
	public init(pickerView: UIPickerView,
                columns: [PickerViewColumn],
                delegate: PickerViewDelegate?,
                rowHeight: CGFloat = 48) {
		self.pickerView = pickerView
        self.columns = columns
		self.delegate = delegate
		self.rowHeight = rowHeight
	}
}
