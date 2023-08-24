//
//  EmployeeViewModel.swift
//  MVVMDemo
//
//  Created by Kopto Tech on 24/08/23.
//

import Foundation
class EmployeeViewModel : NSObject {
    private var apiservice : APIService!
    
    private(set) var empData : Employees! {
            didSet {
                self.bindEmployeeViewModelToController()
            }
        }
        
        var bindEmployeeViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiservice = APIService()
        callFuncToGetEmpData()
    }
    func callFuncToGetEmpData(){
//        self.apiservice.apiToGetEmployeeInfo { empData in
//            print("\n\n\n \(empData)")
//            self.empData = empData
//            
//        }
        
        self.apiservice.apiGetDataEmployee { empData in
            self.empData = empData
        }
    }
}
