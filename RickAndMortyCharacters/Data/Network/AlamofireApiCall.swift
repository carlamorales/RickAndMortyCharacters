import Foundation
import Alamofire

class AlamofireApiCall: ApiRest {
    
    private let statusOk = 200...299
    
    func fetchData(onCompletion: @escaping (Result<[Character], ApiCallError>) -> Void) {
        let url = "https://rickandmortyapi.com/api/character"
        AF.request(url, method: .get).validate(statusCode: statusOk).responseDecodable(of: CharactersList.self) { response in
            if let charactersList = response.value?.results {
                onCompletion(.success(charactersList))
            } else {
                onCompletion(.failure(ApiCallError(message: "Error")))
            }
        }
    }
    
}
