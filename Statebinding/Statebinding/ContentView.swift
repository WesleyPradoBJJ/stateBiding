//
//  ContentView.swift
//  Statebinding
//
//  Created by Wesley Prado on 30/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var automaticOn = false
    @State var screenBrightness = 50.0
    @State var raiseToWake = false
    let sectionAppearance = "Appearance"
    let sectionBrightness =  "Brightness"
    let footnote =  "When in Low Power Mode, auto-lock us restricted to 30 seconds."
    
    
    var body: some View {
        Form{
            Section(header: Text(sectionAppearance)) {
                Image("theme")
                    .resizable()
                    .scaledToFit()
                    //.padding(EdgeInsets(top: 10, leading: 40, bottom: 10, trailing: 40))
                HStack{
                    Text("Automatic")
                    Spacer()
                    Toggle("", isOn: $automaticOn)
                }
                
                HStack{
                    Text("Options")
                    Spacer()
                    Text("Light Until Sunset")
                        .foregroundColor(.gray)
                        .font(.system(.callout))
                }
            }
            
            Section(header: Text(sectionBrightness)){
                
                HStack{
                    
                    Image(systemName: "sun.max.fill")
                        .foregroundColor(.gray)
                    Slider(value: $screenBrightness, in: 0...100)
                        .onChange(of: screenBrightness) { value in
                            print(screenBrightness)
                        }
                    Image(systemName: "sun.max.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.gray)
                }
            }
            
            Section{
                HStack{
                    Text("Night Shift")
                    Spacer()
                    Text("22:30 to 07:00")
                        .foregroundColor(.gray)
                        .font(.system(.callout))
                }
            }
            
            Section(footer:Text(footnote)){
                HStack{
                    Text("Auto-Lock")
                        .foregroundColor(.gray)
                        .font(.system(.callout))
                    Spacer()
                    Text("30 seconds")
                        .foregroundColor(.gray)
                        .font(.system(.callout))
                }
                
                HStack{
                    Text("Raise to Wake")
                    Spacer()
                    Toggle("", isOn: $raiseToWake)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
