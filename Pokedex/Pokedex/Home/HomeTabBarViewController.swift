//
//  HomeTabBarViewController.swift
//  Pokedex
//
//  Created by Vitor Aspirot on 04/08/22.
//

import Foundation
import UIKit

class HomeTabBarViewController: UITabBarController {
    
    private var pokemonList: UIViewController {
        let navigation = UINavigationController()
        navigation.tabBarItem = .init(title: "Pokémons", image: UIImage(systemName: "square.grid.3x2.fill"), tag: 0)
        
        let pokeListViewController = PokemonListCoordinator.createModule(using: navigation)
        
        navigation.viewControllers = [pokeListViewController]
        
        return navigation
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        buildViews()
    }
    
    func configViews() {
        self.tabBar.tintColor = Colors.label()
        
        let barAppearence = UIBarAppearance()
        barAppearence.backgroundColor = Colors.pokedex()
        barAppearence.shadowColor = .clear
        
        let appearence = UITabBarAppearance(barAppearance: barAppearence)
        
        self.tabBar.standardAppearance = appearence
        self.tabBar.scrollEdgeAppearance = appearence
    }
    
    func buildViews() {
        viewControllers = [pokemonList]
    }
    
}
