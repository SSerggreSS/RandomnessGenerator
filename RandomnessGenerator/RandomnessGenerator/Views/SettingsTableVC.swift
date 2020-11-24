//
//  SettingsTableVC.swift
//  RandomnessGenerator
//
//  Created by Сергей  Бей on 13.11.2020.
//

import UIKit

class SettingsTableVC: UITableViewController {

    let labels: [UILabel] = {
        var labels = [UILabel]()
        for i in 0...1 {
            var l = UILabel(frame: CGRect.zero)
            l.tag = i
            l.translatesAutoresizingMaskIntoConstraints = false
            l.font = UIFont(name: l.font.fontName, size: Constant.Label.Font.size)
            l.backgroundColor = .gray
            if i == 0 {
                l.text = "Minimum"
            } else {
                l.text = "Maximum"
            }
            labels.append(l)
        }
        return labels
    }()
    
    let textFields: [UITextField] = {
       var tFields = [UITextField]()
        for i in 0...1 {
            let tf = UITextField(frame: CGRect.zero)
            tf.tag = i
            tf.translatesAutoresizingMaskIntoConstraints = false
            tf.font = UIFont(name: tf.font!.fontName, size: Constant.TextField.Font.size)
            tf.borderStyle = .bezel
            tf.backgroundColor = .gray
            tf.keyboardType = .numberPad
            tf.adjustsFontSizeToFitWidth = true
            tf.returnKeyType = .done
            tf.addInputAccessoryViewWith(title: "Готово", target: self, selector: #selector(tapDone(sender:)))
            if i == 0 {
                tf.placeholder = Constant.TextField.Text.placeholderOfMinNumber
                tf.text = Constant.TextField.Text.textOfMinNumber
            } else {
                tf.placeholder = Constant.TextField.Text.placeholderOfMaxNumber
                tf.text = Constant.TextField.Text.textOfMaxNumber
            }
            tFields.append(tf)
        }
        return tFields
    }()
    
    @objc private func tapDone(sender: UITextField) {
        print("numberMin = \(numberMin), numberMax = \(numberMax)")
        if numberMin > numberMax {
            print("numberMin = \(numberMin), numberMax = \(numberMax)")
            let temporaryMax = numberMax
            numberMax = numberMin
            numberMin = temporaryMax
            textFields[0].text = String(numberMin)
            textFields[1].text = String(numberMax)
            print("numberMin = \(numberMin), numberMax = \(numberMax)")
        }
        
        self.view.endEditing(true)
        
    }
    
    private var numberMin = Constant.Number.min
    private var numberMax = Constant.Number.max
    
    //MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFields.first?.becomeFirstResponder()
        textFields[0].text = UserSettings.numberMinString
        textFields[1].text = UserSettings.numberMaxString
        numberMin = UserSettings.numberMin
        numberMax = UserSettings.numberMax
        print("numberMin = \(numberMin), numberMax = \(numberMax)")
    }
    //9223372036854775807
    override func viewWillDisappear(_ animated: Bool) {
        if self.isMovingFromParent {
            //print("navigationController?.viewControllers.count = \(navigationController?.viewControllers.count)")
           
                
            if numberMin > numberMax {
                let temporaryNumber = numberMin
                numberMin = numberMax
                numberMax = temporaryNumber
            }
            
            let vc = navigationController?.viewControllers.first as? ViewController
            vc?.randomGenerator.minimumNumber = numberMin
            vc?.randomGenerator.maximumNumber = numberMax
            
            UserSettings.numberMin = numberMin
            UserSettings.numberMax = numberMax
            
            
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        guard let typeSection = TypeSection(rawValue: section) else { return 1 }
         var numberOfRows = 0
         switch typeSection {
         case .first:
            numberOfRows = 4
         case .second:
            numberOfRows = 1
         }
        return numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "reuseIdentifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) ?? UITableViewCell()
        
        guard let typeSection = TypeSection(rawValue: indexPath.section) else { return UITableViewCell()}
        
        if typeSection == .first {
            let typeCell = TypeByCellContent.init(rawValue: indexPath.row) ?? TypeByCellContent.labelMin
            switch typeCell {
            case .labelMin:
                cell = configureFirst(cell: cell)
            case .textFieldMin:
                cell = configureSecond(cell: cell)
            case .labelMax:
                cell = configureThird(cell: cell)
            case .textFieldMax:
                cell = configureFourth(cell: cell)
            }
        } else if typeSection == .second {
            cell.textLabel?.text = "21/11/20"
        }
        
        return cell
    }
    
    //REMARK: Configure Cell And Auto Layout
    
    private func configureFirst(cell: UITableViewCell) -> UITableViewCell {
        cell.backgroundColor = .orange
        setupLayoutForFirst(cell: cell)
        return cell
    }
    
    private func setupLayoutForFirst(cell: UITableViewCell) {
        let labelMin = labels[0]
        cell.addSubview(labelMin)
        
        NSLayoutConstraint.activate(
            [labelMin.leadingAnchor.constraint(equalTo: cell.leadingAnchor),
             labelMin.trailingAnchor.constraint(equalTo: cell.trailingAnchor),
             labelMin.topAnchor.constraint(equalTo: cell.topAnchor),
             labelMin.bottomAnchor.constraint(equalTo: cell.bottomAnchor)
            ]
        )
    }
    
    private func configureSecond(cell: UITableViewCell) -> UITableViewCell {
        cell.backgroundColor = .orange
        setupLayoutForSecond(cell: cell)
        return cell
    }
    
    private func setupLayoutForSecond(cell: UITableViewCell) {
        let textFieldMin = textFields[0]
        textFieldMin.delegate = self
        cell.addSubview(textFieldMin)
        
        NSLayoutConstraint.activate(
            [textFieldMin.leadingAnchor.constraint(equalTo: cell.leadingAnchor),
             textFieldMin.trailingAnchor.constraint(equalTo: cell.trailingAnchor),
             textFieldMin.topAnchor.constraint(equalTo: cell.topAnchor),
             textFieldMin.bottomAnchor.constraint(equalTo: cell.bottomAnchor)
            ]
        )
    }
    
    private func configureThird(cell: UITableViewCell) -> UITableViewCell {
        cell.backgroundColor = .orange
        setupLayoutForThird(cell: cell)
        return cell
    }
    
    private func setupLayoutForThird(cell: UITableViewCell) {
        let labelMax = labels[1]
        cell.addSubview(labelMax)
        
        NSLayoutConstraint.activate(
            [labelMax.leadingAnchor.constraint(equalTo: cell.leadingAnchor),
             labelMax.trailingAnchor.constraint(equalTo: cell.trailingAnchor),
             labelMax.topAnchor.constraint(equalTo: cell.topAnchor),
             labelMax.bottomAnchor.constraint(equalTo: cell.bottomAnchor)
            ]
        )
    }
    
    private func configureFourth(cell: UITableViewCell) -> UITableViewCell {
        cell.backgroundColor = .orange
        setupLayoutForFourth(cell: cell)
        return cell
    }
    
    private func setupLayoutForFourth(cell: UITableViewCell) {
        let textFieldMax = textFields[1]
        textFieldMax.delegate = self
        cell.addSubview(textFieldMax)
        
        NSLayoutConstraint.activate(
            [textFieldMax.leadingAnchor.constraint(equalTo: cell.leadingAnchor),
             textFieldMax.trailingAnchor.constraint(equalTo: cell.trailingAnchor),
             textFieldMax.topAnchor.constraint(equalTo: cell.topAnchor),
             textFieldMax.bottomAnchor.constraint(equalTo: cell.bottomAnchor)
            ]
        )
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constant.Cell.height
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
       guard let typeSection = TypeSection(rawValue: section) else { return "nil"}
        var titleOfHeader = ""
        switch typeSection {
        case .first:
            titleOfHeader = Constant.Section.Title.forFirst
        case .second:
            titleOfHeader = Constant.Section.Title.forSecond
        }
        
        return titleOfHeader
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedCell = tableView.cellForRow(at: indexPath)

        let tf = selectedCell?.getTextField() ?? UITextField()
        tf.becomeFirstResponder()
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */
}

//MARK: Text Field Delegate

extension SettingsTableVC: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
       
        if numberMin > numberMax {
            let temporaryNumber = numberMin
            numberMin = numberMax
            numberMax = temporaryNumber
            textFields[0].text = "\(numberMin)"
            textFields[1].text = "\(numberMax)"
            
            print("min = \(numberMin), max = \(numberMax)")
        }
        
        switch textField.type {
        case .minimum where (textFields[1].text?.isEmpty ?? true):
            numberMax = UserSettings.numberMax
            textFields[1].text = UserSettings.numberMaxString
        case .maximum where (textFields[0].text?.isEmpty ?? true):
            numberMin = UserSettings.numberMin
            textFields[0].text = UserSettings.numberMinString
        default:
            break
        }
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let textFromTF = (textField.text ?? "") as NSString
        let newString = textFromTF.replacingCharacters(in: range, with: string)
        
        let digitalSet = CharacterSet.decimalDigits
        
        guard digitalSet.contains(Unicode.Scalar(string) ?? " ") || string == "" else { return false }
        
        print("0case - newString = \(newString), string = \(string), range = \(range), textField.text = \(textField.text)")
        
        let number = Int(newString)
        
        
        
        print("number = \(number) int.max = \(Int.max)")
        
        //if let number = number, number <= Int.max {
            print("1case - newString = \(newString), string = \(string), range = \(range)")
            let typeTextField = TypeTextField.init(rawValue: textField.tag) ?? .minimum
            switch typeTextField {
            case .minimum where number != nil && number! <= Int.max :
                //print("min")
                //stringFromMinTextField += string
                numberMin = number!
                textField.text = newString
                UserSettings.numberMin = numberMin
                //print("numberMin = \(numberMin)")
            case .maximum where number != nil && number! <= Int.max:
                //print("max")
                //stringFromMaxTextField += string
                numberMax = number!
                textField.text = newString
                UserSettings.numberMax = numberMax
                //print("numberMax = \(numberMax)")
            case .minimum where newString == Constant.Strings.emptyString:
                textField.text = newString
                numberMin = 0
            case .maximum where newString == Constant.Strings.emptyString:
                textField.text = newString
                numberMax = 0
            default :
                break
            } //else if newString == "" {
                
            //}
        let textFieldOfMinimumIsEmpty = textFields[0].text?.isEmpty ?? false
        
        if textFieldOfMinimumIsEmpty {
            numberMin = 0
        }
        
        let textFieldOfMaximumIsEmpty = textFields[1].text?.isEmpty ?? false
        
        if textFieldOfMaximumIsEmpty {
            numberMax = 0
        }
        
        return false
        }
//        else {
//            print("3case - newString = \(newString), string = \(string), range = \(range)")
//            textField.text = newString
//        }
        
    }
    

