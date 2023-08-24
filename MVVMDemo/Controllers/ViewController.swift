//
//  ViewController.swift
//  MVVMDemo
//
//  Created by Kopto Tech on 24/08/23.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet weak var tblData: UITableView!
private var employeeViewModel : EmployeeViewModel!
    
    private var dataSource : EmployeeTableViewDataSource<EmployeeTableViewCell,EmployeeData>!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUIUpdate()
    }
    
    func callToViewModelForUIUpdate(){
        
        self.employeeViewModel =  EmployeeViewModel()
        self.employeeViewModel.bindEmployeeViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource(){
        
        self.dataSource = EmployeeTableViewDataSource(cellIdentifier: "cell", items: self.employeeViewModel.empData.data, configureCell: { (cell, evm) in
            cell.lblEmpName.text = evm.employeeName
//            cell.employeeNameLabel.text = evm.employeeName
        })
        
        DispatchQueue.main.async {
            self.tblData.dataSource = self.dataSource
            self.tblData.reloadData()
        }
    }
    
}
