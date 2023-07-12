
protocol AdvancedLifeSupport {
    func performCPR()
}
// When a Class set it as the delegate of the above protocol, it is forced to implement the method also. In the below case all the methods are the same. In that case we can make a default method ie; extension,
extension AdvancedLifeSupport {
    func performCPR(){
        print("does some chest compressions, 30 per seconds")
    }
}



class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func assessSituation() {
        print("Can you tell me what happened")
    }
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

struct ParaMedic: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }// Here ParaMedic Struct does conform the Protocol, Because of the extension it is not necessary to implementation of the method
}

class Doctor: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The Doctor  does some chest compressions, 30 per seconds")
    }
    func useStethoscope() {
        print("Listening to heartbeat")
    }
}

class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR()
        print("Doing some crazy stuff")
    }
    func useElectricDrill() {
        print("Whirr....")
    }
}

let emilio = EmergencyCallHandler()
let dixon = Surgeon(handler: emilio)

emilio.assessSituation()
emilio.medicalEmergency()

