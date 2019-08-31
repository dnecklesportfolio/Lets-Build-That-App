//
//  ViewController.swift
//  IntermediateTraining
//
//  Created by Dwayne Neckles on 8/29/19.
//  Copyright © 2019 Dwayne Neckles. All rights reserved.
//

import UIKit
import CoreData



// UITableViewController class creates a list w lines
class CompanyController: UITableViewController, CreateCompanyControllerDelegate {
    
    func didAddCompany(company:Company) {
        // modify array append function
        companies.append(company)
        
        //insert new index path in tableview
        let newIndexPath = IndexPath(row: companies.count - 1, section: 0)
        tableView.insertRows(at: [newIndexPath], with: .automatic )
    }
    
    
    
    var companies = [Company]()
 
    private func fetchCompanies() {
        let persistentContainer = NSPersistentContainer(name: "Model")
        persistentContainer.loadPersistentStores { (storeDescription, err) in
            if let err = err {
                fatalError("Loading of store failed: \(err)")
            }
        }
        
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Company>(entityName: "Company")
        do {
          let companies = try context.fetch(fetchRequest)
            companies.forEach { (company) in
                print(company.name ?? "")
            }
        } catch let fetchErr {
            print("failed to fetch companies", fetchErr)
    }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCompanies()
        // Do any additional setup after loading the view.
        fetchCompanies()
        view.backgroundColor = .darkBlue 
        
        navigationItem.title = "Companies"
        
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.separatorStyle = .none
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(imageLiteralResourceName: "plus") , style: UIBarButtonItem.Style.plain, target: self, action: #selector(handleAddCompany))
        
        
    }
    
    
    @objc func handleAddCompany() {
        let createCompanyController = CreateCompanyController()

        createCompanyController.delegate = self
        
        let navController = CustomNavigationController(rootViewController: createCompanyController)
        present(navController, animated:true,completion: nil)
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .lightBlue
        return view
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        cell.backgroundColor = UIColor.teal
        let company = companies[indexPath.row]
        cell.textLabel?.text = company.name
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return cell;
    }
    
    
}

