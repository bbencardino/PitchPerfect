import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var highButton: UIButton!
    @IBOutlet weak var lowButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!

    var recordedAudioURL: URL!

    @IBAction func playSoundForButton(_ sender: UIButton) {
        print("play sound button pressed")
    }

    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        print("stop audio button pressed")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
