import UIKit


enum Computer {
    case cpu(core:Int, ghz: Double)
    case ram(Int, String)
    case hardDisk(gb: Int)
}

var chip = Computer.cpu(core: 8, ghz: 3.1)

switch chip {
case .cpu(core: 8, ghz: 3.1):
    print("CPU 8코어 3.1GHz입니다.")
case .cpu(core: 8, ghz: 3.1):
    print("CPU 8코어 3.1GHz입니다.")
case.cpu(core: 4, ghz: let ghz):
    print("CPU 4코어 \(ghz)GHz입니다.")
case .cpu(core: _, ghz: _):
    print("CPU 칩 입니다.")
case .ram(32, _):
    print("32기가램 입니다.")
case let .hardDisk(gb: gB):
    print("\(gB)기가 바이트 하드디스크 입니다.")
default:
    print("그 외 나머지입니다.")
}


chip = Computer.hardDisk(gb: 128)

if case Computer.hardDisk(gb: let gb) = chip {
    print("\(gb)기가 바이트 하드디스킁")
}

if case Computer.hardDisk(gb: let gb) = chip, gb == 256 {
    print("256기가 하드디스크임")
}


let chiplists : [Computer] = [
    .cpu(core: 4, ghz: 3.0),
    .cpu(core: 8, ghz: 3.5),
    .ram(16, "SRAM"),
    .ram(32, "DRAM"),
    .cpu(core: 8, ghz: 3.5),
    .hardDisk(gb: 500),
    .hardDisk(gb: 256),
]

for case let .cpu(core: c, ghz: h) in chiplists {
    print("CPU칩: \(c)코어, \(h)헤르츠")
}


