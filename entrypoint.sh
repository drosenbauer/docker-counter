#!/bin/bash

# Port can be specified as an environment variable
if [[ -z "${PORT}" ]]; then
	PORT=12345
fi

echo "Listening on port ${PORT}"

while true; do
	# Note '-q 0' causes nc to exit immediately on receiving an EOF, otherwise hangs forever
	(bash /atomic.sh) | nc -q 0 -l ${PORT}
done

