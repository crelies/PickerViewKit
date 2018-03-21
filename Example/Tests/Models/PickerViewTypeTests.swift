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
				let type = PickerViewType.singleColumn
				
				it("should be equal to single") {
					expect(type) == PickerViewType.singleColumn
				}
				
				it("should be not equal to keyValue") {
					expect(type) != PickerViewType.keyValueColumn
				}
				
				it("should be not equal to multi") {
					expect(type) != PickerViewType.multiColumn
				}
			}
			
			context("when initializing case keyValue") {
				let type = PickerViewType.keyValueColumn
				
				it("should be equal to keyValue") {
					expect(type) == PickerViewType.keyValueColumn
				}
				
				it("should be not equal to single") {
					expect(type) != PickerViewType.singleColumn
				}
				
				it("should be not equal to multi") {
					expect(type) != PickerViewType.multiColumn
				}
			}
			
			context("when initializing case multi") {
				let type = PickerViewType.multiColumn
				
				it("should be equal to multi") {
					expect(type) == PickerViewType.multiColumn
				}
				
				it("should be not equal to single") {
					expect(type) != PickerViewType.singleColumn
				}
				
				it("should be not equal to keyValue") {
					expect(type) != PickerViewType.keyValueColumn
				}
			}
			
			context("when initializing with setup type single") {
				let column = PickerViewColumn(rows: [])
				let type = PickerViewType(pickerViewSetupType: .single(column: column))
				
				it("should be case single") {
					expect(type) == PickerViewType.singleColumn
				}
			}
			
			context("when initializing with setup type keyValue") {
				let column = PickerViewColumn(rows: [])
				let type = PickerViewType(pickerViewSetupType: .keyValue(columns: [column, column]))
				
				it("should be case keyValue") {
					expect(type) == PickerViewType.keyValueColumn
				}
			}
			
			context("when initializing with setup type multi") {
				let column = PickerViewColumn(rows: [])
				let type = PickerViewType(pickerViewSetupType: .multi(columns: [column, column]))
				
				it("should be case multi") {
					expect(type) == PickerViewType.multiColumn
				}
			}
		}
	}
}
