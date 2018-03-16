//
//  PickerViewRow.swift
//  PickerViewKit
//
//  Created by crelies on 14.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import Foundation

public protocol PickerViewRowProtocol {
    var title: String? { get }
    var attributedTitle: NSAttributedString? { get }
	var view: (() -> UIView?)? { get }
	var model: PickerViewRowModel? { get }
	func getView() -> UIView?
}

public extension PickerViewRowProtocol {
	func getView() -> UIView? {
		if let view = view {
			return view()
		} else {
			return nil
		}
	}
}

public struct PickerViewRow: PickerViewRowProtocol {
	public var title: String?
	public var attributedTitle: NSAttributedString?
	public var view: (() -> UIView?)?
	public var model: PickerViewRowModel?
	
	public init(title: String) {
		self.title = title
	}
}
