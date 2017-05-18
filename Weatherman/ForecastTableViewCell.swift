//
//  ForecastTableViewCell.swift
//  Weatherman
//
//  Created by Subodh Jena on 5/18/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var labelDateText: UILabel!
    @IBOutlet weak var labelPressure: UILabel!
    @IBOutlet weak var labelHumidity: UILabel!
    @IBOutlet weak var labelAverageTemp: UILabel!
    @IBOutlet weak var labelTemp: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setUpCell(forecast: ForecastList)  {
        
        self.labelDateText.text = formatDate(date: forecast.dateTxt!)
        self.labelPressure.text = "Pressure: \((forecast.main?.pressure)!)"
        self.labelHumidity.text = "Humidity: \((forecast.main?.humidity)!)"
        self.labelTemp.text = "\((forecast.main?.temp)!)"
        self.labelAverageTemp.text = "Max: \((forecast.main?.temp_max)!) | Min: \((forecast.main?.temp_min)!)"
    }
    
    func formatDate(date: String) -> String {
       
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        guard let date = dateFormatter.date(from: date) else {
            assert(false, "no date from string")
            return ""
        }
        
        dateFormatter.dateFormat = "MMMM dd, yyyy '@' h:mm a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        let timeStamp = dateFormatter.string(from: date)
        
        return timeStamp
    }
}
