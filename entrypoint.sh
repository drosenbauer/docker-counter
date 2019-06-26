#!/bin/bash

DONE=0

#Define cleanup procedure
cleanup() {
	SOCAT_PID=`ps | grep socat | grep -v grep | awk '{print $1}'`
	echo "socat is running on PID ${SOCAT_PID}, stopping gracefully..."
	kill ${SOCAT_PID}
	DONE=1
}

trap 'cleanup' SIGTERM

# Port can be specified as an environment variable
if [[ -z "${PORT}" ]]; then
	PORT=12345
fi

echo "Listening on port ${PORT}"
socat "TCP-LISTEN:${PORT},fork" EXEC:'bash /atomic.sh' &

while [[ "${DONE}" == "0" ]]; do
	sleep 1
done

