protocol ApiRest: AnyObject {
    func fetchData(onCompletion: @escaping (Result <[Character], ApiCallError>) -> Void)
}
