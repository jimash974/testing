//
//  inputDataView.swift
//  BLINK
//
//  Created by yuri wardana on 21/06/23.
//

import SwiftUI

struct inputDataView: View {
    
    @Environment(\.managedObjectContext) var dbContext
    @Environment (\.dismiss) var dismiss
    
    
    var rute = ["Red", "Green", "Blue", "Tartan"]
    var halte = ["Red", "Green", "Blue", "Tartan"]
    var jam = ["10.00","11.00","12.00"]
    @State private var pilihRute = "Red"
    @State private var pilihhalteAwal = "Red"
    @State private var pilihhalteAkhir = "Red"
    @State private var pilihJam = "10.00"
    @State private var isBookmarked : Bool = false
    
    
    
    @FetchRequest(sortDescriptors: [], predicate: nil, animation: .default) private var listofBookmark: FetchedResults <Item>
    
    var body: some View {
        
            VStack(spacing: 12) {
                Picker("rute: ", selection: $pilihRute) {
                                ForEach(rute, id: \.self) {
                                    Text($0)
                                    
                                }
                            }
                .pickerStyle(.menu)
                
                Picker("awal: ", selection: $pilihhalteAwal) {
                                ForEach(halte, id: \.self) {
                                    Text($0)
                                    
                                }
                            }
                .pickerStyle(.menu)
                
                Picker("akhir: ", selection: $pilihhalteAkhir) {
                                ForEach(halte, id: \.self) {
                                    Text($0)
                                    
                                }
                            }
                .pickerStyle(.menu)
                
                Picker("jam: ", selection: $pilihJam) {
                                ForEach(jam, id: \.self) {
                                    Text($0)
                                    
                                }
                            }
                .pickerStyle(.menu)
                
                
                Button {
                    
                    addBookmark (rute : pilihRute, halteAwal : pilihhalteAwal, halteAkhir : pilihhalteAkhir, jam : pilihJam)
                } label: {
                    Text("Save")
                    
                }
                
                ScrollView (.horizontal) {
                    HStack{
                        ForEach(listofBookmark) { bk in
                            VStack{
                                Text("Rute:" + (bk.rute ?? "not found") )
                                Text("Halte Awal:" + (bk.halteAwal ?? "not found") )
                                Text("Halte Akhir:" + (bk.halterAkhir ?? "not found") )
                                Text("Jam:" + (bk.jam ?? "not found") )
                            }
                            
                            
                        }
                    }
                    }
                
            }
        }
    
        
        
func addBookmark (rute : String, halteAwal : String, halteAkhir : String, jam : String) {
            
            let newBookmark = Item(context: dbContext)
            newBookmark.rute = rute
            
             newBookmark.halteAwal = halteAwal
             newBookmark.halterAkhir = halteAkhir
             newBookmark.jam = jam
            
            do {
                
               
                try dbContext.save()
                
                dismiss()
            } catch {
                print("error di save")
            }
    }
    
    
}


struct inputDataView_Previews: PreviewProvider {
    static var previews: some View {
        inputDataView()
    }
}
