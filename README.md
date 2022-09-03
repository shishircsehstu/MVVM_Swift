# MVVM_Swift

- This is a simple iOS project where used MVVM design architecture pattern. 
- One can learn how to fetch data from API through an effective way and update UI. 

## Model
It simply say that the plain structure of our data. Model does not know the business logic. 


import Foundation

struct PersonModel: Codable{
    var name: String
    var username: String
    var email: String
}

func openclose(){
    print("")
}
<img width="317" alt="Screenshot 2022-09-03 at 11 52 37 AM" src="https://user-images.githubusercontent.com/29371886/188257870-5835d130-5331-4b08-a05d-ac004b61c241.png">
