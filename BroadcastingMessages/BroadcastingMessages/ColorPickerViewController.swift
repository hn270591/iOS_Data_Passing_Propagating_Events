import UIKit

let ColorPickerNotification = Notification.Name("com.codepath.ColorPickerViewController.didPickColor")
let ColorPickerSelectedColorKey = "com.codepath.ColorPickerViewController.selectedColor"

class ColorPickerViewController: UIViewController {
    @IBOutlet weak var colorsSegmentedControl: UISegmentedControl!
    
    let colors = [("Cyan", UIColor.cyan),  ("Magenta", UIColor.magenta), ("Yellow", UIColor.yellow)]
    var initialColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorsSegmentedControl.removeAllSegments()
        
        var selectedIndex = 0
        
        for (index, color) in colors.enumerated() {
            if color.1.isEqual(initialColor) {
                selectedIndex = index
            }
            colorsSegmentedControl.insertSegment(withTitle: color.0, at: index, animated: false)
        }
        colorsSegmentedControl.selectedSegmentIndex = selectedIndex
    }
    
    func colorFromSelection() -> UIColor? {
        let selectedIndex = colorsSegmentedControl.selectedSegmentIndex
        return colors[selectedIndex].1
    }
    
    @IBAction func doneButtonTapped(sender: AnyObject) {
        var selectionInfo: [String: AnyObject] = [:]
        if let selectedColor = colorFromSelection() {
            selectionInfo[ColorPickerSelectedColorKey] = selectedColor
        }
        NotificationCenter.default.post(name: ColorPickerNotification, object: self, userInfo: selectionInfo)
    }
}
