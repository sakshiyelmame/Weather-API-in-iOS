//
//  ViewController.swift
//  Weather API in iOS
//
//  Created by Sakshi Yelmame on 08/04/23.
//

import UIKit
import Kingfisher
class ViewController: UIViewController {

    @IBOutlet weak var updateTimeUILabel: UILabel!
 
    @IBOutlet weak var regionUILabel: UILabel!
    
    @IBOutlet weak var countryUILabel: UILabel!
    
    @IBOutlet weak var tempUILabel: UILabel!
    
    @IBOutlet weak var windUILabel: UILabel!
    
    @IBOutlet weak var humidityUILabel: UILabel!
    
    @IBOutlet weak var updatedUIImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
  func fetchData()
    {
        let url = URL(string: "http://api.weatherapi.com/v1/current.json?key=544ab89bf6404165acd51319230804&q=Nasik&aqi=no")
        let dataTask = URLSession.shared.dataTask(with: url!, completionHandler: {
          (data, response, error) in
            guard let data = data, error == nil else
            {
                print("Error Occured While Accssing Data With URL")
                return
            }
            var fullWeatherData: WeatherData?
            do
            {
                fullWeatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                print(fullWeatherData)
            }
            catch
            {
                print("Error Occured While Decoding JSON Into Swift Structure \(error)")
            }
            DispatchQueue.main.async {
                self.updateTimeUILabel.text = "Updated : \(fullWeatherData!.current.last_updated)"
                self.regionUILabel.text = "Region : \(fullWeatherData!.location.region)"
                self.countryUILabel.text = "Country : \(fullWeatherData!.location.country)"
                self.tempUILabel.text = "Temperature (Celsius) : \(fullWeatherData!.current.temp_c)"
                self.humidityUILabel.text = "Humidity : \(fullWeatherData!.current.humidity)"
                self.windUILabel.text = "Wind (Km/Hr) : \(fullWeatherData!.current.wind_kph)"
                if let imageLink = URL(string: "https:\(fullWeatherData!.current.condition.icon)")
                {
                    self.updatedUIImageView.kf.setImage(with: imageLink)
                }
            }
            
        })
        dataTask.resume()
    }

    @IBAction func refreshData(_ sender: Any) {
        fetchData()
    }
}

