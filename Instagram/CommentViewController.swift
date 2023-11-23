//
//  CommentViewController.swift
//  Instagram
//
//  Created by 大森宗一郎 on 2023/11/20.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage
import SVProgressHUD

class CommentViewController: UIViewController {
    
    @IBOutlet weak var commentTextField: UITextField!
    
    var postData:PostData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // 確定ボタンをタップしたときに呼ばれるメソッド
    @IBAction func sendComment(_ sender: Any) {
        // 更新データを作成する
        var updateValue: FieldValue
        
        let name = Auth.auth().currentUser?.displayName
        let comment = "\(name!) : \(commentTextField.text!)"
        
        // 今回新たにいいねを押した場合は、myidを追加する更新データを作成
        updateValue = FieldValue.arrayUnion([comment])
        
        // likesに更新データを書き込む
        let postRef = Firestore.firestore().collection(Const.PostPath).document(postData.id)
        postRef.updateData(["comments": updateValue])
        
        self.dismiss(animated: true, completion: nil)
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
