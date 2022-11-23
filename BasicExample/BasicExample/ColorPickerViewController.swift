import UIKit

protocol ColorPickerDelegate: AnyObject {
    func colorPicker(picker: ColorPickerViewController, didPickColor color: UIColor?)
}

class ColorPickerViewController: UIViewController {
    weak var delegate: ColorPickerDelegate?

    @IBOutlet weak var colorsSegmentedControl: UISegmentedControl!
    
    let colors = [("Cyan", UIColor.cyan),  ("Magenta", UIColor.magenta), ("Yellow", UIColor.yellow)]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorsSegmentedControl.removeAllSegments()
        for (index, color) in colors.enumerated() {
            colorsSegmentedControl.insertSegment(withTitle: color.0, at: index, animated: true)
        }
        colorsSegmentedControl.selectedSegmentIndex = 0 
    }
    
    func colorFromSelection() -> UIColor? {
        let selectedIndex = colorsSegmentedControl.selectedSegmentIndex
        return colors[selectedIndex].1
    }

    @IBAction func doneButtonTapped(sender: AnyObject) {
        delegate?.colorPicker(picker: self, didPickColor: colorFromSelection())
    }
}
