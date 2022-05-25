class DetailViewControllerFactory {
    
    static func makeDetailViewController() -> DetailViewController {
        let detailViewController = DetailViewController(
            viewDataSource: DetailViewDataSource(),
            viewDelegate: DetailViewDelegate()
        )
        return detailViewController
    }
    
}
