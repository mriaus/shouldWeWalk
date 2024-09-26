import UIKit

extension UILabel {
    func animateNumberChange(from startValue: Double, to endValue: Double, duration: TimeInterval) {
        let totalSteps = 50 // Aumenta este valor para tener una transición más suave
        let stepDuration = duration / Double(totalSteps)
        let increment = (endValue - startValue) / Double(totalSteps)
        var currentValue = startValue
        
        // Temporizador para realizar la animación paso a paso
        _ = Timer.scheduledTimer(withTimeInterval: stepDuration, repeats: true) { timer in
            // Incrementar o decrementar el valor según sea necesario
            if abs(currentValue - endValue) > abs(increment) {
                currentValue += increment
                
                // Aplicar la transición animada para cada cambio
                let transition = CATransition()
                transition.duration = stepDuration
                transition.type = .moveIn
                transition.subtype = .fromBottom // Cambiar a .fromBottom si prefieres el efecto contrario
                transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
                self.layer.add(transition, forKey: "changeNumberTransition")
                
                self.text = String(format: "%.2f", currentValue)
            } else {
                // Asegurarse de que llegue exactamente al valor final
                self.text = String(format: "%.2f", endValue)
                // Detener el temporizador cuando llegamos al valor final
                timer.invalidate()
            }
        }
    }
}
