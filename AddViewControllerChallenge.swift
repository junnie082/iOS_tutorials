//
//  AddViewController.swift
//  TableChallenge
//
//  Created by Hyojeong_Jun on 2022/06/08.
//

import UIKit

class AddViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {

    var image: String = ""
    
    @IBOutlet var tfAddItem: UITextField!
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: itemsImageFile[0])
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        //print(itemsImageFile[1])
        //items.append(tfAddItem.text!)
        //imageView.image = UIImage(named: String(itemsImageFile[0]))
        //itemsImageFile.append(itemsImageFile[1])
        items.append(tfAddItem.text!)
        tfAddItem.text = ""
        itemsImageFile.append(image)
        _ = navigationController?.popViewController(animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent: Int) -> Int {
        return 3
    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        image = itemsImageFile[row]
//        return itemsImageFile[row]
//    }
    
    // 이 부분을 추가하면 목록표 왼쪽에 그림이 사라짐. 이 부분을 추가하지 않으면 피커뷰에 사진이 아닌 이미지의 이름이 나타남.  -> 해결
    // image = itemsImageFile[row] 를 추가하면 되는 일임.
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        image = itemsImageFile[row]
        let imageView = UIImageView(image: imageArray[row])
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imageView.image = UIImage(named: itemsImageFile[row])
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
