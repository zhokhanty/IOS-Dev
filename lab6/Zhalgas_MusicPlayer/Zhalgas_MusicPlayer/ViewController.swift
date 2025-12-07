//
//  ViewController.swift
//  lab6
//
//  Created by Zhalgas Bagytzhan on 07.11.2025.
//

import UIKit
import AVFoundation

//struct Playlist {
//    let titleAlbum: String
//    let artist: String
//    let imageName: String
//}

enum RepeatMode {
    case off
    case repeatAll
    case repeatOne
}

struct Track {
    let title: String
    let artist: String
    let imageName: String
    let fileName: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var progressSlider: UISlider!
    
    @IBOutlet weak var currentTime: UILabel!
    @IBOutlet weak var duration: UILabel!
    
    @IBOutlet weak var shuffleButton: UIButton!
    @IBOutlet weak var repeatButton: UIButton!
    
    var timer: Timer?
    var audioPlayer: AVAudioPlayer?
    var currentTrackIndex = 0
    
    var isShuffleEnabled = false
    var repeatMode: RepeatMode = .off
    
    let tracks: [Track] = [
        Track(title: "Лишь до утра",
              artist: "Dan Balan",
              imageName: "Dan Balan",
              fileName: "song1"),
        Track(title: "Demons",
              artist: "Imagine Dragons",
              imageName: "Imagine Dragons",
              fileName: "song2"),
        Track(title: "Whatever It Takes",
              artist: "Imagine Dragons",
              imageName: "Imagine Dragons",
              fileName: "song3"),
        Track(title: "Natural",
              artist: "Imagine Dragons",
              imageName: "Imagine Dragons",
              fileName: "song4")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        progressSlider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        loadTrack(index: currentTrackIndex)
    }
        
    func loadTrack(index: Int) {
        let track = tracks[index]
        
        titleName.text = track.title
        artistName.text = track.artist
        imageView.image = UIImage(named: track.imageName)
        
        if let url = Bundle.main.url(forResource: track.fileName, withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.prepareToPlay()
                audioPlayer?.delegate = self
            } catch {
                print("Error: \(error)")
            }
        } else {
            print("Not Found")
        }
        
        setupUIForNewTrack()
        startTimer()
    }
    
    func setupUIForNewTrack() {
        playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        nextButton.setImage(UIImage(systemName: "forward.fill"), for: .normal)
        previousButton.setImage(UIImage(systemName: "backward.fill"), for: .normal)
        repeatButton.setImage(UIImage(systemName: "repeat"), for: .normal)
        let icon = isShuffleEnabled ? "shuffle.circle.fill" : "shuffle"
        shuffleButton.setImage(UIImage(systemName: icon), for: .normal)
        
        progressSlider.value = 0
        progressSlider.minimumValue = 0
        progressSlider.maximumValue = Float(audioPlayer?.duration ?? 0)
        
        currentTime.text = "0:00"
        duration.text = formatTime(audioPlayer?.duration ?? 0)
    }
    
    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
    }
    
    @objc func updateProgress() {
        guard let player = audioPlayer else { return }
        
        progressSlider.value = Float(player.currentTime)
        currentTime.text = formatTime(player.currentTime)
    }
    
    @objc func sliderChanged() {
        guard let player = audioPlayer else { return }
        player.currentTime = TimeInterval(progressSlider.value)
        currentTime.text = formatTime(player.currentTime)
    }
    
    func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
    
    @IBAction func playPauseTapped(_ sender: UIButton) {
        guard let player = audioPlayer else { return }
        
        if player.isPlaying {
            player.pause()
            playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        } else {
            player.play()
            playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
    }
    
    @IBAction func nextTapped(_ sender: UIButton) {
        switch repeatMode {
            case .repeatOne:
                break
            default:
                if isShuffleEnabled {
                    currentTrackIndex = Int.random(in: 0..<tracks.count)
                } else {
                    currentTrackIndex = (currentTrackIndex + 1) % tracks.count
                }
        }
        
        loadTrack(index: currentTrackIndex)
        audioPlayer?.play()
        playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        nextButton.setImage(UIImage(systemName: "forward.fill"), for: .normal)
    }
    
    @IBAction func previousTapped(_ sender: UIButton) {
        switch repeatMode {
            case .repeatOne:
                break
            default:
                if isShuffleEnabled {
                    currentTrackIndex = Int.random(in: 0..<tracks.count)
                } else {
                    currentTrackIndex = (currentTrackIndex - 1 + tracks.count) % tracks.count
                }
        }
            
        loadTrack(index: currentTrackIndex)
        audioPlayer?.play()
        playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        previousButton.setImage(UIImage(systemName: "backward.fill"), for: .normal)
    }
    
    @IBAction func shuffleTapped(_ sender: UIButton) {
        isShuffleEnabled.toggle()
        
        let icon = isShuffleEnabled ? "shuffle.circle.fill" : "shuffle"
        shuffleButton.setImage(UIImage(systemName: icon), for: .normal)
    }
    
    @IBAction func repeatTapped(_ sender: UIButton) {
        switch repeatMode {
        case .off:
            repeatMode = .repeatAll
            repeatButton.setImage(UIImage(systemName: "repeat"), for: .normal)
        case .repeatAll:
            repeatMode = .repeatOne
            repeatButton.setImage(UIImage(systemName: "repeat.1"), for: .normal)
        case .repeatOne:
            repeatMode = .off
            let config = UIImage.SymbolConfiguration(weight: .light)
            let image = UIImage(systemName: "repeat", withConfiguration: config)
            repeatButton.setImage(image, for: .normal)
        }
    }

}

extension ViewController: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        nextTapped(UIButton())
    }
}
