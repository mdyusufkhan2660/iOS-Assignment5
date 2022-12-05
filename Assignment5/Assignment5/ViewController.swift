//
//  ViewController.swift
//  Assignment5
//
//  Created by Yusuf Khan on 2022-11-30.
//

import UIKit

struct Section {
    let title : String
    let options : [SettingsOptionType]
}

enum SettingsOptionType {
    case staticCell(model: SettingsOption)
    case profileCell(model: ProfileOption)
}

struct SettingsOption {
    let title : String
    let icon : UIImage?
    let iconBackgroundColor : UIColor
}
struct ProfileOption {
    let status: String
    let title : String
    let icon : UIImage?
    let iconBackgroundColor : UIColor
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableViewCell.self,
                       forCellReuseIdentifier: SettingTableViewCell.identifier)
        
        table.register(ProfileTableViewCell.self,
                       forCellReuseIdentifier: ProfileTableViewCell.identifier)
        return table
    }()
    
    var models = [Section]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "Settings"
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }
    
    func configure() {
        
        
        //PROFILE SECTION
        models.append(Section(title: "", options: [
            .profileCell(model: ProfileOption(status: "Busy", title: "MAD400", icon: UIImage(systemName: "person.circle"), iconBackgroundColor: .gray))
        ]))
        
        //SECTION ONE
        models.append(Section(title: "", options: [
            .staticCell(model: SettingsOption(title: "Starred Messages", icon: UIImage(systemName: "star.fill"), iconBackgroundColor: .systemYellow)),
            .staticCell(model: SettingsOption(title: "Linked Devices", icon: UIImage(systemName: "laptopcomputer"), iconBackgroundColor: .systemTeal))
        ]))
        
        //SECTION TWO
        models.append(Section(title: "", options: [
            .staticCell(model: SettingsOption(title: "Account", icon: UIImage(systemName: "key.fill"), iconBackgroundColor: .systemBlue)),
            .staticCell(model: SettingsOption(title: "Privacy", icon: UIImage(systemName: "lock.fill"), iconBackgroundColor: .systemBlue)),
            .staticCell(model: SettingsOption(title: "Chats", icon: UIImage(systemName: "message"), iconBackgroundColor: .systemGreen)),
            .staticCell(model: SettingsOption(title: "Notifications", icon: UIImage(systemName: "bell.badge.fill"), iconBackgroundColor: .systemRed)),
            .staticCell(model: SettingsOption(title: "Storage and Data", icon: UIImage(systemName: "arrow.up.arrow.down"), iconBackgroundColor: .systemGreen))
        ]))
        
        //SECTION THREE
        models.append(Section(title: "", options: [
            .staticCell(model: SettingsOption(title: "Help", icon: UIImage(systemName: "info"), iconBackgroundColor: .systemBlue)),
            .staticCell(model: SettingsOption(title: "Tell a Friend", icon: UIImage(systemName: "heart.fill"), iconBackgroundColor: .systemRed))
        ]))
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingTableViewCell.identifier,
                for: indexPath
            ) as? SettingTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        case .profileCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ProfileTableViewCell.identifier,
                for: indexPath
            ) as? ProfileTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self {
            case .profileCell(_):
            return 85.0
        case .staticCell(_):
            return 44.0
        }
        
    }
}
