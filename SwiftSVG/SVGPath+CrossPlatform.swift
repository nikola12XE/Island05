#if os(OSX)
import AppKit

public extension NSBezierPath {
    var cgPath: CGPath {
        get {
            let path = CGMutablePath()
            let points = NSPointArray.allocate(capacity: 3)
            for i in 0 ..< self.elementCount {
                let type = self.element(at: i, associatedPoints: points)
                switch type {
                case .moveTo:
                    path.move(to: points[0])
                case .lineTo:
                    path.addLine(to: points[0])
                case .curveTo:
                    path.addCurve(to: points[2], control1: points[0], control2: points[1])
                case .cubicCurveTo:
                    path.addCurve(to: points[2], control1: points[0], control2: points[1])
                case .quadraticCurveTo:
                    path.addQuadCurve(to: points[1], control: points[0])
                case .closePath:
                    path.closeSubpath()
                @unknown default:
                    break
                }
            }
            return path
        }
    }
}
#endif 