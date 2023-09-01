
if [ $# -ne 2 ]; then
   echo "Usage : $0 <instance_name> <command>"
   echo "  command : create, ip, public, stop, start, status, private, delete"
   exit 1
fi

MYINSTANCE=$1
MYCMD=$2

MYOPTS="--profile=xper"

echo MYCMD=$MYCMD
echo MYINSTANCE=$MYINSTANCE
echo MYOPTS=$MYOPTS

create_instances() {
  aws ${MYOPTS} lightsail create-instances --instance-name ${MYINSTANCE} --availability-zone ap-northeast-2a --blueprint-id ubuntu_18_04 --bundle-id medium_2_0 --user-data file://light.data
}

getip_instances() {
  aws ${MYOPTS} lightsail get-instance --instance-name ${MYINSTANCE} | jq '.instance.publicIpAddress'
}

public_instances() {
  aws ${MYOPTS} lightsail open-instance-public-ports --instance-name ${MYINSTANCE} --port-info fromPort=0,toPort=65535,protocol=all
}

private_instances() {
  aws ${MYOPTS} lightsail close-instance-public-ports --instance-name ${MYINSTANCE} --port-info fromPort=0,toPort=65535,protocol=all
}

stop_instances() {
  aws ${MYOPTS} lightsail stop-instance --instance-name ${MYINSTANCE}
}

start_instances() {
  aws ${MYOPTS} lightsail stop-instance --instance-name ${MYINSTANCE}
}

status_instances() {
  aws ${MYOPTS} lightsail get-instance --instance-name ${MYINSTANCE}
}

delete_instances() {
  aws ${MYOPTS} lightsail delete-instance --instance-name ${MYINSTANCE}
}


echo "START: $MYCMD, $MYINSTANCE"

case "$MYCMD" in
create) create_instances ;;
ip) getip_instances ;;
public) public_instances ;;
stop) stop_instances ;;
start) start_instances ;;
status) status_instances ;;
private) private_instances ;;
delete) delete_instances ;;
esac

echo "DONE."
