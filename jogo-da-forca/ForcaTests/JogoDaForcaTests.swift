import Foundation
import XCTest
@testable import Forca

class JogoDaForcaTests: XCTestCase {
    
    // SYSTEM UNDER TEST
    var sut: JogoDaForca?
    
    override func setUp() {
        sut = .init(palavra: "abelha", dica: "inseto")
    }
    
    func test_tentar_withTwoLettersRight_whenTryingAnotherRightLetter_shouldNotHaveAnyErrors() throws {
        
        // GIVEN - Arrange
        
        let sut = try XCTUnwrap(sut)
        sut.tentar(letra: "a")
        sut.tentar(letra: "b")
        
        // WHEN - Action
        
        sut.tentar(letra: "e")
        
        // THEN - Assert
        
        XCTAssertEqual(sut.erros, 0)
    }
    
    func test_tentar_withTwoLettersRight_whenTryingAWrongLetter_shouldHaveOneError() throws {
        
        // GIVEN - Arrange
        
        let sut = try XCTUnwrap(sut)
        sut.tentar(letra: "a")
        sut.tentar(letra: "b")
        
        // WHEN - Action
        
        sut.tentar(letra: "m")
        
        // THEN - Assert
        
        XCTAssertEqual(sut.erros, 1)
    }
    
    
    
    
}
