import Foundation

// Presenter -> Coordinator
internal protocol PokemonDetailsCoordinatorProtocol {

}

// Presenter -> ViewController
internal protocol PokemonDetailsViewProtocol: AnyObject {

}

// ViewController -> Presenter
internal protocol PokemonDetailsPresenterProtocol {

}

// Presenter -> Repository
internal protocol PokemonDetailsRepositoryInputProtocol {
    
}

// Repository -> Presenter
internal protocol PokemonDetailsRepositoryOutputProtocol: AnyObject {
    
}
