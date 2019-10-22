#! /bin/bash

echo " Migration Started  "

rm /nz/scripts/ProdToQAMigration.log

M_OutPut_Log=/nz/scripts/ProdToQAMigration.log



echo " Migration Completed "

sendmail skumar@luxotticaretail.com,saravanakumar.ganesan@sealconsult.com < ${M_OutPut_Log}

echo " Migration Logs Sent To Mail  "







