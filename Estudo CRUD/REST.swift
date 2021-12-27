//
//  REST.swift
//  Estudo CRUD
//
//  Created by Luana Martinez de La Flor on 01/12/21.
//

import Foundation


enum PokeError{
    case url
    case taskError(error: Error)
    case noResponse
    case noData
    case responseStatusCode(code: Int)
    case invalideJason
    
}

 //var listPokemmonREST: [Pokemon] = []


class REST {
    
    private static let basePath = "https://pokeapi.co/api/v2/"
    private static let listPath = "pokemon?limit=100&offset=200"
    private static let pokePath =  "pokemon/"
    
    private static let configuration: URLSessionConfiguration = {
       
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Content-Type":"application/json"]
        config.timeoutIntervalForRequest = 30.0
        config.httpMaximumConnectionsPerHost = 30
        return config
        
    }()
    
    private static let session = URLSession(configuration: configuration)
    
//    class func loadPokesList(_ onComplete: @escaping (ListPokemmon)-> Void, onError: @escaping (PokeError)-> Void) {
//        guard let  url = URL(string: basePath+listPath)else{
//            onError(.url)
//            print("erro")
//            return}
//        
//          let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
//            if error == nil {
//                guard let response = response as? HTTPURLResponse else{
//                    onError(.noResponse)
//                    print("erro")
//                    return}
//                if response.statusCode == 200{
//                    guard let data = data else {
//                        onError(.responseStatusCode(code: response.statusCode))
//                        print("erro")
//                        return}
//                   do{
//                        let listPokemmon = try JSONDecoder().decode(ListPokemmon.self, from: data)
//                        onComplete(listPokemmon)
//                    }catch{
//                        print("error")
//                        onError(.invalideJason)}
//                    }else{
//                    print ("status invalido")}
//                }else{
//                    print("erro")
//                    onError(.taskError(error: error!))
//            }
//        }
//        dataTask.resume()
//    }
    
    class func loadPokeDetails(_ onComplete: @escaping (Pokemon)->Void){
       


        for e in 1..<300 {
        
        
        guard let url = URL(string: basePath + pokePath + String (e) ) else{return}
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            if error == nil {
                guard  let response = response as? HTTPURLResponse else {return}
                if response.statusCode == 200{
                    guard let data = data else {
                       print("erro")
                        return}
                   do{
                        let pokemmonInfo = try JSONDecoder().decode(Pokemon.self, from: data)
                    onComplete(pokemmonInfo)
                    
                   //listPokemmonREST.append(pokemmonInfo)
                   // print("ListaRest", listPokemmonREST.count)
                  //  print ("esse e o pokde da REST 09",  pokemmonInfo.name)
                    }catch{
                        print(error)
                    }
                
                }else{}
            
            
        }
    
    }
            dataTask.resume()
        }
        
}
    
}
