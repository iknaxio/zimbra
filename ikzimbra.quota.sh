#!/bin/bash

## =============================================================================
## @author iknaxio
## @date 2015-08-31
## @description Genera archivo CSV con tamaños de quota y espacio ocupado
## @usage ikzimbra.quota.sh > /tmp/quota.csv
## -----------------------------------------------------------------------------
## Ultima version en https://github.com/iknaxio/zimbra
## =============================================================================

ZBIN="/opt/zimbra/bin"

echo "Usuario,Cuota,Uso"

$ZBIN/zmprov -l gaa | while read USER
do
  QTOTAL=`$ZBIN/zmprov ga ${USER} | grep "zimbraMailQuota" | cut -d ":" -f2`
  QUSAGE=`$ZBIN/zmmailbox -z -m ${USER} gms`

  echo "${USER},${QTOTAL},${QUSAGE}"
done
