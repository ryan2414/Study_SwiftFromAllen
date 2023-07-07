//: [Previous](@previous)

import UIKit



struct K {
    static let appName = "MySuperApp"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}

let app = K.appName
let color = K.BrandColors.blue





class Message {
    private enum Status {
        case sent
        case received
        case read
    }
    
    let sender: String, recipient: String, content: String
    
    let timeStamp: Date
    
    private var status: Message.Status = Message.Status.sent
    
    init(sender: String, recipient: String, content: String) {
        self.sender = sender
        self.recipient = recipient
        self.content = content
        
        self.timeStamp = Date()
    }
    
    func getBasicInfo() -> String {
        return "보낸사람: \(sender), 받는사람: \(recipient), 메시지 내용: \(content), 보낸 시간: \(timeStamp.description)"
    }
    
    func statusColor() -> UIColor {
        switch status {
        case .sent:
            return UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        case .received:
            return UIColor(red: 0, green: 0, blue: 1, alpha: 1)
        case .read:
            return UIColor(red: 0, green: 1, blue: 1, alpha: 1)
        }
        
    }
}



let message1 = Message(sender: "홍길동", recipient: "임꺽정", content: "뭐해?")
print(message1.getBasicInfo())

sleep(1)

let message2 = Message(sender: "임꺽정", recipient: "홍길동", content: "그냥있어")
print(message2.getBasicInfo())


//: [Next](@next)
