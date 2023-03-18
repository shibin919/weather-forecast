//
//  WeatherForecastTableViewCell.swift
//  WeatherForecast
//
//  Created by Shibin on 18/03/2023.
//

import UIKit

class WeatherForecastTableViewCell: UITableViewCell {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadCellData(data: weatherModel) {
        cityNameLabel?.text = data.name
        
        tempMinLabel?.text = "Temperature (Min): \(data.main?.tempMin ?? 0)"
        tempMaxLabel?.text = "Temperature (Max):\(data.main?.tempMax ?? 0)"
        weatherLabel?.text = "Weather: \(data.weather?.first?.description ?? "")"
        windSpeedLabel?.text = "Wind Speed: \(data.wind?.speed ?? 0)"
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension String {
    var encodeEmoji: String{
        if let encodeStr = NSString(cString: self.cString(using: .nonLossyASCII)!, encoding: String.Encoding.utf8.rawValue){
            return encodeStr as String
        }
        return self
    }
}
