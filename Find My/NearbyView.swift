//
//  NearbyView.swift
//  Find My
//
//  Created by william on 2024/4/4.
//

import SwiftUI
import CoreMotion

struct NearbyView: View {
    @Environment(SceneDelegate.self) private var sceneDelegate
    @Environment(WindowSharedModel.self) private var windowSharedModel
    let motionManager = CMMotionManager()
    @State var direction: Double = 0.0
    let distance: Int = 45
    let directionDescription = "ahead"
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("FINDING")
                    .foregroundColor(.white)
                    .font(.subheadline)
                
                Text(windowSharedModel.activeDevice.name)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .bold()
                
                VStack {
                    Image(systemName: "circle.fill")
                        .font(.system(size: 30, weight: .heavy, design: .rounded))
                        .foregroundStyle(.white)
                        .padding(.bottom, 30)
                    
                    Image(systemName: "arrow.up")
                        .font(.system(size: 180, weight: .heavy, design: .rounded))
                        .foregroundStyle(.white)
                }
                .rotationEffect(.degrees(direction))
                .padding(.top, 60)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                .onAppear() {
                    // 设置传感器更新间隔
                    self.motionManager.accelerometerUpdateInterval = 0.1
                    self.motionManager.gyroUpdateInterval = 0.1
                    self.motionManager.magnetometerUpdateInterval = 0.1

                    // 开始接收传感器数据
                    self.motionManager.startAccelerometerUpdates()
                    self.motionManager.startGyroUpdates()
                    self.motionManager.startMagnetometerUpdates()

                    // 处理传感器数据
                    let queue = OperationQueue()
                    self.motionManager.startDeviceMotionUpdates(to: queue) { (data, error) in
                        guard let data = data else {
                            return
                        }
                        self.direction = data.attitude.yaw * 180 / .pi
                        print("yaw: \(self.direction)")
                    }
                }
                .onDisappear() {
                    // 停止接收传感器数据
                    self.motionManager.stopAccelerometerUpdates()
                    self.motionManager.stopGyroUpdates()
                    self.motionManager.stopMagnetometerUpdates()
                    self.motionManager.stopDeviceMotionUpdates()
                }
                
                
                Spacer()
                HStack {
                    Text("\(distance)")
                        .font(.system(size: 50, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                    Text("ft")
                        .font(.system(size: 50, weight: .regular, design: .rounded))
                        .foregroundColor(.white.opacity(0.3))
                }
                Text(directionDescription)
                    .font(.system(size: 50, weight: .regular, design: .rounded))
                    .foregroundColor(.white)
                HStack {
                    CircularButton(systemName: "xmark") {
                        sceneDelegate.removeNearbyWindow()
                        self.motionManager.stopAccelerometerUpdates()
                        self.motionManager.stopGyroUpdates()
                        self.motionManager.stopMagnetometerUpdates()
                        self.motionManager.stopDeviceMotionUpdates()
                    }
                    Spacer()
                    CircularButton(systemName: "message.fill")
                }
                .padding(.horizontal)
            }
            .padding(.all)
        }
    }
}

struct CircularButton: View {
    var systemName: String
    var action: () -> Void = {}
    init(systemName: String, action: @escaping () -> Void = {}) {
        self.systemName = systemName
        self.action = action
    }
    var body: some View {
        Button(action: {
            action()
        }) {
            Image(systemName: systemName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .foregroundColor(.white)
                .padding(20)
                .background(Color.white.opacity(0.3))
                .clipShape(Circle())
        }
    }
}

#Preview {
    NearbyView()
}
