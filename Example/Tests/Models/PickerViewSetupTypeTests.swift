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
				let column = PickerViewColumn(rows: [])
				let single = PickerViewSetupType.single(column: column)
				
				it("should be equal to single case with same column") {
					expect(single) == .single(column: column)
				}
				
				it("should be not equal to key value case") {
					expect(single) != .keyValue(columns: [column])
				}
				
				it("should be not equal to multi case") {
					expect(single) != .multi(columns: [column])
				}
			}
			
			context("when initializing case keyValue") {
				let column = PickerViewColumn(rows: [])
				let keyValue = PickerViewSetupType.keyValue(columns: [column, column])
				
				it("should be equal to keyValue case with same columns") {
					expect(keyValue) == .keyValue(columns: [column, column])
				}
				
				it("should be not equal to single case") {
					expect(keyValue) != .single(column: column)
				}
				
				it("should be not equal to multi case") {
					expect(keyValue) != .multi(columns: [column, column])
				}
			}
			
			context("when initializing case multi") {
				let column = PickerViewColumn(rows: [])
				let multi = PickerViewSetupType.multi(columns: [column, column])
				
				it("should be equal to multi case with same columns") {
					expect(multi) == .multi(columns: [column, column])
				}
				
				it("should be not equal to single case") {
					expect(multi) != .single(column: column)
				}
				
				it("should be not equal to keyValue case") {
					expect(multi) != .keyValue(columns: [column, column])
				}
			}
		}
	}
}
