//: [Previous](@previous)

import UIKit

struct Point {
    var x = 0.0, y = 0.0
    
    
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()

let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))


var color = UIColor(red: 0.3, green: 0.5, blue: 0.4, alpha: 1)

extension UIColor {
    convenience init(color: CGFloat) {
        self.init(red: color/255, green: color/255, blue: color/255, alpha: 1)
    }
}

UIColor(color: 1)


//: [Next](@next)
