#!/usr/bin/env bash

REPOSITORY=/home/ec2-user/kusitms26
cd $REPOSITORY/tikkeul-server/

echo "> Build 파일 복사"
cp ./build/libs/*.jar $REPOSITORY/


echo "> 현재 구동중인 애플리케이션 pid 확인"
CURRENT_PID=$(pgrep -f finit)
echo "$CURRENT_PID"

if [ -z $CURRENT_PID ]
then
  echo "> 종료할것 없음."
else
  echo "> kill -9 $CURRENT_PID"
  kill -15 $CURRENT_PID
  sleep 5
fi

echo "> 새 어플리케이션 배포"
JAR_NAME=$(ls $REPOSITORY/ | grep 'finit' | tail -n 1)

echo "> JAR Name: $JAR_NAME"
nohup java -jar $REPOSITORY/$JAR_NAME &