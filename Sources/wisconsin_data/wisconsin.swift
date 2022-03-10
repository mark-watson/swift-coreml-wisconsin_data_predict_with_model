//
// wisconsin.swift
//
// This file was automatically generated and should not be edited.
//

import CoreML


/// Model Prediction Input Type
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
class wisconsinInput : MLFeatureProvider {

    /// Cl.thickness as double value
    var Cl_thickness: Double

    /// Cell.size as double value
    var Cell_size: Double

    /// Cell.shape as double value
    var Cell_shape: Double

    /// Marg.adhesion as double value
    var Marg_adhesion: Double

    /// Epith.c.size as double value
    var Epith_c_size: Double

    /// Bare.nuclei as double value
    var Bare_nuclei: Double

    /// Bl.cromatin as double value
    var Bl_cromatin: Double

    /// Normal.nucleoli as double value
    var Normal_nucleoli: Double

    /// Mitoses as double value
    var Mitoses: Double

    var featureNames: Set<String> {
        get {
            return ["Cl.thickness", "Cell.size", "Cell.shape", "Marg.adhesion", "Epith.c.size", "Bare.nuclei", "Bl.cromatin", "Normal.nucleoli", "Mitoses"]
        }
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == "Cl.thickness") {
            return MLFeatureValue(double: Cl_thickness)
        }
        if (featureName == "Cell.size") {
            return MLFeatureValue(double: Cell_size)
        }
        if (featureName == "Cell.shape") {
            return MLFeatureValue(double: Cell_shape)
        }
        if (featureName == "Marg.adhesion") {
            return MLFeatureValue(double: Marg_adhesion)
        }
        if (featureName == "Epith.c.size") {
            return MLFeatureValue(double: Epith_c_size)
        }
        if (featureName == "Bare.nuclei") {
            return MLFeatureValue(double: Bare_nuclei)
        }
        if (featureName == "Bl.cromatin") {
            return MLFeatureValue(double: Bl_cromatin)
        }
        if (featureName == "Normal.nucleoli") {
            return MLFeatureValue(double: Normal_nucleoli)
        }
        if (featureName == "Mitoses") {
            return MLFeatureValue(double: Mitoses)
        }
        return nil
    }
    
    init(Cl_thickness: Double, Cell_size: Double, Cell_shape: Double, Marg_adhesion: Double, Epith_c_size: Double, Bare_nuclei: Double, Bl_cromatin: Double, Normal_nucleoli: Double, Mitoses: Double) {
        self.Cl_thickness = Cl_thickness
        self.Cell_size = Cell_size
        self.Cell_shape = Cell_shape
        self.Marg_adhesion = Marg_adhesion
        self.Epith_c_size = Epith_c_size
        self.Bare_nuclei = Bare_nuclei
        self.Bl_cromatin = Bl_cromatin
        self.Normal_nucleoli = Normal_nucleoli
        self.Mitoses = Mitoses
    }
}


/// Model Prediction Output Type
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
class wisconsinOutput : MLFeatureProvider {

    /// Source provided by CoreML

    private let provider : MLFeatureProvider


    /// Class as integer value
    lazy var Class_: Int64 = {
        [unowned self] in return self.provider.featureValue(for: "Class")!.int64Value
    }()

    /// ClassProbability as dictionary of 64-bit integers to doubles
    lazy var ClassProbability: [Int64 : Double] = {
        [unowned self] in return self.provider.featureValue(for: "ClassProbability")!.dictionaryValue as! [Int64 : Double]
    }()

    var featureNames: Set<String> {
        return self.provider.featureNames
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        return self.provider.featureValue(for: featureName)
    }

    init(Class_: Int64, ClassProbability: [Int64 : Double]) {
        self.provider = try! MLDictionaryFeatureProvider(dictionary: ["Class" : MLFeatureValue(int64: Class_), "ClassProbability" : MLFeatureValue(dictionary: ClassProbability as [AnyHashable : NSNumber])])
    }

    init(features: MLFeatureProvider) {
        self.provider = features
    }
}


/// Class for model loading and prediction
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
class wisconsin {
    let model: MLModel

    /// URL of model assuming it was installed in the same bundle as this class
    class var urlOfModelInThisBundle : URL {
        let bundle = Bundle(for: self)
        return bundle.url(forResource: "wisconsin", withExtension:"mlmodelc")!
    }

    /**
        Construct wisconsin instance with an existing MLModel object.

        Usually the application does not use this initializer unless it makes a subclass of wisconsin.
        Such application may want to use `MLModel(contentsOfURL:configuration:)` and `wisconsin.urlOfModelInThisBundle` to create a MLModel object to pass-in.

        - parameters:
          - model: MLModel object
    */
    init(model: MLModel) {
        self.model = model
    }

