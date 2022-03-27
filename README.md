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

# This is an example program in my book "Artificial Intelligence Using Swift"

This example is released using the Apache 2 license.

## Book Cover Material, Copyright, and License

Copyright 2022 Mark Watson. All rights reserved.

## This Book is Licensed with Creative Commons Attribution CC BY Version 3 That Allows Reuse In Derived Works

You are free to:

- Share — copy and redistribute the material in any medium or format
- Adapt — remix, transform, and build upon the material
for any purpose, even commercially.

You are required to give appropriate credit in any derived works:

```text
This work is derived from all or part of "Artificial Intelligence Using Swift" by
Mark Watson. Source: https://leanpub.com/lovinglisp
```

This eBook will be updated occasionally so please periodically check the [leanpub.com web page for this book](https://leanpub.com/SwiftAI) for updates.

This is the first edition released spring of 2022.

Please visit the [author's website](http://markwatson.com).

If you found a copy of this book on the web and find it of value then please consider buying a copy at [leanpub.com/SwiftAI](https://leanpub.com/SwiftAI) to support the author and fund work for future updates.  You can also see all of my books on [my website https://markwatson.com/#books](https://markwatson.com/#books).
