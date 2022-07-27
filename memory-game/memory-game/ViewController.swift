import UIKit
import SnapKit

class ViewController: UIViewController {

    lazy var restartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "restart_button"), for: .normal)
        button.addTarget(self, action: #selector(restartButtonTouched), for: .touchDown)
        
        button.setTitle("Reiniciar  ", for: UIControl.State.normal) // switch to attributed title
        button.setTitleColor(.black, for: UIControl.State.normal)
        button.semanticContentAttribute = .forceRightToLeft
        
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        buildViews()
        buildConstraints()
        
    }

    @objc func restartButtonTouched() {
        print("click!")
    
    }
    
    func restart() {}
     

}

extension ViewController {
    
    func configViews() {
        view.backgroundColor = UIColor(named: "backgroundColor")
        
    }
    
    func buildViews() {
        view.addSubview(restartButton)
        
    }
    
    func buildConstraints() {
        restartButton.snp.makeConstraints { make in
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(38)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
           
        }
        
    }
    
}

