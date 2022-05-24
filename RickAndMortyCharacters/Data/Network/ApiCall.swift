import Foundation

final class ApiCall: ApiRest {
    
    private let urlSession: URLSession
    
    init(session: URLSession = URLSession.shared) {
        urlSession = session
    }
    
    func fetchData(onCompletion: @escaping ([Character]?, ApiCallError?) -> Void) {
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = urlSession.dataTask(with: request) { data, response, error in
            if let data = data {
                if let charactersList = try? JSONDecoder().decode(CharactersList.self, from: data) {
                    onCompletion(charactersList.results, nil)
                } else {
                    onCompletion(nil, ApiCallError(message: "Invalid model"))
                }
            } else {
                onCompletion(nil, ApiCallError(message: "Invalid request"))
            }
        }
        task.resume()
    }
    
}
