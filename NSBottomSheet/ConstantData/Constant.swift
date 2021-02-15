//
//  Constant.swift
//  NSBottomSheet
//
//  Created by Neeraj Solanki on 16/02/21.
//

import UIKit
class Constant {
    
}
extension WorldExpoController{
    func setupData() {
        expoHistoryArray.append(ExpoHistoryModel.init(expoTitle: "London",
                                                      expeDescription: "The first World Expo was held in the iconic Crystal Palace to showcase the inventions of the Industrial Revolution.", expoYear: "1851", expoImageName: "1851"))
        expoHistoryArray.append(ExpoHistoryModel.init(expoTitle: "Paris",
                                                      expeDescription: "This World Expo introduced the world to innovations including the lawn mower, Moore's washing machine, Singer's sewing machine, the speaking doll, and one of the first vehicles running on oil.", expoYear: "1855", expoImageName: "1855"))
        expoHistoryArray.append(ExpoHistoryModel.init(expoTitle: "London",
                                                      expeDescription: "Among the inventions on display was Charles Babbage’s Analytical Engine – one of the first mechanical computers. After the Expo closed, the site was redeveloped into the Science, Natural History and Victoria and Albert Museums, continuing the Expo’s intellectual legacy.", expoYear: "1862", expoImageName: "1862"))
        
        expoHistoryArray.append(ExpoHistoryModel.init(expoTitle: "Paris",
                                                      expeDescription: "This was the first World Expo to feature national pavilions. They provided a space in which countries could display their culture, their history and their innovations.", expoYear: "1867", expoImageName: "1867"))
        expoHistoryArray.append(ExpoHistoryModel.init(expoTitle: "Vienna",
                                                      expeDescription: "Japan displayed a range of artistic products, inspiring the ‘Japonism’ in late 19th century culture.", expoYear: "1873", expoImageName: "1873"))
        expoHistoryArray.append(ExpoHistoryModel.init(expoTitle: "Paris",
                                                      expeDescription: "Henri Giffard's giant steam-driven tethered airship lifted visitors up to 600 metres above Paris.", expoYear: "1878", expoImageName: "1878"))
        expoHistoryArray.append(ExpoHistoryModel.init(expoTitle: "Barcelona",
                                                      expeDescription: "The Columbus Monument (Monument a Colom), a 60-metre (197 ft) monument to Christopher Columbus, was built on the site where the great explorer returned to Europe after his first voyage to the Americas.", expoYear: "1888", expoImageName: "1888"))
        
        expoHistoryArray.append(ExpoHistoryModel.init(expoTitle: "Paris",
                                                      expeDescription: "The main symbol of the Fair was the Eiffel Tower. It was not immediately popular and some campaigned for its dismantling after the exposition closed", expoYear: "1889", expoImageName: "1889"))
        expoHistoryArray.append(ExpoHistoryModel.init(expoTitle: "Chicago",
                                                      expeDescription: "The world's first huge wheel (Ferris Wheel), was installed to the great delight of visitors.", expoYear: "1893", expoImageName: "1893"))
        expoHistoryArray.append(ExpoHistoryModel.init(expoTitle: "San Francisco",
                                                      expeDescription: "The centrepiece was the Tower of Jewels, which rose to 435 feet and was covered with over 100,000 cut glass gems.", expoYear: "1915", expoImageName: "1915"))
        
        expoHistoryArray.append(ExpoHistoryModel.init(expoTitle: "Barcelona",
                                                      expeDescription: "Barcelona’s França railway station was re-built for the Expo, modern tarred roads were laid and lit by modern street lights, and the first metro lines in the city entered into service.", expoYear: "1929", expoImageName: "1929"))
        
        expoHistoryArray.append(ExpoHistoryModel.init(expoTitle: "New York",
                                                      expeDescription: "This Expo was based on the future with the slogan ‘Dawn of a New Day’ and it featured fledging television broadcasts being seen by the mass public for the first time.", expoYear: "1939", expoImageName: "1939"))
        
        expoHistoryArray.append(ExpoHistoryModel.init(expoTitle: "Seattle",
                                                      expeDescription: "The Expo featured the Space Needle designed by John Graham and Edward Carlson, a 185-metre-high spire with a revolving restaurant at the top that could be reached with external lifts resembling space capsules.", expoYear: "1962", expoImageName: "1962"))
        expoHistoryArray.append(ExpoHistoryModel.init(expoTitle: "Osaka",
                                                      expeDescription: "Among the most remarkable exhibits were an electron microscope with up to a 500,000-fold magnification and the model of a train with an electromagnetic pad capable of travelling up to 500km/h.", expoYear: "1970", expoImageName: "1970"))
        expoHistoryArray.append(ExpoHistoryModel.init(expoTitle: "Sevilla",
                                                      expeDescription: "The Cartuja Island, once the Expo ended, became Cartuja 93, a technical and economic development centre.", expoYear: "1992", expoImageName:"1992"))
        
        expoHistoryArray.append(ExpoHistoryModel.init(expoTitle: "Hanover", expeDescription: "A new railway station was constructed for Expo, a new network of urban roads was created, the tram network was extended, and a third terminal was constructed at the city airport", expoYear: "2000", expoImageName: "2000"))
        expoHistoryArray.append(ExpoHistoryModel.init(expoTitle: "Aichi",
                                                      expeDescription: "Emphasising the close links binding nature to humanity in the 21st century, Expo 2005 Aichi’s theme was ‘Nature’s Wisdom’ and was seen as an experiment in eco-compatible living.", expoYear: "2005", expoImageName: "2005"))
        
        expoHistoryArray.append(ExpoHistoryModel.init(expoTitle: "Shanghai",
                                                      expeDescription: "Thanks to the joint efforts of the Chinese government, the UN and the BIE, the World Cities Day was celebrated for the first time on 31 October 2014, as a result of a declaration triggered by Expo 2010.", expoYear: "2010", expoImageName: "2010"))
        expoHistoryArray.append(ExpoHistoryModel.init(expoTitle: "Milan",
                                                      expeDescription: "Expo 2015's theme was `Feeding the Planet, Energy for Life`, encompassing technology, innovation, culture, traditions and creativity and how they relate to food and diet.", expoYear: "2015", expoImageName: "2015"))
    }
}

