//
//  ViewController.swift
//  5lesson1NavItem
//
//  Created by Aiturgan Kurmanbekova on 14/3/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let tableView = UITableView(frame: CGRect(), style: .insetGrouped)
    
    let model: [Model] = [Model(image: UIImage(named: "icon")!,
                                label: "Язык",
                                secondLabel: "Русский"),
                          Model(image: UIImage(systemName: "moon")!,
                                label: "Темная тема",
                                secondLabel: ""),
                          Model(image: UIImage(systemName: "trash")!,
                                label: "Очистить данные",
                                secondLabel: "")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupNavItem()
        setupUI()
    }
    
    private func setupUI() {
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate(
            [tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
             tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 30)
            ])
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.backgroundColor = .systemBackground
        
    }
    
    private func setupNavItem() {
        
        navigationItem.title = "Settings"
        
        let navItemSettingsButton = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain, target: self, action: #selector(settingsBtnTppd))
        navItemSettingsButton.tintColor = .black
        navigationItem.rightBarButtonItem = navItemSettingsButton
        
        let leftBarLabelButton = UIBarButtonItem(title: "Label", style: .plain, target: self, action: #selector(leftBarItemTppd))
        navigationItem.leftBarButtonItem = leftBarLabelButton
    }
    
    @objc private func settingsBtnTppd() {
        
    }
    
    @objc private func leftBarItemTppd() {
        
    }
    
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "")
        cell.imageView?.image = model[indexPath.row].image
        cell.textLabel?.text = model[indexPath.row].label
        cell.detailTextLabel?.text = model[indexPath.row].secondLabel
        cell.backgroundColor = .systemGray6
        
        cell.imageView?.tintColor = .black
        
        switch indexPath.row {
        case 0:
            cell.accessoryType = .disclosureIndicator
        case 1:
            cell.accessoryView = UISwitch()
        default:
            break
        }
        
        return cell
    }
    
    
}

