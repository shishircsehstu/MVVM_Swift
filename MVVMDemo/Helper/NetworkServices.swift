//
//  NetworkServices.swift
//  MVVMDemo
//
//  Created by Saddam on 22/8/22.
//

import Foundation

class NetworkServices{
    
    static var share = NetworkServices()
    
    func getUserInfo(url: URL, completion: @escaping(Data?)->Void){
        
        URLSession.shared.dataTask(with: url) { data, res, erro in
            
            guard let data = data else{return}
            
            print("data ", data)
            do{
              //  let user = try JSONDecoder().decode([UserModel].self, from: data)
                completion(data)
            }catch{
                
                completion(nil)
                print(erro.debugDescription)
            }
         
        }.resume()
    }
}
