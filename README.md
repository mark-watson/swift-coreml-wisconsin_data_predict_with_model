# wisconsin_data_create_model

There are two commented out lines at the bottom of the file main.swift:

     // create_model()
     //predict()

Uncomment the first call to create_model(), and run the main program:

    swift build
    swift run

After running the create model main function create_model(), then generate an interface to the model:

     cd Sources/wisconsin_data_create_model 
     xcrun coremlcompiler generate wisconsin.mlmodel --language Swift . 
     xcrun coremlcompiler compile wisconsin.mlmodel .

Then in the file main.swift, comment the call to create_model() and uncomment the call to predict and run the saved model:

~~~
$ swift run  
["ClassProbability", "Class"]
Class: Int : 0
ClassProbability: Dictionary : {
    0 = "0.8766589844853373";
    1 = "0.1233410155146627";
}
~~~

A HUGE THANKS to Stack Overflow contributers Vincent Garcia and Matthijs Hollemans for information that helped me get this example working properly!

