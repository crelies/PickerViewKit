//
//  ValueRow.swift
//  PickerViewKit_Example
//
//  Created by crelies on 15.03.18.
//  Copyright © 2018 Christian Elies. All rights reserved.
//

import Foundation
import PickerViewKit

struct ValueRow: PickerViewRowProtocol {
	var title: String?
	var attributedTitle: NSAttributedString?
	var view: (() -> UIView?)?
	var model: PickerViewRowModelProtocol?
}
