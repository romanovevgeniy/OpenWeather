import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .font(.title).bold()
                    
                    Text("Сегодня: \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        
                        VStack(spacing: 20) {
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Text(weather.main.feels_like.roundedDouble() + "º")
                            .font(.system(size: 90))
                            .fontWeight(.bold)
                            .padding()
                        
                        Spacer()
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    AsyncImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Town_Cityscape.svg/1024px-Town_Cityscape.svg.png")) {
                        image in image.resizable().aspectRatio(contentMode: .fit).frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Погода сейчас")
                        .bold().padding(.bottom)
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Мин темп", value: (weather.main.temp_min.roundedDouble() + "º"))
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Макс темп", value: (weather.main.temp_max.roundedDouble() + "º"))
                    }
                    HStack {
                        WeatherRow(logo: "wind", name: "Скорость ветра", value: (weather.wind.speed.roundedDouble() + " м/с"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Влажность", value: (weather.main.humidity.roundedDouble() + " %"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.595, saturation: 0.632, brightness: 0.959))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.595, saturation: 0.632, brightness: 0.959))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
