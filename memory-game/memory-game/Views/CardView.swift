import Foundation
import UIKit
import SnapKit

class CardView: UIView {
    
    var cardName: String
    var cardState: CardState
    
    lazy var cardImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        return imageView
        
    }()
    
    init(cardName: String){
        self.cardName = cardName
        self.cardState = .FACE_DOWN
        
        super.init(frame: .zero)
        
        configViews()
        buildViews()
        buildConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
}

extension CardView{
    
    func configViews(){
        backgroundColor = UIColor(named: "cardBackgroundColor")
        layer.cornerRadius = 8
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.25
        layer.shadowOffset = .zero
        layer.shadowColor = UIColor.gray.cgColor
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touched)))
        
    }
    
    @objc func touched(){
        if(cardState == .FACE_DOWN){
            cardState = .FACE_UP
            cardImage.image = UIImage(named: cardName)
            
        }
        
    }
    
    func buildViews(){
        addSubview(cardImage)
        
    }
    
    func buildConstraints(){
        cardImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(83)
            
        }
        
        snp.makeConstraints { make in
            make.size.equalTo(110)
            
        }
        
    }
    
}

enum CardState{
    case FACE_DOWN
    case FACE_UP
    case DISCOVERY
    
}
