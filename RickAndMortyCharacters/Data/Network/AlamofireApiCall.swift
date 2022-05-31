import Foundation

class AlamofireApiCall: ApiRest {

    private let network: ApiNetwork
    
    init(network: ApiNetwork) {
        self.network = network
    }
    
    func fetchData(onCompletion: @escaping (Result<[Character], ApiCallError>) -> Void) {
        let url = "https://rickandmortyapi.com/api/character"
        network.request(url: url, onCompletion: onCompletion)
    }
    
}
