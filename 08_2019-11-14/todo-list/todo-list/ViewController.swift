import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var todoListStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addEvent(_ sender: UIButton) {
        if
            let textData: String = todoTextField.text,
            textData != "" {
            
            todoTextField.text = ""
            todoTextField.resignFirstResponder()
            
            let item = createItemView(textData)
            todoListStackView.addArrangedSubview(item)
        }
    }
    
    @objc private func removeEvent(sender: UIButton) {
        guard let entryView = sender.superview else { return }
        entryView.removeFromSuperview()
    }
    
    private func createItemView(_ text: String) -> UIView {
        let item = UIStackView()
        item.axis = .horizontal
        item.alignment = .center
        item.distribution = .fill
        item.spacing = 8
        
        let title = UILabel()
        title.text = text
        title.textColor = .black
        
        let removeButton = UIButton()
        removeButton.setTitle("remove", for: .normal)
        removeButton.setTitleColor(.black, for: .normal)
        removeButton.addTarget(self, action: #selector(removeEvent), for: .touchUpInside)
        
        item.addArrangedSubview(title)
        item.addArrangedSubview(removeButton)
        
        return item
    }
    
}

