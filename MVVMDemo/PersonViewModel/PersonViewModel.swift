//
//  PersonViewModel.swift
//  MVVMDemo
//
//  Created by Saddam on 22/8/22.
//

import Foundation

class PersonViewModel{
    
    var person: ObservableObject<[PersonModel]?> = ObservableObject(nil)
    
    func getPersonModel(url: URL) {
        NetworkServices.share.getUserInfo(url: url) { [weak self] data in
            guard let data = data else {return}
            do{
                let user = try JSONDecoder().decode([PersonModel].self, from: data)
                print(user)
               self!.person.value = user
            }catch{
                print("Error")
            }
        }
    }
}
