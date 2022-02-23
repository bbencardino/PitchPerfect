import UIKit

class RecordSoundsViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        stopRecordingButton.isEnabled = false
    }

    @IBAction func recordAudio(_ sender: UIButton) {
        print("record button was pressed")
        recordingLabel.text = "Recording..."
        stopRecordingButton.isEnabled = true

    }

    @IBAction func stopRecording(_ sender: UIButton) {
        recordingLabel.text = "Tap to record"

    }

}

