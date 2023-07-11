import UIKit

// CRUD 네트워킹

// 1. GET메서드(서버에서 데이터 읽어오기)

func getMethod() {
    guard let url = URL(string: "http://dummy.restapiexample.com/api/v1/employees") else {
        print("Error: cannot create URL")
        return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        guard error == nil else {
            print("Error: error calling GET")
            print(error!)
            return
        }
        
        guard let safeData = data else {
            print("Error: did not receive data")
            return
        }
        
        guard let response = response as? HTTPURLResponse, (200..<299) ~= response.statusCode else {
            print("Error: Http request failed")
            return
        }
        
        print(String(decoding: safeData, as: UTF8.self))
    }.resume()
}


getMethod()


func postMethod() {
    guard let url = URL(string: "http://dummy.restapiexample.com/api/v1/create") else {
        print("Error: cannot create URL")
        return
    }
    
    struct UploadData: Codable {
        let name: String
        let salary: String
        let age: String
        
    }
    
    let uploadDataModel = UploadData(name: "Jack", salary: "3540", age: "23")
    
    guard let jsonData = try? JSONEncoder().encode(uploadDataModel) else {
        print("Error: Trying to convert model to JSON data")
        return
    }
    
    var requeset = URLRequest(url: url)
    requeset.httpMethod = "POST"
    requeset.setValue("application/json", forHTTPHeaderField: "Content-Type")
    requeset.setValue("application/json", forHTTPHeaderField: "Accept")
    requeset.httpBody = jsonData
    
    URLSession.shared.dataTask(with: requeset) { data, response, error in
        guard error == nil else {
            print("Error: error calling POST")
            print(error!)
            return
        }
        
        guard let safeData = data else {
            print("Error: Did not receive data")
            return
        }
        
        guard let response = response as? HTTPURLResponse, (200..<299) ~= response.statusCode else {
            print("Error: HTTP request failed")
            return
        }
        
        print(String(decoding: safeData, as: UTF8.self))
    }.resume()
}

postMethod()


