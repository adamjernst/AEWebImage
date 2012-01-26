# AEWebImage #
## A simple category on `UIImageView` to load remote images ##

AEWebImage provides a simple addition to the `UIImageView` class:

    - (void)setImageWithURL:(NSURL *)url;

AEWebImage is built on the [AEURLConnection](https://github.com/adamjernst/AEURLConnection) library. You must include AEURLConnection in your project to use AEWebImage.

## To-Do List ##

* AEWebImage cannot cancel ongoing requests. Support for cancellation needs to be added to AEURLConnection, after which AEWebImage can make use of it.
