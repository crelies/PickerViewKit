//
//  PickerViewTypeTests.swift
//  PickerViewKit_Tests
//
//  Created by crelies on 20.03.18.
//  Copyright © 2018 Christian Elies. All rights reserved.
//

@testable import PickerViewKit

import Foundation
import Nimble
import Quick

final class PickerViewTypeTests: QuickSpec {
	override func spec() {
		describe("PickerViewType") {
			context("when initializing case single") {
				let type = PickerViewType.single
				
				it("should be equal to single") {
					expect(type) == PickerViewType.single
				}
				
				it("should be not equal to keyValue") {
					expect(type) != PickerViewType.keyValue
				}
				
				it("should be not equal to multi") {
					expect(type) != PickerViewType.multi
				}
			}
			
			context("when initializing case keyValue") {
				let type = PickerViewType.keyValue
				
				it("should be equal to keyValue") {
					expect(type) == PickerViewType.keyValue
				}
				
				it("should be not equal to single") {
					expect(type) != PickerViewType.single
				}
				
				it("should be not equal to multi") {
					expect(type) != PickerViewType.multi
				}
			}
			
			context("when initializing case multi") {
				let type = PickerViewType.multi
				
				it("should be equal to multi") {
					expect(type) == PickerViewType.multi
				}
				
				it("should be not equal to single") {
					expect(type) != PickerViewType.single
				}
				
				it("should be not equal to keyValue") {
					expect(type) != PickerViewType.keyValue
				}
			}
			
			context("when initializing with setup type single") {
				let component = PickerViewComponent(rows: [])
				let type = PickerViewType(pickerViewSetupType: .single(component: component))
				
				it("should be case single") {
					expect(type) == PickerViewType.single
				}
			}
			
			context("when initializing with setup type keyValue") {
				let component = PickerViewComponent(rows: [])
				let type = PickerViewType(pickerViewSetupType: .keyValue(components: [component, component]))
				
				it("should be case keyValue") {
					expect(type) == PickerViewType.keyValue
				}
			}
			
			context("when initializing with setup type multi") {
				let component = PickerViewComponent(rows: [])
				let type = PickerViewType(pickerViewSetupType: .multi(components: [component, component]))
				
				it("should be case multi") {
					expect(type) == PickerViewType.multi
				}
			}
		}
	}
}
