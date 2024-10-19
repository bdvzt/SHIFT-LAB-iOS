//
//  ContentView.swift
//  SHIFT LAB
//
//  Created by Zayata Budaeva on 14.10.2024.
//

import SwiftUI

//struct RegistrationView: View {
//    @State private var name: String = ""
//    @State private var surname: String = ""
//    @State private var dateOfBirth: String = ""
//    @State private var password: String = ""
//    @State private var repeatPassword: String = ""
//    
//    @State private var birthDate = Date.now
//    
//    @State var alertText: String = "Your name must have at least 2 symbols"
//    @State var isAlert: Bool = false
//    
//    let bg = Color(UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0))
//
//    var body: some View {
//        VStack {
//            Text("Registration")
//                .padding(50)
//            
//            TextField("Name", text: $name)
//                .padding(.horizontal)
//                .frame(height: 50)
//                .background(bg)
//                .cornerRadius(15)
//            
//            TextField("Surname", text: $surname)
//                .padding(.horizontal)
//                .frame(height: 50)
//                .background(bg)
//                .cornerRadius(15)
//            
//            DatePicker(selection: $birthDate, in: ...Date.now, displayedComponents: .date) {
//                           Text("Select a birth date")
//                       }
//            
//            TextField("Password", text: $password)
//                .padding(.horizontal)
//                .frame(height: 50)
//                .background(bg)
//                .cornerRadius(15)
//            
//            TextField("Repeat password", text: $repeatPassword)
//                .padding(.horizontal)
//                .frame(height: 50)
//                .background(bg)
//                .cornerRadius(15)
//            
//            Button(action: addTask){
//                Text("Sign up")
//                    .foregroundColor(.white)
//                    .font(.headline)
//                    .frame(height: 70)
//                    .frame(maxWidth: .infinity)
//                    .background(Color.pink)
//                    .cornerRadius(15)
//            }
//        }
//        .padding()
//    }
//    
//    func addTask() {
//            
//        }
//    
//    func checkName()->Bool{
//        if name.count < 2{
//            isAlert.toggle()
//            return false
//        }
//        return true
//    }
//    
//    func checkSurname()-> Bool{
//        if surname.count < 2 {
//            isAlert.toggle()
//            return false
//        }
//        return true
//    }
//    
//    func checkPasswords()-> Bool{
//        if password == repeatPassword {
//            isAlert.toggle()
//            return false
//        }
//        return true
//    }
//    
//    func getAlert()->Alert{
//        return Alert(title: Text(alertText))
//    }
//    
//    func signUp() {
//            if textFieldText.isEmpty {
//                isAlert = true
//                return
//            }
//            
//            let newTask = TaskModelAdd(description: textFieldText)
//            listViewModel.addTask(task: newTask) { result in
//                switch result {
//                case .success:
//                    presentationMode.wrappedValue.dismiss()
//                case .failure(_):
//                    print("Error adding task")
//                }
//            }
//        presentationMode.wrappedValue.dismiss()
//        }
//}


struct RegistrationView: View {
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var dateOfBirth: Date = Date()
    @State private var password: String = ""
    @State private var repeatPassword: String = ""
    
    @State private var showAlert: Bool = false
    @State private var alertText: String = ""

    @StateObject private var userViewModel = UserViewModel()
    
    @State private var isLoggedIn = false


    let bg = Color(UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0))

    var body: some View {
        VStack {
            Text("Registration")
                .padding(50)
            
            TextField("Name", text: $name)
                .padding(.horizontal)
                .frame(height: 50)
                .background(bg)
                .cornerRadius(15)
            
            TextField("Surname", text: $surname)
                .padding(.horizontal)
                .frame(height: 50)
                .background(bg)
                .cornerRadius(15)
            
            DatePicker("Date of Birth", selection: $dateOfBirth, displayedComponents: .date)
                .padding(.horizontal)
                .frame(height: 50)
                .background(bg)
                .cornerRadius(15)
            
            TextField("Password", text: $password)
                .padding(.horizontal)
                .frame(height: 50)
                .background(bg)
                .cornerRadius(15)
            
            TextField("Repeat password", text: $repeatPassword)
                .padding(.horizontal)
                .frame(height: 50)
                .background(bg)
                .cornerRadius(15)
            
            NavigationLink(destination: MainView(), isActive: $isLoggedIn) {
                Button(action: signUp) {
                    Text("Sign up")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 70)
                        .frame(maxWidth: .infinity)
                        .background(Color.pink)
                        .cornerRadius(15)
                }
            }
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertText))
        }
    }

                

    

    func isValid() -> (Bool, String) {
        if name.count <= 2 {
            return (false, "Your NAME must have at least 2 symbols!")
        }
        
        if surname.count <= 2 {
            return (false, "Your SURNAME must have at least 2 symbols!")
        }
        
        if password.count < 8 {
                return (false, "Password must be at least 8 symbols long")
        }
        
        if !password.contains(where: { $0.isUppercase }) {
                return (false, "Password must have at least 1 uppercase letter")
        }
        
        if !password.contains(where: { $0.isNumber }) {
                return (false, "Password must have at least 1 digit")
        }

        if password != repeatPassword {
            return (false, "Passwords do not match")
        }
        
        if dateOfBirth > Date() {
            return (false, "Put the correct date")
        }
        showAlert = false
        return (true, "")
    }
    
    func signUp() {
            let (isValid, errorMessage) = isValid()
            
            if isValid {
                let currUser = UserModel(name: name, surname: surname, dateOfBirth: dateOfBirth, password: password)

                isLoggedIn = true
            } else {
                showAlert = true
                alertText = errorMessage
            }
        }
}

#Preview {
    RegistrationView()
}
