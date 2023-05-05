//
//  AddDoctor View.swift
//  CareTrack
//
//  Created by Zeal Shah  on 02/05/23.
//

import SwiftUI
import Firebase

struct AddDoctor_View: View {
    @State var bgColour: Color = Color(red: 242/255, green: 242/255, blue: 242/255)
    @State var nameTextField: String = ""
    @State var emailTextField: String = ""
    @State var phoneTextField: String = ""
    @State private var date = Date()
    @State var expTextField: String = ""
    @State private var gender = 0
    @State var fontColor: Color = Color(red: 28/255, green: 28/255, blue: 28/255,opacity: 0.6)
    let chosenGender = ["Female","Male","Prefer not to disclose"]
    @State private var department = 0
    let chosenDept = ["Surgery","Neurology","General","Sonography","Vaccination","Physiotherapy","Senior HealthCare","Radiology"]
    @State var qualificationTextField: String = ""
    @StateObject var addDoctorVM = AddDoctorViewModel()
    @State private var age: DateComponents = DateComponents()
    var body: some View {
        ZStack{
            bgColour.ignoresSafeArea()
            ScrollView{
                VStack{
                    Text("Doctor Details")
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
                    ZStack{
                        DatePicker("Select date of Birth", selection: $date , displayedComponents: .date)
                            .frame(width: 310, height: 50)
                            .font(Font.custom("SF Pro Display", size: 17))
                            .foregroundColor(Color(red: 0.773, green: 0.773, blue: 0.781))
                            .background{
                                RoundedRectangle(cornerRadius: 15)
                                //.stroke(lineWidth: 2.0)
                                    .foregroundColor(.white)
                                    .frame(width: UIScreen.screenWidth-32, height: 50)
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
                    TextField("Enter experience in year(s)", text: $expTextField)
                        .padding()
                        .background(Color.white.cornerRadius(10))
                        .font(.headline)
                        .lineLimit(1)
                        .padding()
                        .keyboardType(.numberPad)
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
                    HStack{
                        Text("Select a Department:")
                            .foregroundColor(Color(red: 0.773, green: 0.773, blue: 0.781))
                            .font(.headline)
                            .lineLimit(1)
                            .padding()
                        Spacer()
                        Picker(selection: $department, label: Text("Select a department")) {
                            ForEach(0 ..< chosenDept.count) {
                                Text(self.chosenDept[$0])
                            }
                        }
                        .background(bgColour.cornerRadius(10))
                        .padding(.trailing)
                    }
                    .background(Color.white.cornerRadius(10))
                    .padding()
                    TextField("Qualifications", text: $qualificationTextField)
                        .padding()
                        .background(Color.white.cornerRadius(10))
                        .font(.headline)
                        .lineLimit(5)
                        .padding()
                    Button {
                        Auth.auth().createUser(withEmail: emailTextField, password: "Qwerty@123"){authResult, error in
                            if error == nil {
                                addDoctorVM.addDoctor(id:authResult!.user.uid,name: nameTextField, phone: Int(phoneTextField)!, email: emailTextField, department: chosenDept[department], gender: chosenGender[gender], age: Int(age.year!), experience: Int(expTextField)!, qualification: qualificationTextField)
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
                    .padding(.top,30)
                }
                .padding([.top,.bottom])
            }
        }
    }
}

struct AddDoctor_View_Previews: PreviewProvider {
    static var previews: some View {
        AddDoctor_View()
    }
}
