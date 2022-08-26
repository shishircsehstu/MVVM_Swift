//
//  ViewController.swift
//  MVVMDemo
//
//  Created by Saddam on 22/8/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var segmetControll: UISegmentedControl!
    @IBOutlet weak var userTableView: UITableView!
    
    var personViewModel = PersonViewModel()
    var addressViewModel = AddressViewModel()
    var selectedIndx = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "UserTableViewCell", bundle: nil)
        userTableView.register(nib, forCellReuseIdentifier: "UserTableViewCell")
        userTableView.dataSource = self
        userTableView.delegate = self
        
        personViewModel.person.bind {_ in
            DispatchQueue.main.async { [self] in
                print("person")
                userTableView.reloadData()
            }
        }
        /*
         addressViewModel.address.bind {_ in
         DispatchQueue.main.async { [self] in
         print("Address")
         userTableView.reloadData()
         }
         }
         */
        personViewModel.getPersonModel(url: URL(string: "https://jsonplaceholder.typicode.com/users")!)
        addressViewModel.getAddressModel(url: URL(string: "https://jsonplaceholder.typicode.com/users")!)
    }
    
    @IBAction func segmentControllAction(_ sender: UISegmentedControl) {
        
        print(sender.selectedSegmentIndex)
        selectedIndx = sender.selectedSegmentIndex
        userTableView.reloadData()
    }
    
}
extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedIndx == 0{
            return personViewModel.person.value?.count ?? 0
        }else{
            return addressViewModel.address.value?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        
        if selectedIndx == 0{
            cell.name.text = personViewModel.person.value![indexPath.row].name
            cell.email.text = personViewModel.person.value![indexPath.row].email
        }else{
            cell.name.text = addressViewModel.address.value![indexPath.row].address.city
            cell.email.text = addressViewModel.address.value![indexPath.row].address.street + " , " + addressViewModel.address.value![indexPath.row].address.suite
        }
        return cell
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

