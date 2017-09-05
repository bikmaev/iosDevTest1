//
//  AdviceServices.swift
//  iosDevTest1
//
//  Created by MacBook on 04.09.17.
//  Copyright © 2017 Ozsoft. All rights reserved.
//

import Foundation
class AdviceServices {
    var advices: [Advice] = []
    init() {
        advices = loadAdvices(fileName: "advices", ext: "json")
        
    }
    
    func randomAdvice()-> Advice
    {
        let advices = self.advices.count
        let random_advice_id = Int(arc4random_uniform(UInt32(advices)))
        
        return self.advices[random_advice_id]
    }
    
    func loadAdvices(fileName : String, ext : String) -> [Advice]
    {
        let path =  Bundle.main.path(forResource: fileName, ofType: ext)
        guard let resourcePath = path else  {
            
            return [Advice]()
            
        }
        let url = URL(fileURLWithPath:resourcePath)
        guard let data = try? Data(contentsOf: url)
            else {
                return [Advice]()
        }
        
        if let json_data = try? JSONSerialization.jsonObject(with: data) as? [[String:Any]] {
            //var advice_from_json=[Int64, String, Int64,String]
 
            var advices_from_json = [Advice]()
            for json_element in json_data! {
                var identifier1 = Int64()
                var sound1 = String()
                var text1 = String()
                var stat1 = Int64()
                
                if let text = (json_element["text"] as? String){
                    text1=text
                } else {
                    continue
                }

                if let identifier = Int64((json_element["identifier"] as? String)!){
                    identifier1 = identifier
                } else {
                    continue
                }
                if let stat = Int64((json_element["stat"] as? String)!){
                    stat1 = stat
                } else {
                    continue
                }
                if let sound = (json_element["sound"] as? String){
                    sound1 = sound
                } else {
                    continue
                }
                
                advices_from_json.append(Advice(id: identifier1, text: text1, stat: stat1, sound: sound1))
            }
            return advices_from_json
        } else{
            print ("failed jsonSerialization ")
        }
        return [Advice]()
    }
}
