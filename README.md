# MVVM_Swift

- This is a simple iOS project where used MVVM design architecture pattern. 
- One can learn how to fetch data from API through an effective way and update UI. 

## Model
It simply say that the plain structure of our data. Model does not know the business logic. 
`
struct PersonModel: Codable{
    
    var name: String
    var username: String
    var email: String
}
`
