import Foundation

internal class PokemonDetailsPresenter {

    weak var view: PokemonDetailsViewProtocol?
    let repository: PokemonDetailsRepositoryInputProtocol
    let coordinator: PokemonDetailsCoordinatorProtocol
    
    init(repository: PokemonDetailsRepositoryInputProtocol,
                  coordinator: PokemonDetailsCoordinatorProtocol) {
        self.repository = repository
        self.coordinator = coordinator
    }
}

// MARK: - Presenter Protocol
extension PokemonDetailsPresenter: PokemonDetailsPresenterProtocol {

}
// MARK: - Repository Output
extension PokemonDetailsPresenter: PokemonDetailsRepositoryOutputProtocol {
    
}
