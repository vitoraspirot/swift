import Foundation

internal class PokemonDetailsRepository {

    weak var output: PokemonDetailsRepositoryOutputProtocol?

}

// MARK: - Repository Input
extension PokemonDetailsRepository: PokemonDetailsRepositoryInputProtocol {

}
