import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var reiniciarButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icone_reiniciar"), for: .normal)
        button.addTarget(self, action: #selector(resetButtonTouched), for: .touchDown)
        return button
    }()
    
    lazy var forcaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "forca")
        return imageView
    }()
    
    lazy var bonecoImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var textosStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 16
        return stackView
    }()
    
    lazy var dicaLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var palpiteLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var letraTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textAlignment = .center
        textField.keyboardType = .namePhonePad
        textField.delegate = self
        return textField
    }()
    
    lazy var chutesAnterioresLabelTitulo: UILabel = {
        let label = UILabel()
        label.text = "Chutes Anteriores"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var chutesAnterioresLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    internal var jogoDaForca = JogoDaForca.aleatorio()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        buildViews()
        buildConstraints()
        
        update()
    }
    
    @objc func resetButtonTouched() {
        reset()
    }
    
    func update() {
        palpiteLabel.attributedText = jogoDaForca.palavraMascarada.espacado
        dicaLabel.text = "A dica é: \(jogoDaForca.dica)"
        chutesAnterioresLabel.attributedText = formatarChutes()
        
        let image: UIImage?
        // trocar por switch case
        if jogoDaForca.estadoDoJogo == EstadoDoJogo.perdeu {
            image = UIImage(named: "bonecao_completo_e_mortinho")
        } else {
            image = UIImage(named: "bonecao_fase_\(jogoDaForca.erros)")
        }
        
        UIView.transition(
            with: bonecoImageView,
            duration: 0.5,
            options: .transitionCrossDissolve,
            animations: {
                self.bonecoImageView.image = image
            },
            completion: nil
        )
    }
    
    func formatarChutes() -> NSMutableAttributedString {
        jogoDaForca.tentativasAnteriores.reduce(NSMutableAttributedString()) { (partialResult, letra) in
            let letraComCor: NSAttributedString = jogoDaForca.palavra.comparavel.contains(letra.comparavel) ? letra.comCorDeAcerto : letra.comCorDeErro
            partialResult.append(letraComCor)
            return partialResult
        }.espacado
    }
    
    func reset() {
        jogoDaForca = JogoDaForca.aleatorio()
        update()
    }
    
    func alert(titulo: String, descricao: String? = nil) {
        let alert = UIAlertController(title: titulo, message: descricao, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Jogar Novamente", style: .default) { action in
            self.reset()
        }
        
        alert.addAction(action)
        
        present(alert, animated: true)
    }

}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        letraTextField.text = string.uppercased()
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let texto = textField.text {
            jogoDaForca.tentar(letra: texto)
        }
        
        // trocar por switch case
        if jogoDaForca.estadoDoJogo == EstadoDoJogo.ganhou {
            alert(titulo: "Você acertou, parabéns!")
        } else if jogoDaForca.estadoDoJogo == EstadoDoJogo.perdeu {
            alert(titulo: "Que pena, você errou", descricao: "Pensa um pouco mais da próxima vez")
        }
        
        update()
        return true
    }
    
}

// MARK: - setup das views
extension ViewController {
    
    func configViews() {
        view.backgroundColor = UIColor(named: "fundo")
    }
    
    func buildViews() {
        view.addSubview(reiniciarButton)
        view.addSubview(forcaImageView)
        view.addSubview(bonecoImageView)
        view.addSubview(textosStackView)
        
        textosStackView.addArrangedSubview(dicaLabel)
        textosStackView.addArrangedSubview(palpiteLabel)
        textosStackView.addArrangedSubview(letraTextField)
        textosStackView.addArrangedSubview(chutesAnterioresLabelTitulo)
        textosStackView.addArrangedSubview(chutesAnterioresLabel)
    }
    
    func buildConstraints() {
        reiniciarButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(22)
        }
        
        forcaImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(25)
        }
        
        bonecoImageView.snp.makeConstraints { make in
            make.trailing.equalTo(forcaImageView).inset(8)
            make.top.equalTo(forcaImageView.snp.centerY).offset(-18)
        }
        
        textosStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(forcaImageView.snp.bottom).offset(24)
        }
        
        letraTextField.snp.makeConstraints { make in
//            make.width.height.equalTo(40)
            
            make.size.equalTo(40)
        }
    }
    
}
