import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var memoryGame = MemoryGame.shuffleCards()
    
    lazy var resetButton: UIButton = {
        var buttonConfigs = UIButton.Configuration.borderless()
        buttonConfigs.imagePadding = 10
        let button = UIButton(configuration: buttonConfigs)
        
        button.setImage(UIImage(named: "restart_button"), for: .normal)
        button.addTarget(self, action: #selector(resetButtonTouched), for: .touchDown)
        let buttonTitle = "Reiniciar"
        
        button.setAttributedTitle(buttonTitle.resetButtonTitle, for: .normal)
        button.setTitleColor(.black, for: UIControl.State.normal)
        button.semanticContentAttribute = .forceRightToLeft
        
        
        return button
        
    }()
    
    lazy var card: UIView = {
        let cardView = CardView(position: 0, cardName: "elf")
        return cardView
    
    }()
    
    @objc func resetButtonTouched() {print("Touched!")}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        buildViews()
        buildConstraints()
        
    }
    
}

extension ViewController {
    
    func configViews() {
        view.backgroundColor = UIColor(named: "backgroundColor")
        
    }
    
    func buildViews() {
        view.addSubview(resetButton)
        view.addSubview(card)
        
    }
    
    func buildConstraints() {
        resetButton.snp.makeConstraints { make in
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(38)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
            make.height.equalTo(40)
            
        }
        
        card.snp.makeConstraints { make in
            make.center.equalToSuperview()
            
        }
    }
    
}

