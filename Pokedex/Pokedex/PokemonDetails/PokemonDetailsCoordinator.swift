import UIKit

class PokemonDetailsCoordinator {
    
    weak private(set) internal var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension PokemonDetailsCoordinator: PokemonDetailsCoordinatorProtocol {
    
}

extension PokemonDetailsCoordinator {
    
    class func createModule(navigationController: UINavigationController?) -> UIViewController {
        let repository = PokemonDetailsRepository()

        let coordinator = PokemonDetailsCoordinator(navigationController: navigationController)
        
        let presenter = PokemonDetailsPresenter(
            repository: repository,
            coordinator: coordinator)
        
        repository.output = presenter

        let viewController = PokemonDetailsViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
    
}
