# RKT files
This project containes different kinds of rkt files for different kinds of application languages.

## List of Applications
* Golang-alpine
* Java-Maven3-alpine
* NodeJS-alpine
* Python2-alpine
* Python3-alpine
* Kotlin-Maven3-alpine
* Ruby-alpine
* Binary-alpine
* Html-apache-alpine
* Html-nginx-alpine
* Openjdk7-base-alpine
* Openjdk8-base-alpine

## To build any rkt container image
* Make Executable image file
```
sudo chmod +x rkt-container-image-file.sh
```

* Build image file
```
sudo ./rkt-container-image-file.sh
```

* Validate image
```
sudo actool --debug validate <name of image>.aci
```

* Run image
```
rkt run --insecure-options=image --net=host <name of image>.aci
```
### Notes*
```
Acbuild tool is used for making rkt container images.
OPENJDK 7 & 8 images are base images for java and kotlin rkt container images.
```
