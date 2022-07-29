import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var memoryGame = MemoryGame.shuffleCards()
    
    lazy var resetButton: UIButton = {
        var buttonConfigs = UIButton.Configuration.borderless()
        buttonConfigs.imagePadding = 10
        
        let button = UIButton(configuration: buttonConfigs)
        let buttonTitle = "Reiniciar"
        
        button.setImage(UIImage(named: "restart_button"), for: .normal)
        button.addTarget(self, action: #selector(resetButtonTouched), for: .touchDown)
        
        button.setAttributedTitle(buttonTitle.resetButtonTitle, for: .normal)
        button.setTitleColor(.black, for: UIControl.State.normal)
        button.semanticContentAttribute = .forceRightToLeft
        
        return button
        
    }()
    
    lazy var cards: [CardView] = {
        var cards = [CardView]()
        
        for i in 0...9{
            let card = CardView(position: i, cardName: memoryGame.shuffledCards[i])
            cards.append(card)
        }
        
        return cards
        
    }()
    
    
    
    lazy var firstCardLineStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 25

        return stackView
        
    }()
    
    lazy var secondCardLineStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 25
        
        return stackView
        
    }()
    
    @objc func resetButtonTouched() {}
    
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
        view.addSubview(firstCardLineStackView)
        view.addSubview(secondCardLineStackView)
        
        addCardsInStackViews()
        
    }
    
    func addCardsInStackViews(){
        
        for i in 0...9{
            let card = cards[i]
            if(i<5){
                firstCardLineStackView.addArrangedSubview(card)
            }else{
                secondCardLineStackView.addArrangedSubview(card)
            }
        }
        
    }
    
    func buildConstraints() {
        resetButton.snp.makeConstraints { make in
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(38)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
            make.height.equalTo(40)
            
        }
        
        firstCardLineStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(resetButton.snp.bottom).offset(40)
            make.height.equalTo(110)
            
        }
        
        secondCardLineStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(firstCardLineStackView.snp.bottom).offset(25)
            make.height.equalTo(110)
            
        }
    }
    
}

