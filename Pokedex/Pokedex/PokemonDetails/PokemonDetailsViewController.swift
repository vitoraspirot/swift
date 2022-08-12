import UIKit

class PokemonDetailsViewController: UIViewController {

    private let presenter: PokemonDetailsPresenterProtocol

    init(presenter: PokemonDetailsPresenterProtocol) {
        self.presenter = presenter
        super.init()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - PokemonDetailsViewControllerProtocol
extension PokemonDetailsViewController: PokemonDetailsViewProtocol {

}
