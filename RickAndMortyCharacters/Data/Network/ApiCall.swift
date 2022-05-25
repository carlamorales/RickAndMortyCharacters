import Foundation

final class ApiCall: ApiRest {
    
    private let urlSession: URLSession
    
    init(session: URLSession = URLSession.shared) {
        urlSession = session
    }
    
    func fetchData(onCompletion: @escaping (Result <[Character], ApiCallError>) -> Void) {
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = urlSession.dataTask(with: request) { data, response, error in
            if let data = data {
                if let charactersList = try? JSONDecoder().decode(CharactersList.self, from: data) {
                    onCompletion(.success(charactersList.results))
                } else {
                    onCompletion(.failure(ApiCallError(message: "Invalid Model")))
                }
            } else {
                onCompletion(.failure(ApiCallError(message: "Invalid Request")))
            }
        }
        task.resume()
    }
    
}
