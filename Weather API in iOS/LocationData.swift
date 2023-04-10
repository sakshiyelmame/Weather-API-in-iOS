//
//  LocationData.swift
//  Weather API in iOS
//
//  Created by Sakshi Yelmame on 08/04/23.
//

import Foundation
struct WeatherData: Codable
{
    let location: LocationData
    let current: CurrentData
}

struct LocationData: Codable
{
   let name : String
   let region : String
   let country : String
   let  lat : Double
   let lon : Double
   let tz_id : String
   let localtime_epoch : Int
   let localtime : String
}

struct CurrentData: Codable
{
    let last_updated_epoch : Int
    let last_updated : String
    let temp_c : Double
    let temp_f : Double
    let is_day : Double
    let wind_mph : Double
    let wind_kph : Double
    let wind_degree : Int
    let wind_dir : String
    let pressure_mb : Int
    let pressure_in : Double
    let precip_mm : Int
    let precip_in : Int
    let humidity : Int
    let cloud : Int
    let feelslike_c : Double
    let feelslike_f : Double
    let vis_km : Int
    let vis_miles : Int
    let uv : Int
    let gust_mph : Double
    let gust_kph : Double
    let condition : ConditionData
}
 
struct ConditionData: Codable
{
   let text : String
   let icon : String
   let code : Int
}
