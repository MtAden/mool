import UIKit

public class GradientView: UIView {
    
    lazy fileprivate var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.startPoint = CGPoint(x: 0.5, y: 1.0)
        layer.endPoint = CGPoint(x: 0.5, y: 0.0)
        layer.colors = [UIColor.black.cgColor, UIColor(white: 0.0, alpha: 0.0).cgColor]
        return layer
    }()
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.clear
        layer.addSublayer(gradientLayer)
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
}

@IBDesignable class GradientViewDesignable: UIView {
    
    private var gradientLayer: CAGradientLayer?
    
    @IBInspectable var topColor: UIColor = .red {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var bottomColor: UIColor = .yellow {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .clear {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowX: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowY: CGFloat = -3 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var shadowBlur: CGFloat = 3 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var startPointX: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var startPointY: CGFloat = 0.5 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var endPointX: CGFloat = 1 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var endPointY: CGFloat = 0.5 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        guard
            let gLayer = self.layer as? CAGradientLayer
        else { fatalError("Cant cast self.layer as CAGradientLayer") }
        self.gradientLayer = gLayer
        self.gradientLayer?.colors = [topColor.cgColor, bottomColor.cgColor]
        self.gradientLayer?.startPoint = CGPoint(x: startPointX, y: startPointY)
        self.gradientLayer?.endPoint = CGPoint(x: endPointX, y: endPointY)
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: shadowX, height: shadowY)
        self.layer.shadowRadius = shadowBlur
        self.layer.shadowOpacity = 1
        
    }
    
    func animate(duration: TimeInterval, newTopColor: UIColor, newBottomColor: UIColor) {
        let fromColors = self.gradientLayer?.colors
        let toColors: [AnyObject] = [ newTopColor.cgColor, newBottomColor.cgColor]
        self.gradientLayer?.colors = toColors
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = fromColors
        animation.toValue = toColors
        animation.duration = duration
        animation.isRemovedOnCompletion = true
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        self.gradientLayer?.add(animation, forKey:"animateGradient")
    }
}
