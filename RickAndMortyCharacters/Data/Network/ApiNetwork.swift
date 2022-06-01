protocol ApiNetwork {
    func request(url: String, onCompletion: @escaping (Result<[Character], ApiCallError>) -> Void)
}
