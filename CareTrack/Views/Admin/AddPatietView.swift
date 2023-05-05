//
//  AddPatientView.swift
//  CareTrack
//
//  Created by Zeal Shah  on 05/05/23.
//

import SwiftUI
import Firebase

struct AddPatientView: View {
    @StateObject var signUpVM = SignUpViewModel()

    @State var bgColour: Color = Color(red: 242/255, green: 242/255, blue: 242/255)
    @State var nameTextField: String = ""
    @State var emailTextField: String = ""
    @State var phoneTextField: String = ""
    @State private var date = Date()
    @State private var age: DateComponents = DateComponents()
    @State private var gender = 0
    @State var fontColor: Color = Color(red: 28/255, green: 28/255, blue: 28/255,opacity: 0.6)
    let chosenGender = ["Female","Male","Prefer not to disclose"]
    @State var showNext: Bool = false
    @State var id: String = ""
    @State var name: String = ""
    var body: some View {
        ZStack{
            bgColour
                .ignoresSafeArea()
        VStack{
            Text("Patient Details")
                .frame(maxWidth: .infinity,alignment: .leading)
                .font(Font.custom("SF Pro Display Semibold", size: 24))
                .padding(.leading)
                .foregroundColor(Color(red: 28/255, green: 28/255, blue: 28/255))
            TextField("Enter full name", text: $nameTextField)
                .padding()
                .background(Color.white.cornerRadius(10))
                .font(.headline)
                .lineLimit(1)
                .padding()
            TextField("Enter email", text: $emailTextField)
                .padding()
                .background(Color.white.cornerRadius(10))
                .font(.headline)
                .lineLimit(1)
                .padding()
            TextField("Enter phone number", text: $phoneTextField)
                .padding()
                .background(Color.white.cornerRadius(10))
                .font(.headline)
                .lineLimit(1)
                .padding()
                .padding(.bottom)
            ZStack{
                DatePicker("Select date of Birth", selection: $date , displayedComponents: .date)
                    .frame(width: 310, height: 50)
                    .font(Font.custom("SF Pro Display", size: 17))
                    .foregroundColor(Color(red: 0.773, green: 0.773, blue: 0.781))
                    .background{
                        RoundedRectangle(cornerRadius: 15)
                        //.stroke(lineWidth: 2.0)
                            .foregroundColor(.white)
                            .frame(width: 360, height: 50)
                        //.padding(.trailing,30)
                            .background{
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.white)
                            }
                    }
                    .onChange(of: date, perform: { value in
                    age = Calendar.current.dateComponents([.year, .month, .day], from: date, to: Date())
                    print(age.year)
                })
                
            }
            .padding([.leading,.trailing,.bottom])
            
            HStack {
                Text("Select a gender:")
                    .foregroundColor(Color(red: 0.773, green: 0.773, blue: 0.781))
                    .font(.headline)
                    .lineLimit(1)
                    .padding()
                Spacer()
                Picker(selection: $gender, label: Text("Select a gender")) {
                    ForEach(0 ..< chosenGender.count) {
                        Text(self.chosenGender[$0])
                    }
                }
                .background(bgColour.cornerRadius(10))
                .padding(.trailing)
            }
            .background(Color.white.cornerRadius(10))
            .padding()
            
            Button {
                Auth.auth().createUser(withEmail: emailTextField, password: "Qwerty@123"){result,error in
                    if error == nil{
                        let id = result!.user.uid
                        signUpVM.registerUser(id: result!.user.uid,name: nameTextField, age: Int(age.year!), phone: (phoneTextField), gender: chosenGender[gender])
                        self.showNext.toggle()
                        self.id = id
                        self.name = nameTextField
                    }
                }
            } label: {
                Text("Save")
                    .font(Font.custom("SF Pro Display", size: 20))
                    .foregroundColor(.white)
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 280,height: 48)
                    }
            }
            
            if showNext{
                NavigationLink(destination: AdminDeptSelectionView(id: id, name: name)) {
                    Text("Next")
                        .font(Font.custom("SF Pro Display", size: 20))
                        .foregroundColor(.white)
                        .background {
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 280,height: 48)
                        }
                }.padding(.top,30)
            }
            
            Spacer()
        }
        .padding(.top)
    }
    }
}

struct AddPatientView_Previews: PreviewProvider {
    static var previews: some View {
        AddPatientView()
    }
}
