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
    case switchCell(model: SettingsSwitchOption)
}

struct SettingsSwitchOption {
    let title : String
    let icon : UIImage?
    let iconBackgroundColor : UIColor
    let handler : (() -> Void)
    var isOn : Bool
}

struct SettingsOption {
    let title : String
    let icon : UIImage?
    let iconBackgroundColor : UIColor
    let handler : (() -> Void)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableViewCell.self,
                       forCellReuseIdentifier: SettingTableViewCell.identifier)
        table.register(SwitchTableViewCell.self,
                       forCellReuseIdentifier: SwitchTableViewCell.identifier)
        return table
    }()
    
    var models = [Section]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "Settings"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    func configure() {
        
        //MARK: SECTION ONE
        models.append(Section(title: "", options: [
            .staticCell(model: SettingsOption(title: "Starred Messages", icon: UIImage(systemName: "star.fill"), iconBackgroundColor: .systemYellow, handler: {
             
            })),
            .staticCell(model: SettingsOption(title: "Linked Devices", icon: UIImage(systemName: "laptopcomputer"), iconBackgroundColor: .systemTeal, handler: {
               
            }))
        ]))
        
        //MARK: SECTION TWO
        models.append(Section(title: "", options: [
            .staticCell(model: SettingsOption(title: "Account", icon: UIImage(systemName: "key.fill"), iconBackgroundColor: .systemBlue, handler: {
             
            })),
            .staticCell(model: SettingsOption(title: "Privacy", icon: UIImage(systemName: "lock.fill"), iconBackgroundColor: .systemBlue, handler: {
              
            })),
            .staticCell(model: SettingsOption(title: "Chats", icon: UIImage(systemName: "message"), iconBackgroundColor: .systemGreen, handler: {
                
            })),
            .staticCell(model: SettingsOption(title: "Notifications", icon: UIImage(systemName: "bell.badge.fill"), iconBackgroundColor: .systemRed, handler: {
                
            })),
            .staticCell(model: SettingsOption(title: "Storage and Data", icon: UIImage(systemName: "arrow.up.arrow.down"), iconBackgroundColor: .systemGreen, handler: {
                
            }))
        ]))
        
        //MARK: SECTION THREE
        models.append(Section(title: "", options: [
            .staticCell(model: SettingsOption(title: "Help", icon: UIImage(systemName: "info"), iconBackgroundColor: .systemBlue, handler: {
              
            })),
            .staticCell(model: SettingsOption(title: "Tell a Friend", icon: UIImage(systemName: "heart.fill"), iconBackgroundColor: .systemRed, handler: {
                
            }))
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
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SwitchTableViewCell.identifier,
                for: indexPath
            ) as? SwitchTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]
        switch type.self {
        case .staticCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UIView()
        footer.frame = CGRect(x: 0, y: 0, width: 540, height: 55)
          
        if (section == models.count - 1){
            footer.backgroundColor = .clear
            let lbl = UILabel()
            lbl.frame = CGRect(x: 10, y: 0, width: 540, height: 40)
            lbl.backgroundColor = .clear
            lbl.font = UIFont(name: "HelveticaNeue-Light", size: 10)
            lbl.text = "Created By MAD400 Section 200 - 3"
            lbl.numberOfLines = 1
            footer.addSubview(lbl)
            let lbl2 = UILabel()
            lbl2.frame = CGRect(x: 10, y: 12, width: 540, height: 40)
            lbl2.backgroundColor = .clear
            lbl2.font = UIFont(name: "HelveticaNeue-Light", size: 10)
            lbl2.text = "Version 1.0.0"
            lbl2.numberOfLines = 1
            footer.addSubview(lbl2)
            self.tableView.tableFooterView = footer

        }
            return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if (section == models.count - 1) {
            return 60.0
        } else {
            return 0.0
        }
    }
}
