# RKT files
This project containes different kinds of rkt files for different kinds of application languages.

## List of Applications
* Golang
* Golang-alpine
* Java-Maven2
* Java-Maven2-alpine
* Java-Maven3
* Java-Maven3-alpine
* Java-Gradle
* Java-Gradle-alpine
* NodeJS
* NodeJS-alpine
* Python2
* Python2-alpine
* Python3
* Python3-alpine
* Kotlin-Maven3
* Kotlin-Maven3-alpine
* Ruby
* Ruby-alpine
* Binary

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

```
