//
//  AddressViewModel.swift
//  MVVMDemo
//
//  Created by Saddam on 23/8/22.
//

import Foundation

class AddressViewModel{
    
    var address: ObservableObject<[AddressModel]?> = ObservableObject(nil)
    
    func getAddressModel(url: URL) {
        NetworkServices.share.getUserInfo(url: url) { [weak self] data in
            guard let data = data else {return}
            do{
                let user = try JSONDecoder().decode([AddressModel].self, from: data)
                print(user)
               self!.address.value = user
            }catch{
                print("Error")
            }
        }
    }
}
