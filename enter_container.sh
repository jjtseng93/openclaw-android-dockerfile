#!/bin/sh

if echo $PREFIX | grep -qi termux ; then

  udocker run --volume=/system --volume=/apex --volume=/data --volume=/linkerconfig/ld.config.txt clawdroid bash

else

  udocker run clawdroid bash

fi
