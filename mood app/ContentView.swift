//
//  ContentView.swift
//  mood app
//
//  Created by FAMU on 4/25/24.
//



import SwiftUI
import UIKit

// Enum to represent different moods
enum Mood: String, CaseIterable {
    case happy = "😊 Happy"
    case sad = "😢 Sad"
    case excited = "🤩 Excited"
    case angry = "😡 Angry"
    case calm = "😌 Calm"
    case surprised = "😲 Surprised"
    case loving = "😍 Loving"
    case anxious = "😰 Anxious"
}

struct ContentView: View {
    var body: some View {
        TabView {
            HomePage()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            MoodSelectionPage()
                .tabItem {
                    Image(systemName: "face.smiling")
                    Text("Mood")
                }
            CalendarPage()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }
            DataAnalysisPage()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("Analysis")
                }
            SettingsPage()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}

struct HomePage: View {
    var body: some View {
        Text("⭐️Welcome to Moody!⭐️")
            .font(.title)
            .padding()
    }
}

struct MoodSelectionPage: View {
    @State private var selectedMood: Mood?
    
    var body: some View {
        VStack {
            Text("How are you feeling today?")
                .font(.title)
                .padding()
            
            ForEach(Mood.allCases, id: \.self) { mood in
                Button(action: {
                    self.selectedMood = mood
                }) {
                    Text(mood.rawValue)
                        .font(.headline)
                        .padding()
                        .background(self.selectedMood == mood ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.vertical, 5)
            }
            
            if let selectedMood = selectedMood {
                Text("You selected: \(selectedMood.rawValue)")
                    .font(.title)
                    .padding()
            }
            
            Spacer()
        }
    }
}

struct CalendarPage: View {
    // Mock data for demonstration
    let moodData: [String: [Mood]] = [
        "2024-04-28": [.happy, .excited],
        "2024-04-29": [.sad],
        "2024-04-30": [.angry, .calm, .surprised],
        "2024-05-1": [ .calm,],
        // Add more mood data...
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Calendar")
                    .font(.title)
                    .padding()
                ForEach(Array(moodData.keys).sorted(), id: \.self) { date in
                    HStack {
                        Text(date)
                            .padding(.leading)
                        Spacer()
                        Text(self.moodData[date]?.map { $0.rawValue }.joined(separator: ", ") ?? "Unknown")
                            .padding(.trailing)
                    }
                    Divider()
                }
            }
        }
        .navigationBarTitle("Calendar")
    }
}



struct DataAnalysisPage: View {
    
    var body: some View {
        VStack {
            Text("Mood Analysis")
                .font(.title)
                .padding()
            
            Image("data") .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                .frame(width: 340.0, height: 480.0)
            Text("🟢 - 😊 Happy, 🔵 - 😢 Sad, 🔴 - 😡 Angry, 🟡 - 😌 Calm")
                .font(.title)
                .padding()
        }
    }
}

struct SettingsPage: View {
    @State private var username: String = ""
    @State private var email: String = ""
    
    var body: some View {
        VStack {
            Text("Profile Settings")
                .font(.title)
                .padding()
            
            TextField("Name", text: $username)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Email", text: $email)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Password", text: $email)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
        }
        .navigationBarTitle("Settings")
    }
}


struct PieChartView: View {
    let moodCounts: [Mood: Int]
    
    var body: some View {
        // Implement your pie chart here
        Text("Pie Chart Placeholder")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


#Preview {
    ContentView()
}



