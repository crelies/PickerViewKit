//
//  EpisodeRow.swift
//  PickerViewKit_Example
//
//  Created by crelies on 15.03.18.
//  Copyright © 2018 Christian Elies. All rights reserved.
//

import Foundation
import PickerViewKit

struct EpisodeRow: PickerViewRowProtocol {
	var title: String?
	var attributedTitle: NSAttributedString?
	var view: (() -> UIView?)? {
		return {
			let customView = UILabel()
			customView.text = self.title
			return customView
		}
	}
	var model: PickerViewRowModelProtocol?
	
	init(title: String) {
		self.title = title
	}
	
	init(title: String, model: PickerViewRowModelProtocol) {
		self.title = title
		self.model = model
	}
}
