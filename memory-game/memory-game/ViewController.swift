import UIKit
import SnapKit

class ViewController: UIViewController {

    lazy var resetButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "restart_button"), for: .normal)
        button.addTarget(self, action: #selector(resetButtonTouched), for: .touchDown)
        
        let buttonTitle = "Reiniciar  "
        
        button.setAttributedTitle(buttonTitle.resetButtonTitle, for: .normal)
        button.setTitleColor(.black, for: UIControl.State.normal)
        button.semanticContentAttribute = .forceRightToLeft
        
        return button
        
    }()
    
    private var memoryGame = MemoryGame.shuffleCards()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        buildViews()
        buildConstraints()
        
    }

    @objc func resetButtonTouched() {
        
        
    }
    
    func restart() {}
     

}

extension ViewController {
    
    func configViews() {
        view.backgroundColor = UIColor(named: "backgroundColor")
        
    }
    
    func buildViews() {
        view.addSubview(resetButton)
                
    }
    
    func buildConstraints() {
        resetButton.snp.makeConstraints { make in
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(38)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
           
        }
        
    }
    
}

