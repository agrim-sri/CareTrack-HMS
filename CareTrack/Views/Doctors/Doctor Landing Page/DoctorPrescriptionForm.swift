//
//  DoctorPrescriptionForm.swift
//  CareTrack
//
//  Created by Zeal Shah  on 21/04/23.
//

import SwiftUI
struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        // 1
        Button(action: {

            // 2
            configuration.isOn.toggle()

        }, label: {
            HStack {
                // 3
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")

                configuration.label
            }
        })
    }
}

struct DoctorPrescriptionForm: View {
    @State var morningColor:Color = Color(red: 255/255, green: 192/255, blue: 101/255)
    @State var afternoonColor:Color = Color(red: 255/255, green: 128/255, blue: 57/255)
    @State var noonColor:Color = Color(red: 0/255, green: 99/255, blue: 202/255)
    @State var symptomTextField: String = ""
    @State var medTextField: [String] = ["","","","",""]
    @State var dosage: [[String]] = [["","","",""],["","","",""],["","","",""],["","","",""]]
    @State var remarkTextField: String = ""
    @State var testTextField: String = ""
    @State var suggestionTextField: String = ""
    @State var diagTextField: String = ""
    @State var isOnMed: Bool = false
    @State var isOnTest: Bool = false
    @State var morning:String = ""
    @State var bgColour: Color = Color(red: 242/255, green: 242/255, blue: 242/255)
    @State var medCount: Int = 1
    @State var numberOfDay: String = "30"
    let columns: [GridItem] = [GridItem(.fixed(UIScreen.screenWidth / 10)),GridItem(.fixed(UIScreen.screenWidth / 10)),GridItem(.fixed(UIScreen.screenWidth / 10))]
    var medicineTime:[String] = ["M","A","N"]
    var medicineImg:[String] = ["sun.max","sun.haze","moon"]
    var medicineAddColor:[Color] = [Color(red: 255/255, green: 192/255, blue: 101/255),Color(red: 255/255, green: 128/255, blue: 57/255),Color(red: 0/255, green: 99/255, blue: 202/255)]
    
    var doctorId:String = ""
    var doctorName :String = ""
    var patientId:String = ""
    var patientName:String = ""
    
