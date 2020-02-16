#!/bin/bash

current_path=`pwd`
case "`uname`" in
    Linux)
		bin_abs_path=$(readlink -f $(dirname $0))
		;;
	*)
		bin_abs_path=`cd $(dirname $0); pwd`
		;;
esac
base=${bin_abs_path}/..
app=igo-cloud-eureka-server-1.0-SNAPSHOT.jar

## set java path
if [ -z "$JAVA" ] ; then
  JAVA=$(which java)
fi
JAVA_OPTS="-Xms64m -Xmx512m -XX:PermSize=32m -XX:MaxPermSize=512m -jar $app --spring.profiles.active=prod"
echo $JAVA
echo $JAVA_OPTS
nohup $JAVA $JAVA_OPTS  1>>app.log 2>&1 & echo $! > app.pid
