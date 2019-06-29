//
//  MainVC.swift
//  Fibonacci
//
//  Created by YUNI on 2019/6/29.
//  Copyright © 2019 YUNI. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var fromTxtField: UITextField!
    @IBOutlet weak var toTxtField: UITextField!
    @IBOutlet weak var searchBtn: NSLayoutConstraint!
    @IBOutlet weak var mainTableView: UITableView!
    
    fileprivate var fiNumList: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let maxValue = Int.max
        print(maxValue)
        self.title = "Fibonacci Numbers"
        
        fromTxtField.delegate = self
        toTxtField.delegate = self
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(UINib(nibName: "FibonacciCell", bundle: nil), forCellReuseIdentifier: "FibonacciCell")
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks,
                                                                 target: self,
                                                                 action: #selector(infoBtnPressed))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateData()
    }
    
    fileprivate func updateData() {
        fiNumList = [Int]()
        if fromTxtField.text == "" || toTxtField.text == "" {
            do {
                 fiNumList = try FibonacciManager.shared.getListToNumber(to: 50)
            } catch FibonacciError.Invaild {
                let msg = "Number is invaild."
                showErrorMsg(msg: msg)
            } catch FibonacciError.OverMax {
                let msg = "Over limitaion of Int."
                showErrorMsg(msg: msg)
            } catch {
                
            }
           
        } else {
            do {
                fiNumList = try FibonacciManager.shared.getRangeList(from: Int(fromTxtField.text ?? "0")! ,
                                                                 to: Int(toTxtField.text ?? "0")!)
            } catch FibonacciError.Invaild {
                let msg = "Number is invaild."
                showErrorMsg(msg: msg)
            } catch FibonacciError.OverMax {
                let msg = "Over limitaion of Int."
                showErrorMsg(msg: msg)
            } catch {
                
            }
        }
        
        mainTableView.reloadData()
    }
    
    fileprivate func showErrorMsg(msg: String) {
        fromTxtField.text = ""
        toTxtField.text = ""
        let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func searchBtnPressed(_ sender: Any) {
        self.view.endEditing(true)
        updateData()
    }
    
    @objc func infoBtnPressed() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "InfoVC") as! InfoVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension MainVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fiNumList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FibonacciCell") as! FibonacciCell
        let no = Int(fromTxtField.text ?? "0") ?? 0
        cell.initCell(no: String(no + indexPath.row),
                      ans: String(fiNumList[indexPath.row]))
        return cell
    }
}
