import Foundation
import CoreML
import CreateML

func predict() {
    if #available(macOS 10.14, *) {
        
        //let url = wisconsin_data_create_model.url(forResource: "wisconsin", withExtension: "mlmodelc")!
        let modelUrl = URL(fileURLWithPath: "Sources/wisconsin_data/wisconsin.mlmodelc")
        let pretrained_model = try! wisconsin(contentsOf: modelUrl, configuration: MLModelConfiguration())
        
        //let pretrained_model = try? wisconsin(configuration: MLModelConfiguration()) {
        let sampleInput = wisconsinInput(Cl_thickness: 3, Cell_size: 2, Cell_shape: 5, Marg_adhesion: 8, Epith_c_size: 8, Bare_nuclei: 2, Bl_cromatin: 3, Normal_nucleoli: 7, Mitoses: 4)
        let a_prediction = try! pretrained_model.prediction(input: sampleInput)
        print(a_prediction.featureNames)
        print("Class:", a_prediction.featureValue(for: "Class")!)
        print("ClassProbability:", a_prediction.featureValue(for: "ClassProbability")!)

    }
}

predict()

