import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func openColorPickerTapped(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let colorPickerVC = storyboard.instantiateViewController(withIdentifier: "ColorPicker") as! ColorPickerViewController
        colorPickerVC.initialColor = view.backgroundColor
        
        NotificationCenter.default.addObserver(forName: ColorPickerNotification, object: nil, queue: .main) { notification in
            let userInfo = notification.userInfo
            let selectedColor: UIColor? = userInfo?[ColorPickerSelectedColorKey] as? UIColor
            self.didPickColor(selectedColor)
        }
        
        present(colorPickerVC, animated: true, completion: nil)
    }
    
    func didPickColor(_ color: UIColor?) {
        if let selectedColor = color {
            view.backgroundColor = selectedColor
        }
        dismiss(animated: true, completion: nil)
    }
    
}

