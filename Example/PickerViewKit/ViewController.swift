//
//  ViewController.swift
//  PickerViewKit_Example
//
//  Created by crelies on 14.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import Foundation
import PickerViewKit
import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var pickerView: UIPickerView!
    
    private var manager: PickerViewManagerProtocol?
	
	private let oneSeasonRowModel = SeasonRowModel(identifier: 6, name: "Season 6", description: "Awesome season")
	lazy private var oneSeasonRow: SeasonRow = {
		return SeasonRow(title: oneSeasonRowModel.name, model: oneSeasonRowModel)
	}()
	private let anotherSeasonRowModel = SeasonRowModel(identifier: 7, name: "Season 7", description: "Totally awesome season")
	lazy private var anotherSeasonRow: SeasonRow = {
		return SeasonRow(title: anotherSeasonRowModel.name, model: anotherSeasonRowModel)
	}()
	private let oneSeasonEpisodes: [EpisodeRow] = Array(1...10).map { EpisodeRow(title: "\($0)") }
	private let anotherSeasonEpisodes: [EpisodeRow] = Array(1...7).map { EpisodeRow(title: "\($0)") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		singleComponentExample()
    }
	
	@IBAction func didPressSingleComponentButton(_ sender: UIButton) {
		manager?.updateComponents(components: [])
		singleComponentExample()
	}
	
	@IBAction func didPressKeyValueComponentButton(_ sender: UIButton) {
		manager?.updateComponents(components: [])
		keyValueComponentExample()
	}
	
	@IBAction func didPressKeyValueWithImageViewsComponentButton(_ sender: UIButton) {
		manager?.updateComponents(components: [])
		keyValueWithImageViewsComponentExample()
	}
	
	@IBAction func didPressMultiComponentButton(_ sender: UIButton) {
		manager?.updateComponents(components: [])
		multiComponentExample()
	}
}

extension ViewController {
	private func singleComponentExample() {
		let firstPickerViewRow = PickerViewRow(title: "First Row")
		let pickerViewRows = [firstPickerViewRow]
		
		let firstPickerViewComponent = PickerViewComponent(rows: pickerViewRows, columnWidth: 128.0, rowHeight: 56.0)
		let pickerViewComponents =  [firstPickerViewComponent]
		let pickerViewSetup = PickerViewSetup(pickerView: pickerView, components: pickerViewComponents, callback: self)
		manager = PickerViewManager(setup: pickerViewSetup)
	}
	
	private func keyValueComponentExample() {
		let seasonSixKeyValueModel = PickerKeyValueModel(key: oneSeasonRow, values: oneSeasonEpisodes)
		let seasonSevenKeyValueModel = PickerKeyValueModel(key: anotherSeasonRow, values: [])
		
		let pickerViewSetup = PickerViewSetup(pickerView: pickerView, models: [seasonSixKeyValueModel, seasonSevenKeyValueModel], callback: self, keyColumnWidth: 96.0)
		manager = PickerViewManager(setup: pickerViewSetup)
	}
	
