//
//  PickerViewType.swift
//  PickerViewKit
//
//  Created by crelies on 17.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import Foundation

public enum PickerViewType {
	case single(component: PickerViewComponent)
	case keyValue(components: [PickerViewComponent])
	case multi(components: [PickerViewComponent])
}
