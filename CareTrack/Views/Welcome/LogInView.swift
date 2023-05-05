//
//  LogInView.swift
//  CareTrack
//
//  Created by Sanskriti Sinha on 16/04/23.
//

import SwiftUI
import Firebase

extension String {
  func regex (pattern: String) -> [String] {
    do {
        let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options(rawValue: 0))
      let nsstr = self as NSString
      let all = NSRange(location: 0, length: nsstr.length)
      var matches : [String] = [String]()
        regex.enumerateMatches(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: all) {
        (result : NSTextCheckingResult?, _, _) in
        if let r = result {
            let result = nsstr.substring(with: r.range) as String
          matches.append(result)
        }
      }
      return matches
    } catch {
      return [String]()
    }
  }
}

struct LogInView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @StateObject var login = LogInViewModel()
    @State var showAlert: Bool = false
    @State var alertMessage: String = ""
    @AppStorage("usersignIn") var userIsSignIn: Bool = false
    @AppStorage("doctorsignIn") var doctorIsSignIn: Bool = false


    
    var body: some View {
        VStack {
                
                LogView()
            
                    
                VStack{
                    TextField("Enter your Email", text : $email)
                        .frame(width: 280, height: 40)
                        .font(Font.custom("SF Pro Display", size: 17))
                        
                        .padding(.leading, 30)
                        .background{
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(lineWidth: 2.0)
                                
                                .foregroundColor(Color(red: 0.636, green: 0.716, blue: 0.998))
                                .frame(width: 280, height: 40)
                                .background{
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color(red: 0.926, green: 0.946, blue: 1.001))
                                        
                                }
                        }
                    
                    SecureField("Enter your Password", text : $password)
                        .frame(width: 280, height: 40)
                        .font(Font.custom("SF Pro Display", size: 17))
                        .padding(.leading, 30)
                        .padding()
                        .background{
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(lineWidth: 2.0)
                                
                                .foregroundColor(Color(red: 0.636, green: 0.716, blue: 0.998))
                                .frame(width: 280, height: 40)
                                .background{
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color(red: 0.926, green: 0.946, blue: 1.001))
                                }
                        }
                    
                    Button {
                        verifyUser(email: email, password: password)
                        
                    } label: {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 150, height: 40)
                            .padding()
                            .overlay {
                                Text("Log In")
                                    .foregroundColor(.white)
                                    .font(Font.custom("Archivo", size: 17))
                                    .fontWeight(.medium)
                            }
                    }
                }
                .padding(.top, 50)
                    
                
        }.alert(isPresented: $showAlert) {
            Alert(title: Text("Alert"),message: Text(alertMessage))
        }
        
        
    }
    func verifyUser(email: String, password: String){
        let doctorRegex = email.regex(pattern:"[a-z-A-Z-0-9-.-_]*@caretrack.com")
        
        if doctorRegex.count > 0 && doctorRegex[0] == email{
            Auth.auth().signIn(withEmail: email, password: password){ result, error in
                
                if(error != nil){
                    print(error?.localizedDescription)
                    self.alertMessage = error!.localizedDescription
                    self.showAlert.toggle()
                    return
                }
                
                print("Welcome! doctor")
                doctorIsSignIn.toggle()
            }
        }
        else{
            Auth.auth().signIn(withEmail: email, password: password){ result, error in
                
                if(error != nil){
                    print(error?.localizedDescription)
                    self.alertMessage = error!.localizedDescription
                    self.showAlert.toggle()
                    return
                }
                
                print("Welcome! user")
                userIsSignIn.toggle()
            }
        }
        
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
