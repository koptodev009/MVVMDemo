//
//  APIService.swift
//  MVVMDemo
//
//  Created by Kopto Tech on 24/08/23.
//

import Foundation
import Alamofire
import UIKit

class APIService {
    //    let url = URL(fileURLWithPath: "https://dummy.restapiexample.com/api/v1/employees")
    
    
    
    func apiToGetEmployeeInfo(completion : @escaping (Employees) -> ()){
        let url = URL(string: "https://dummy.restapiexample.com/api/v1/employees")
        let urlrequest = URLRequest(url: url!)
        let dataTask = URLSession.shared.dataTask(with: urlrequest) { data, response, error in
            print(data)
            let jsonDecoder = JSONDecoder()
            
            let empData = try! jsonDecoder.decode(Employees.self, from: data!)
            //            print(empData)
            completion(empData)
            
        }
        dataTask.resume()
    }
    
    //alamofire
    func apiGetDataEmployee(completion : @escaping (Employees) -> ()){
        let url = URL(string: "https://dummy.restapiexample.com/api/v1/employees") ?? nil
        AF.request(url!, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
            .response{ resp in
                print("Response.result.value \(resp.response)")
                switch resp.result{
                              case .success(let data):
                                do{
                                    let jsonData = try JSONDecoder().decode(Employees.self, from: data!)
                                  print("\n\n\n\n\(jsonData)")
                                    completion(jsonData)
                               } catch {
                                  print(error.localizedDescription)
                               }
                             case .failure(let error):
                               print(error.localizedDescription)
                             }
            }
        
    }
}

