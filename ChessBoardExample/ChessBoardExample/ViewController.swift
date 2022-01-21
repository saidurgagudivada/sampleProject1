//
//  ViewController.swift
//  ChessBoardExample
//
//  Created by Jagadeesh on 18/12/21.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var showButton: UIButton!
    
        var enterNumber = Int()
    var totalNumberOfRows = Int()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        numberTextField.delegate = self
    }
    
    @IBAction func showButtonTapped(_ sender: Any) {
        if let text = numberTextField.text {
            let convertedString = Int(text)
            if let convertedString = convertedString {
                enterNumber = convertedString
                collectionView.reloadData()
            }else{
                // create the alert
                let alert = UIAlertController(title: "Alert", message: "Please enter valid number.", preferredStyle: UIAlertController.Style.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
        }
     
    }
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        //let size = width / 2
    
        let size =  Int(width - 100) / enterNumber
        return CGSize(width: size , height: size )
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    /*func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 27, bottom: 0, right: 70)
    } */
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50)
        }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        return false
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("you are selected \(indexPath.section)-\(indexPath.row) row")
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  enterNumber
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return  enterNumber
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! NewCell
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.black.cgColor
        
        if  enterNumber % 2 == 0  || enterNumber % 2 != 0  {
            
             if indexPath.section % 2 == 0  {
                
                 if indexPath.row % 2 == 0  {
                           cell.backgroundColor = .white
                       }else{
                          cell.backgroundColor = .black
                       }
           } else {
                   if indexPath.row % 2 == 0  {
                      cell.backgroundColor = .black
                    }else{
                       cell.backgroundColor = .white
                    }
                 }
        } else {
                 if indexPath.row % 2 == 0   {
                      cell.backgroundColor = .white
                   }else{
                     cell.backgroundColor = .black
                }
           }
        
        return cell
    }
    
    
}