    var body: some View {
        ZStack {
            bgColour
                .ignoresSafeArea()
            ScrollView {
                
                VStack {
                    Text("Prescription Form")
                        .font(Font.custom("SF Pro Display Bold",size: 32))
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.leading)
                    VStack{
                        Text("Symptoms:")
                            .font(Font.custom("SF Pro Display Semibold",size: 24))
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding(.leading)
                        TextField("Add patient symptoms...", text: $symptomTextField)
                            .padding()
                            .background(Color.white.cornerRadius(10))
                            .font(.headline)
                            .lineLimit(4)
                    }
                    .padding()
                    Spacer()
                }
                VStack{
                    HStack{
                        Group{
                            Toggle(isOn: $isOnMed){
                                Text("Medications")
                                    .font(Font.custom("SF Pro Display Semibold",size: 24))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .padding(.leading)
                                
                                
                            }
                            .toggleStyle(iOSCheckboxToggleStyle())
                            .padding(.leading)
                            .foregroundColor(.black)
                        }
                        if isOnMed{
                            Stepper("", value: $medCount, in: 1...5)
                        }
                  
                    }
                    if isOnMed{
                        VStack {
                            ForEach(0..<medCount,id :\.self){j in
                                VStack{
                                    TextField("Add a medicine", text: $medTextField[j])
                                    
                                        .padding()
                                        .background(Color(red: 0.949, green: 0.949, blue: 0.949))
                                        .font(.headline)
                                        .lineLimit(4)
                                        .cornerRadius(10)
                                    
                                        .padding([.top,.leading,.trailing],30)
                                    
                                    HStack(spacing:20){
                                        VStack{
                                            Image(systemName: "sun.max")
                                            TextField(" ", text: $dosage[j][0])
                                                .font(Font.custom("SF Pro Display Semibold",size: 24))
                                                .foregroundColor(.black)
                                                .background(Color(red: 0.949, green: 0.949, blue: 0.949))
                                                .cornerRadius(10)
                                                .frame(width: 70)
                                                .multilineTextAlignment(.center)
                                                .keyboardType(.numberPad)
                                            Text("M")
                                            
                                        }
                                        VStack{
                                            Image(systemName: "sun.haze")
                                            TextField(" ", text: $dosage[j][1])
                                                .font(Font.custom("SF Pro Display Semibold",size: 24))
                                                .foregroundColor(.black)
                                                .background(Color(red: 0.949, green: 0.949, blue: 0.949))
                                                .cornerRadius(10)
                                                .frame(width: 70)
                                                .multilineTextAlignment(.center)
                                                .keyboardType(.numberPad)
                                            Text("A")
                                            
                                        }
                                        VStack{
                                            Image(systemName: "moon")
                                            TextField(" ", text: $dosage[j][2])
                                                .font(Font.custom("SF Pro Display Semibold",size: 24))
                                                .foregroundColor(.black)
                                                .background(Color(red: 0.949, green: 0.949, blue: 0.949))
                                                .cornerRadius(10)
                                                .frame(width: 70)
                                                .multilineTextAlignment(.center)
                                                .keyboardType(.numberPad)
                                            Text("N")
                                        }
                                        TextField(" ", text: $numberOfDay)
                                            .background(Color(red: 0.949, green: 0.949, blue: 0.949))
                                            .frame(width: 25)
                                            .font(Font.custom("SF Pro Display Regular",size: 16))
                                            .foregroundColor(.black)
                                            .cornerRadius(10)
                                        
                                            .multilineTextAlignment(.center)
                                        Text("Days")
                                            .font(Font.custom("SF Pro Display Semibold",size: 16))
                                            .foregroundColor(.black)
                                            .padding(.trailing)
                                    }
                                    .padding([.leading,.trailing],20)
                                    
                                }
                                
                                HStack{
                                    Text("Remarks:")
                                        .font(Font.custom("SF Pro Display Semibold",size: 24))
                                        .foregroundColor(.black)
                                    //.frame(maxWidth: .infinity,alignment: .leading)
                                        .padding(.leading)
                                        .padding(.top)
                                    TextField("optional", text: $remarkTextField)
                                        .padding()
                                        .background(Color(red: 0.949, green: 0.949, blue: 0.949))
                                        .cornerRadius(10)
                                        .font(.headline)
                                        .lineLimit(4)
                                        .padding(.trailing)
                                        .padding(.top)
                                    
                                    
                                }
                                
                                .padding()
                                
                            }
                        }.background{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.white)
                                .frame(width: UIScreen.screenWidth - 32)
                            
                        }
                        
                    }
                    
                    
                }
                VStack{
                    HStack{
                        Toggle(isOn: $isOnTest){
                            Text("Tests")
                                .font(Font.custom("SF Pro Display Semibold",size: 24))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .padding(.leading)
                        }
                        .toggleStyle(iOSCheckboxToggleStyle())
                        .foregroundColor(.black)
                        
                    }
                    .padding()
                    if isOnTest{
                        TextField("Add tests", text: $testTextField)
                            .padding()
                            .background(Color.white.cornerRadius(10))
                            .font(.headline)
                            .lineLimit(4)
                            .padding(.leading)
                            .padding(.trailing)
                    }
                    
                    
                    
                }
                
                VStack{
                    Text("Suggestions:")
                        .font(Font.custom("SF Pro Display Semibold",size: 24))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.leading)
                    TextField("Add suggestions...", text: $suggestionTextField)
                        .padding()
                        .background(Color.white.cornerRadius(10))
                        .font(.headline)
                        .lineLimit(4)
                    Text("Diagnosis")
                        .font(Font.custom("SF Pro Display Semibold",size: 24))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.leading)
                    TextField("Add Diagnosis", text: $diagTextField)
                        .padding()
                        .background(Color.white.cornerRadius(10))
                        .font(.headline)
                        .lineLimit(4)
                    
                    Button() {
                        
                    }label: {
                        Text("Save")
                            .padding(.horizontal,60)
                            .padding(.vertical,8)
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(.blue)
                            )
                        
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.blue,lineWidth: 2)
                            }
                        
                        
                    }.padding(.top)
                        .buttonStyle(.plain)
                    
                    
                }
                .padding()
                
            }
        }
        
        
    }
    
}

    
    struct DoctorPrescriptionForm_Previews: PreviewProvider {
        static var previews: some View {
            DoctorPrescriptionForm()
        }
    }

