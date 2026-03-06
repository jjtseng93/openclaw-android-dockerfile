#!/bin/sh

if echo $PREFIX | grep -qi termux ; then

  udocker run -v /system -v /apex -v /data -v /linkerconfig/ld.config.txt -v "$PREFIX/tmp:/dev/shm" clawdroid bash

else

  udocker run clawdroid bash

fi
