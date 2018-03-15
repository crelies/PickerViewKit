//
//  PickerViewRow.swift
//  PickerViewKit
//
//  Created by crelies on 14.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import Foundation

public protocol PickerViewRowProtocol {
    var title: String { get }
    var attributedTitle: NSAttributedString? { get }
	func view() -> UIView?
}
