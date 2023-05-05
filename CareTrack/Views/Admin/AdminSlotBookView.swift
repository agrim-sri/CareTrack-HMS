//
//  SlotBookingView.swift
//  CareTrack
//
//  Created by Sanjay Krishna on 20/04/23.
//

import SwiftUI
    // columns for grid


    

struct AdminSlotBookView: View {
    @State private var appointmentDate = Date()
    let startingDate:Date=Calendar.current.date(from: DateComponents(year: 2023)) ?? Date()
    let endingDate:Date = Date()
    @State var screenWidth = UIScreen.main.bounds.width*0.9
    @State var selectedButton: Int = 0
    var docID: String = ""
    var docName: String = ""
    var degree: String = ""
    var dept: String = ""
    var experience: Int = 0
    var slotSelected :String = ""
    var date: Date = Date()
    var slots:[String] = ["10:00","10:30","11:00","11:30","17:00","17:30","18:00","18:30","19:00"]
    let Columns:[GridItem] = [
        GridItem(.flexible(minimum: 50, maximum: 100),spacing: nil,alignment:nil),
        GridItem(.flexible(minimum: 50,maximum: 100),spacing: nil,alignment: nil),
        GridItem(.flexible(minimum: 50,maximum: 100),spacing:nil,alignment: nil)]

        // create a second Date instance set to one day in seconds from now
        let tomorrow = Date.now.addingTimeInterval(604800)

        // create a range from those two
        
    let colours:[Color] = [.red,.blue,.cyan,.accentColor,.brown,.gray,.indigo,.orange,.mint,.pink,.teal,.yellow]
    var id: String = ""
    var name: String = ""
    var body: some View {
        
            
            VStack{
                
                
                Text("Select a slot")
                    .font(Font.custom("SF Pro Display Semibold",size: 20))
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.bottom)
                    .padding(.leading)
                        
                
                LazyVGrid(columns: Columns){
                    ForEach(0..<slots.count){index in
                        
                        Button{
                            selectedButton = index
                            
                        }label: {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.blue,lineWidth: 3)
                                .background(selectedButton == index ? .blue : .white)
                                .cornerRadius(20)
                                .frame(height: 50)
                                .overlay(
                                    Text(slots[index])
                                        .foregroundColor(selectedButton == index ? .white : .black)
                                )
                                .font(.system(size: 20))
                        }
                        
                    }.padding(.top)
                        .padding(.bottom)
                    
                }.background{
                    RoundedRectangle(cornerRadius: 28)
                        .padding([.leading,.trailing])
                        .shadow(radius: 5)
                        .foregroundColor(.white)
                    
                }
                
                NavigationLink(destination: AdminPaymentPreviewView(docID: docID,docname: docName,dept: dept,time: slots[selectedButton],date:date,id:id,name:name)) {
                    Text("Book Slot")
                        .font(.system(size: 20))
                        .bold()
                        .padding(.horizontal,60)
                        .padding(.vertical,20)
                        .cornerRadius(30)
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.blue)
                        )
                    
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.blue,lineWidth: 2)
                            
                        }.padding()
                        .padding()
                    
                }
                
                .padding(.top,70)
                
            }
            
            
            .padding(.bottom,100)
                
                
                
                
            }
}
       




struct AdminSlotBookView_Previews: PreviewProvider {
    static var previews: some View {
        AdminSlotBookView()
    }
}