	private func keyValueWithImageViewsComponentExample() {
		let frame = CGRect(x: 0, y: 0, width: 48, height: 48)
		
		let flagsRowModel = KeyRowModel(identifier: "flags", name: "Flags", description: "Country flags")
		var flagsRow = KeyRow()
		flagsRow.model = flagsRowModel
		flagsRow.title = flagsRowModel.name
		flagsRow.view = {
			let flagsLabel = UILabel()
			flagsLabel.text = flagsRowModel.name
			flagsLabel.backgroundColor = .blue
			return flagsLabel
		}
		
		let firstFlagRowModel = ValueRowModel(identifier: "gb", name: "Kingdom of Great Britain", description: "Everlasting kingdom")
		var firstFlagRow = ValueRow()
		firstFlagRow.model = firstFlagRowModel
		firstFlagRow.view = {
			let firstFlagImage = UIImage(named: "GB")
			let firstFlagImageView = UIImageView(image: firstFlagImage)
			firstFlagImageView.frame = frame
			return firstFlagImageView
		}
		
		let secondFlagRowModel = ValueRowModel(identifier: "kr", name: "Korea", description: "Part of asian continent")
		var secondFlagRow = ValueRow()
		secondFlagRow.model = secondFlagRowModel
		secondFlagRow.view = {
			let secondFlagImage = UIImage(named: "KR")
			let secondFlagImageView = UIImageView(image: secondFlagImage)
			secondFlagImageView.frame = frame
			return secondFlagImageView
		}
		
		let flagsKeyValueModel = PickerKeyValueModel(key: flagsRow, values: [firstFlagRow, secondFlagRow])
		
		let networksRowModel = KeyRowModel(identifier: "networks", name: "Networks", description: "List of networks")
		var networksRow = KeyRow()
		networksRow.model = networksRowModel
		networksRow.title = networksRowModel.name
		networksRow.view = {
			let networksLabel = UILabel()
			networksLabel.text = networksRowModel.name
			networksLabel.backgroundColor = .green
			return networksLabel
		}
		
		let networksKeyValueModel = PickerKeyValueModel(key: networksRow, values: [])
		
		let pickerViewSetup = PickerViewSetup(pickerView: pickerView, models: [flagsKeyValueModel, networksKeyValueModel], callback: self, keyColumnWidth: pickerView.frame.size.width - 48.0)
		manager = PickerViewManager(setup: pickerViewSetup)
	}
	
	private func multiComponentExample() {
		let days: [PickerViewRowProtocol] = Array(1...30).map { PickerViewRow(title: "\($0)") }
		
		let months: [PickerViewRowProtocol] = Array(1...12).map { PickerViewRow(title: "\($0)") }
		let years: [PickerViewRowProtocol] = Array(1990...2000).map { PickerViewRow(title: "\($0)") }
		
		let dayComponent = PickerViewComponent(rows: days, rowHeight: 72.0)
		let monthComponent = PickerViewComponent(rows: months, columnWidth: 96.0)
		let yearComponent = PickerViewComponent(rows: years)
		
		let pickerViewSetup = PickerViewSetup(pickerView: pickerView, components: [dayComponent, monthComponent, yearComponent], callback: self)
		manager = PickerViewManager(setup: pickerViewSetup)
	}
}

extension ViewController: PickerViewDelegateCallbackProtocol {
	func didSelectRow(_ delegate: PickerViewDelegateProtocol, in pickerView: UIPickerView, row: PickerViewRowProtocol, rowModel: PickerViewRowModelProtocol?) {
		if let seasonRow = row as? SeasonRow, let seasonRowModel = seasonRow.model as? SeasonRowModel {
			switch seasonRowModel.identifier {
				case 6:
					manager?.updateValueComponent(with: oneSeasonEpisodes)
				case 7:
					manager?.updateValueComponent(with: anotherSeasonEpisodes)
				default: ()
			}
		} else if let keyRow = row as? KeyRow, let keyRowModel = keyRow.model as? KeyRowModel {
			let frame = CGRect(x: 0, y: 0, width: 48, height: 48)
			
			switch keyRowModel.identifier {
				case "flags":
					var firstFlagRow = ValueRow()
					firstFlagRow.view = {
						let firstFlagImage = UIImage(named: "GB")
						let firstFlagImageView = UIImageView(image: firstFlagImage)
						firstFlagImageView.frame = frame
						return firstFlagImageView
					}
					
					var secondFlagRow = ValueRow()
					secondFlagRow.view = {
						let secondFlagImage = UIImage(named: "KR")
						let secondFlagImageView = UIImageView(image: secondFlagImage)
						secondFlagImageView.frame = frame
						return secondFlagImageView
					}
				
					manager?.updateValueComponent(with: [firstFlagRow, secondFlagRow])
				
				case "networks":
					var githubRow = ValueRow()
					githubRow.view = {
							let image = UIImage(named: "github")
							let imageView = UIImageView(image: image)
							imageView.frame = frame
							return imageView
					}
					
					manager?.updateValueComponent(with: [githubRow])
				
				default: ()
			}
		}
    }
}
