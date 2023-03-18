//
//  CurrentLocationWeatherTableViewCell.swift
//  WeatherForecast
//
//  Created by Shibin on 18/03/2023.
//

import UIKit

class CurrentLocationWeatherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadCellData(data: List) {
        dateLabel?.text = data.dtTxt
        let icon = data.weather?.first?.icon ?? ""
        tempMinLabel?.text = "Temperature (Min): \(data.main?.tempMin ?? 0)"
        tempMaxLabel?.text = "Temperature (Max):\(data.main?.tempMax ?? 0)"
        weatherLabel?.text = "Weather: \(data.weather?.first?.description ?? "")  \(icon.encodeEmoji)"
        windSpeedLabel?.text = "Wind Speed: \(data.wind?.speed ?? 0)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
