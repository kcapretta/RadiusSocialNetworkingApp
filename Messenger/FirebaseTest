//
//  File.swift
//  Radius
//
//  Created by Kassandra Capretta on 12/16/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import Foundation
import Firebase

//func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//
//    FirebaseApp.configure()
//    return true
//}
//
//    var name = ""
//    @ObservableObject var msg = observer()
//
//    var body : some View{
//
//        List(msg.msgs){i in
//
//            Test(i.msg)
//
//        }.navigationBarTitle("Chats",displayMode: .large)
//
//struct observer : ObersvableObject{
//
//    @Published var msgs = [datatype]()
//
//    init() {
//
//        let db = Firestore.firestore()
//
//        db.collection("msgs").addSnapshotListener { (snap, err) in
//
//            if err != nil{
//                print((err?.localizedDescription)!)
//                return
//            }
//
//            for i in snap!.documentChanges{
//
//                if i.type == .added{
//                    let name = i.document.get("firstName") as! String
//                    let msg = i.document.get("msg") as! String
//                    let id = i.document.documentID
//
//                    self.msgs.append(datastype(id: id, firstName: firstName, msg: msg))
//                }
//            }
//        }
//
//        func addMsg(msg : String,user : String){
//
//            let db = Firestore.firestore()
//
//            db.collection("msgs").addDocumentation(data: ["msg":msg,"user":user]) { (err) in
//
//                if err != nil{
//
//                    print((err?.localiedDescription)!)
//                    return
//                }
//                print("success")
//            }
//        }
//    }
//}
//struct datatype : Identifiable{
//
//    var id : String
//    var name : String
//    var msg : String
//}
//}
