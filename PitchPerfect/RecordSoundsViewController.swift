import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

    var audioRecorder: AVAudioRecorder!
    
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func configureUI(button: UIButton, enable: Bool) {

        if enable == false {
            button.isEnabled = enable
            recordingLabel.text = "Tap to record"
        } else {
            button.isEnabled = enable
            recordingLabel.text = "Recording..."
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        configureUI(button: stopRecordingButton, enable: false)
    }

    @IBAction func recordAudio(_ sender: UIButton) {
        configureUI(button: stopRecordingButton, enable: true)

        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
            let recordingName = "recordedVoice.wav"
            let pathArray = [dirPath, recordingName]
            let filePath = URL(string: pathArray.joined(separator: "/"))

            let session = AVAudioSession.sharedInstance()
            try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)

            try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
            audioRecorder.delegate = self
            audioRecorder.isMeteringEnabled = true
            audioRecorder.prepareToRecord()
            audioRecorder.record()
    }

    @IBAction func stopRecording(_ sender: UIButton) {
        configureUI(button: stopRecordingButton, enable: false)
        audioRecorder.stop()
            let audioSession = AVAudioSession.sharedInstance()
            try! audioSession.setActive(false)
    }

    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else {
            print("recording was not successful")
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "stopRecording" {
            let destination = segue.destination as! PlaySoundsViewController
            destination.recordedAudioURL = audioRecorder.url
        }
    }
}

