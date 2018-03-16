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
	
	private let sixthSeason = SeasonRow(title: "6")
	private let seventhSeason = SeasonRow(title: "7")
	private let seasonSixEpisodes = [EpisodeRow(title: "1"), EpisodeRow(title: "2"), EpisodeRow(title: "3"), EpisodeRow(title: "4"), EpisodeRow(title: "5"), EpisodeRow(title: "6"), EpisodeRow(title: "7"), EpisodeRow(title: "8"), EpisodeRow(title: "9"), EpisodeRow(title: "10")]
	private let seasonSevenEpisodes = [EpisodeRow(title: "1"), EpisodeRow(title: "2"), EpisodeRow(title: "3"), EpisodeRow(title: "4"), EpisodeRow(title: "5"), EpisodeRow(title: "6"), EpisodeRow(title: "7")]
    
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
		let seasonSix = PickerKeyValueModel(key: sixthSeason, values: seasonSixEpisodes)
		let seasonSeven = PickerKeyValueModel(key: seventhSeason, values: [])
		
		let pickerViewSetup = PickerViewSetup(pickerView: pickerView, models: [seasonSix, seasonSeven], callback: self)
		manager = PickerViewManager(setup: pickerViewSetup)
	}
	
	private func keyValueWithImageViewsComponentExample() {
		let frame = CGRect(x: 0, y: 0, width: 48, height: 48)
		
		var flagsRow = KeyRow()
		flagsRow.title = "flags"
		flagsRow.view = {
			let flagsLabel = UILabel()
			flagsLabel.text = "flags"
			flagsLabel.backgroundColor = .blue
			return flagsLabel
		}
		
		var firstFlag = ValueRow()
		firstFlag.view = {
			let firstFlagImage = UIImage(named: "GB")
			let firstFlagImageView = UIImageView(image: firstFlagImage)
			firstFlagImageView.frame = frame
			return firstFlagImageView
		}
		
		var secondFlag = ValueRow()
		secondFlag.view = {
			let secondFlagImage = UIImage(named: "KR")
			let secondFlagImageView = UIImageView(image: secondFlagImage)
			secondFlagImageView.frame = frame
			return secondFlagImageView
		}
		
		let pickerModel = PickerKeyValueModel(key: flagsRow, values: [firstFlag, secondFlag])
		
		var networksRow = KeyRow()
		networksRow.title = "networks"
		networksRow.view = {
			let networksLabel = UILabel()
			networksLabel.text = "networks"
			networksLabel.backgroundColor = .green
			return networksLabel
		}
		
		let model = PickerKeyValueModel(key: networksRow, values: [])
		
		let pickerViewSetup = PickerViewSetup(pickerView: pickerView, models: [pickerModel, model], callback: self, keyColumnWidth: pickerView.frame.size.width - 48.0)
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
    func didSelectRow(_ delegate: PickerViewDelegateProtocol, in pickerView: UIPickerView, row: PickerViewRowProtocol) {
		if let seasonRow = row as? SeasonRow, let title = seasonRow.title {
			switch title {
				case "6":
					manager?.updateValueComponent(with: seasonSixEpisodes)
				case "7":
					manager?.updateValueComponent(with: seasonSevenEpisodes)
				default: ()
			}
		} else if let keyRow = row as? KeyRow, let title = keyRow.title {
			let frame = CGRect(x: 0, y: 0, width: 48, height: 48)
			
			switch title {
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
