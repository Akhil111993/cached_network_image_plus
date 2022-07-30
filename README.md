<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

This package is a clone of cached_image_network. If you are still seeing loading screen
when using cached_image_network you can use this project. Note that this package will also 
show loading screen if the image is loading the first time.

## Features

This package downloads the image to a temporary folder the first time image loads and load image
from that folder whenever the image is called again

<!-- 
## Getting started

TODO: List prerequisites and provide or point to information on how to

start using the package.
-->

## Usage

```dart
  CachedNetworkImagePlus(
  
      width: 200,
      
      height: 300,
      
      fit: BoxFit.cover,
      
      url: imageUrl,  //add your image url here
  
  );
```

If you want to get ImageProvider you can use the code from the following example

```dart
       decoration: BoxDecoration(
        
        image: DecorationImage(
        
            image: CachedNetworkImagePlusNetworkProvider()
        
                .getImageProvider(imageUrl), 
        
        ),
        
        ),
```

<!-- 
TODO: Include short and useful examples for package users. Add longer examples

to `/example` folder. 


## Additional information

TODO: Tell users more about the package: where to find more information, how to 

contribute to the package, how to file issues, what response they can expect 

from the package authors, and more.
-->