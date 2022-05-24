protocol ApiRest: AnyObject {
    func fetchData(onCompletion: @escaping ([Character]?, ApiCallError?) -> Void)
}