extension PavalionsController{
    func setUpData() {
        pavilionsArray.append(PavilionModel(pavilionName: "Terra – The Sustainability", pavilionImage: "0"))
        pavilionsArray.append(PavilionModel(pavilionName: "India Pavilion", pavilionImage: "6"))
        pavilionsArray.append(PavilionModel(pavilionName: "UAE Pavilion", pavilionImage: "1"))
        pavilionsArray.append(PavilionModel(pavilionName: "Australia Pavilion", pavilionImage: "2"))
        pavilionsArray.append(PavilionModel(pavilionName: "Austria Pavilion", pavilionImage: "3"))
        pavilionsArray.append(PavilionModel(pavilionName: "Azerbaijan Pavilion", pavilionImage: "4"))
        pavilionsArray.append(PavilionModel(pavilionName: "Bahrain Pavilion", pavilionImage: "5"))
        
        pavilionsArray.append(PavilionModel(pavilionName: "Belarus Pavilion", pavilionImage: "7"))
        pavilionsArray.append(PavilionModel(pavilionName: "Belgium Pavilion", pavilionImage: "8"))
        pavilionsArray.append(PavilionModel(pavilionName: "Brazil Pavilion", pavilionImage: "9"))
        pavilionsArray.append(PavilionModel(pavilionName: "Canada Pavilion", pavilionImage: "11"))
        pavilionsArray.append(PavilionModel(pavilionName: "China Pavilion", pavilionImage: "12"))
        pavilionsArray.append(PavilionModel(pavilionName: "Czech Republic", pavilionImage: "13"))
        pavilionsArray.append(PavilionModel(pavilionName: "Emirates Pavilion", pavilionImage: "14"))
        pavilionsArray.append(PavilionModel(pavilionName: "Finland Pavilion", pavilionImage: "15"))
        pavilionsArray.append(PavilionModel(pavilionName: "France Pavilion", pavilionImage: "16"))
        pavilionsArray.append(PavilionModel(pavilionName: "Germany Pavilion", pavilionImage: "17"))
        pavilionsArray.append(PavilionModel(pavilionName: "Indonesia Pavilion", pavilionImage: "18"))
        pavilionsArray.append(PavilionModel(pavilionName: "Ireland Pavilion", pavilionImage: "19"))
        pavilionsArray.append(PavilionModel(pavilionName: "Italy Pavilion", pavilionImage: "20"))
        pavilionsArray.append(PavilionModel(pavilionName: "Malaysia Pavilion", pavilionImage: "21"))
        pavilionsArray.append(PavilionModel(pavilionName: "Monaco Pavilion", pavilionImage: "22"))
        pavilionsArray.append(PavilionModel(pavilionName: "Netherlands Pavilion", pavilionImage: "23"))
        pavilionsArray.append(PavilionModel(pavilionName: "New Zealand Pavilion", pavilionImage: "24"))
        pavilionsArray.append(PavilionModel(pavilionName: "Norway Pavilion", pavilionImage: "25"))
    }
}