    /**
        Construct wisconsin instance by automatically loading the model from the app's bundle.
    */
    @available(*, deprecated, message: "Use init(configuration:) instead and handle errors appropriately.")
    convenience init() {
        try! self.init(contentsOf: type(of:self).urlOfModelInThisBundle)
    }

    /**
        Construct a model with configuration

        - parameters:
           - configuration: the desired model configuration

        - throws: an NSError object that describes the problem
    */
    @available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
    convenience init(configuration: MLModelConfiguration) throws {
        try self.init(contentsOf: type(of:self).urlOfModelInThisBundle, configuration: configuration)
    }

    /**
        Construct wisconsin instance with explicit path to mlmodelc file
        - parameters:
           - modelURL: the file url of the model

        - throws: an NSError object that describes the problem
    */
    convenience init(contentsOf modelURL: URL) throws {
        try self.init(model: MLModel(contentsOf: modelURL))
    }

    /**
        Construct a model with URL of the .mlmodelc directory and configuration

        - parameters:
           - modelURL: the file url of the model
           - configuration: the desired model configuration

        - throws: an NSError object that describes the problem
    */
    @available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
    convenience init(contentsOf modelURL: URL, configuration: MLModelConfiguration) throws {
        try self.init(model: MLModel(contentsOf: modelURL, configuration: configuration))
    }

    /**
        Construct wisconsin instance asynchronously with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    @available(macOS 11.0, iOS 14.0, tvOS 14.0, watchOS 7.0, *)
    class func load(configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<wisconsin, Error>) -> Void) {
        return self.load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration, completionHandler: handler)
    }

    /**
        Construct wisconsin instance asynchronously with URL of the .mlmodelc directory with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - modelURL: the URL to the model
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    @available(macOS 11.0, iOS 14.0, tvOS 14.0, watchOS 7.0, *)
    class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<wisconsin, Error>) -> Void) {
        MLModel.__loadContents(of: modelURL, configuration: configuration) { (model, error) in
            if let error = error {
                handler(.failure(error))
            } else if let model = model {
                handler(.success(wisconsin(model: model)))
            } else {
                fatalError("SPI failure: -[MLModel loadContentsOfURL:configuration::completionHandler:] vends nil for both model and error.")
            }
        }
    }

    /**
        Make a prediction using the structured interface

        - parameters:
           - input: the input to the prediction as wisconsinInput

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as wisconsinOutput
    */
    func prediction(input: wisconsinInput) throws -> wisconsinOutput {
        return try self.prediction(input: input, options: MLPredictionOptions())
    }

    /**
        Make a prediction using the structured interface

        - parameters:
           - input: the input to the prediction as wisconsinInput
           - options: prediction options 

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as wisconsinOutput
    */
    func prediction(input: wisconsinInput, options: MLPredictionOptions) throws -> wisconsinOutput {
        let outFeatures = try model.prediction(from: input, options:options)
        return wisconsinOutput(features: outFeatures)
    }

    /**
        Make a prediction using the convenience interface

        - parameters:
            - Cl_thickness as double value
            - Cell_size as double value
            - Cell_shape as double value
            - Marg_adhesion as double value
            - Epith_c_size as double value
            - Bare_nuclei as double value
            - Bl_cromatin as double value
            - Normal_nucleoli as double value
            - Mitoses as double value

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as wisconsinOutput
    */
    func prediction(Cl_thickness: Double, Cell_size: Double, Cell_shape: Double, Marg_adhesion: Double, Epith_c_size: Double, Bare_nuclei: Double, Bl_cromatin: Double, Normal_nucleoli: Double, Mitoses: Double) throws -> wisconsinOutput {
        let input_ = wisconsinInput(Cl_thickness: Cl_thickness, Cell_size: Cell_size, Cell_shape: Cell_shape, Marg_adhesion: Marg_adhesion, Epith_c_size: Epith_c_size, Bare_nuclei: Bare_nuclei, Bl_cromatin: Bl_cromatin, Normal_nucleoli: Normal_nucleoli, Mitoses: Mitoses)
        return try self.prediction(input: input_)
    }

    /**
        Make a batch prediction using the structured interface

        - parameters:
           - inputs: the inputs to the prediction as [wisconsinInput]
           - options: prediction options 

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as [wisconsinOutput]
    */
    @available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
    func predictions(inputs: [wisconsinInput], options: MLPredictionOptions = MLPredictionOptions()) throws -> [wisconsinOutput] {
        let batchIn = MLArrayBatchProvider(array: inputs)
        let batchOut = try model.predictions(from: batchIn, options: options)
        var results : [wisconsinOutput] = []
        results.reserveCapacity(inputs.count)
        for i in 0..<batchOut.count {
            let outProvider = batchOut.features(at: i)
            let result =  wisconsinOutput(features: outProvider)
            results.append(result)
        }
        return results
    }
}
