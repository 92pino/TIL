//
//  ViewController.swift
//  Chapter01
//
//  Created by JinBae Jeong on 2020/04/02.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit
import SnapKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

  // MARK: - Properties
  var player: AVAudioPlayer!
  var timer: Timer!
  
  private let playPauseButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(#imageLiteral(resourceName: "button_play"), for: .normal)
    button.setImage(#imageLiteral(resourceName: "button_pause"), for: .selected)
    button.addTarget(self, action: #selector(touchUpPlayPauseButton), for: .touchUpInside)
    
    return button
  }()
  
  private let timeLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 16)
    label.text = "00:00:00"
    
    return label
  }()
  
  private let progressSlider: UISlider = {
    let slider = UISlider()
    slider.tintColor = .red
    slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
    
    return slider
  }()
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    
    configure()
    self.initializePlayer()
  }
  
  // MARK: - Method
  
  func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
    guard let error: Error = error else {
      print("오디오 플레이어 디코드 오류발생")
      return
    }
    
    let message: String
    message = "오디오 플레이어 오류 발생 \(error.localizedDescription)"
    
    let alert: UIAlertController = UIAlertController(title: "알림", message: message, preferredStyle: UIAlertController.Style.alert)
    
    let okAction: UIAlertAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default) {
      (action: UIAlertAction) -> Void in
      self.dismiss(animated: true, completion: nil)
    }
    
    alert.addAction(okAction)
    self.present(alert, animated: true, completion: nil)
  }
  
  // 플레이가 끝났을 경우 초기화 시켜주는 메서드
  
  func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
    self.playPauseButton.isSelected = false
    self.progressSlider.value = 0
    self.updateTimeLabelText(time: 0)
    self.invalidateTimer()
  }
  
  // 플레이어를 초기화 하는 메서드
  func initializePlayer() {
    guard let soundAsset: NSDataAsset = NSDataAsset(name: "sound") else {
      print("음원 파일 에셋을 가져올 수 없습니다.")
      return
    }
    
    do {
      try self.player = AVAudioPlayer(data: soundAsset.data)
      self.player.delegate = self
    } catch let error as NSError {
      print("플레이어 초기화 실패")
      print("코드 : \(error.code), 메세지 : \(error.localizedDescription)")
    }
    
    self.progressSlider.maximumValue = Float(self.player.duration)
    self.progressSlider.minimumValue = 0
    self.progressSlider.value = Float(self.player.currentTime)
  }
  
  // 레이블 업데이트 메서드
  func updateTimeLabelText(time: TimeInterval) {
    let minute: Int = Int(time / 60)
    let second: Int = Int(time.truncatingRemainder(dividingBy: 60))
    let milisecond: Int = Int(time.truncatingRemainder(dividingBy: 1) * 100)
    
    let timeText: String = String(format: "%02ld:%02ld:%02ld", minute, second, milisecond)
    
    self.timeLabel.text = timeText
  }
  
  // 타이머를 생성하고 플레이하는 메서드
  func makeAndFireTimer() {
    self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (timer: Timer) in
      if self.progressSlider.isTracking { return }
      
      self.updateTimeLabelText(time: self.player.currentTime)
      self.progressSlider.value = Float(self.player.currentTime)
    })
    self.timer.fire()
  }
  
  // 타이머 해지
  func invalidateTimer() {
    self.timer.invalidate()
    self.timer = nil
  }
  
  // MARK: - Helper
  
  func configure() {
    [playPauseButton, timeLabel, progressSlider].forEach { view.addSubview($0) }
    
    playPauseButton.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.centerY.equalToSuperview()
      $0.width.equalTo(200)
      $0.height.equalTo(200)
    }
    
    timeLabel.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(playPauseButton.snp.bottom).offset(10)
    }
    
    progressSlider.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(30)
      $0.trailing.equalToSuperview().offset(-30)
      $0.top.equalTo(timeLabel.snp.bottom).offset(10)
    }
  }
  
  // MARK: - Action Method
  @objc func touchUpPlayPauseButton(_ sender: UIButton) {
    sender.isSelected = !sender.isSelected
    
    if sender.isSelected {
      self.player?.play()
      self.makeAndFireTimer()
    } else {
      self.player.pause()
      self.invalidateTimer()
    }
    
  }

  @objc func sliderValueChanged(_ sender: UISlider) {
    self.updateTimeLabelText(time: TimeInterval(sender.value))
    if sender.isTracking { return }
    self.player.currentTime = TimeInterval(sender.value)
  }

}

