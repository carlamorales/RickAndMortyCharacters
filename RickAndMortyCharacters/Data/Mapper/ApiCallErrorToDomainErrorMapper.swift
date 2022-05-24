class ApiCallErrorToDomainErrorMapper: Mapper<DomainError, ApiCallError> {
    override func reverseMap(value: ApiCallError) -> DomainError {
        return DomainError(description: value.message)
    }
}
