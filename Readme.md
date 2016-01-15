Ruby Base Dockerfile
--------------------

This is a docker image that is minimal but consists with base ruby with the specific version

Build
-----

Check it out and build.

```
docker build -t grimme/rubybase .
```

Usage
-----

You should not use this image plainly. This is thought to be the base for further ruby images. Use it for ruby applications as base for building them.

Testing/Playing around
----------------------

You can always containerize it like this

```
docker run -ti grimme/rubybase /bin/bash
```

From there you can follow up.
