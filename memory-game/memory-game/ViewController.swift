import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let cardsRange = 0...9
    private let cardsPerLine = 5
    private let cardsSpacing = 25
    private let cardsHeight = 110
    private let cardsMargin = 40
    private let imagePadding = 10
    private let trailingInset = 38
    private let topOffset = 32

    private var memoryGame = MemoryGame.shuffleCards()
    
    lazy var resetButton: UIButton = {
        var buttonConfigs = UIButton.Configuration.borderless()
        buttonConfigs.imagePadding = CGFloat(imagePadding)
        
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
        var cardList = [CardView]()
        
        for i in cardsRange{
            let card = CardView(cardName: memoryGame.shuffledCards[i])
            cardList.append(card)
            
        }
        
        return cardList
        
    }()
    
    func resetCards(){
        
        for i in cardsRange{
            cards[i].cardName = memoryGame.shuffledCards[i]
            cards[i].cardState = .FACE_DOWN
            cards[i].cardImage.image = UIImage(named: "logo")
            
        }

    }
    
    
    lazy var firstCardLineStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = CGFloat(cardsSpacing)
        
        return stackView
        
    }()
    
    lazy var secondCardLineStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = CGFloat(cardsSpacing)
        
        return stackView
        
    }()
    
    @objc func resetButtonTouched() {
        memoryGame = MemoryGame.shuffleCards()
        resetCards()
        
    }
    
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
        
        for i in cardsRange{
            let card = cards[i]
            if(i < cardsPerLine){
                firstCardLineStackView.addArrangedSubview(card)
                
            }else{
                secondCardLineStackView.addArrangedSubview(card)
                
            }
        }
        
    }
    
    func buildConstraints() {
        resetButton.snp.makeConstraints { make in
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(trailingInset)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(topOffset)
            make.height.equalTo(cardsMargin)
            
        }
        
        firstCardLineStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(resetButton.snp.bottom).offset(cardsMargin)
            make.height.equalTo(cardsHeight)
            
        }
        
        secondCardLineStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(firstCardLineStackView.snp.bottom).offset(cardsSpacing)
            make.height.equalTo(cardsHeight)
            
        }
    }
    
}

