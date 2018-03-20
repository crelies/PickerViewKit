//
//  PickerViewSetupTypeTests.swift
//  PickerViewKit_Tests
//
//  Created by crelies on 20.03.18.
//  Copyright © 2018 Christian Elies. All rights reserved.
//

@testable import PickerViewKit

import Foundation
import Nimble
import Quick

final class PickerViewSetupTypeTests: QuickSpec {
	override func spec() {
		describe("PickerViewSetupType") {
			context("when initializing case single") {
				let component = PickerViewComponent(rows: [])
				let single = PickerViewSetupType.single(component: component)
				
				it("should be equal to single case with same component") {
					expect(single) == .single(component: component)
				}
				
				it("should be not equal to key value case") {
					expect(single) != .keyValue(components: [component])
				}
				
				it("should be not equal to multi case") {
					expect(single) != .multi(components: [component])
				}
			}
			
			context("when initializing case keyValue") {
				let component = PickerViewComponent(rows: [])
				let keyValue = PickerViewSetupType.keyValue(components: [component, component])
				
				it("should be equal to keyValue case with same components") {
					expect(keyValue) == .keyValue(components: [component, component])
				}
				
				it("should be not equal to single case") {
					expect(keyValue) != .single(component: component)
				}
				
				it("should be not equal to multi case") {
					expect(keyValue) != .multi(components: [component, component])
				}
			}
			
			context("when initializing case multi") {
				let component = PickerViewComponent(rows: [])
				let multi = PickerViewSetupType.multi(components: [component, component])
				
				it("should be equal to multi case with same components") {
					expect(multi) == .multi(components: [component, component])
				}
				
				it("should be not equal to single case") {
					expect(multi) != .single(component: component)
				}
				
				it("should be not equal to keyValue case") {
					expect(multi) != .keyValue(components: [component, component])
				}
			}
		}
	}
}
