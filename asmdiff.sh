#!/bin/bash

: ${CROSS:="mips-linux-gnu"} # Allows override
OBJDUMP="$CROSS-objdump -D -z -bbinary -mmips -EB"
OPTIONS="--start-address=$(($1)) --stop-address=$(($2))"
$OBJDUMP $OPTIONS baserom.u.z64 > baserom.u.dump
$OBJDUMP $OPTIONS build/marioparty.u.z64 > marioparty.u.dump
diff baserom.u.dump marioparty.u.dump | colordiff
