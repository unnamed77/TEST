#!/bin/sh


logfile=/var/log/mac_auth.log



if [ ${IV_PLAT} =  "android" ] || [ ${IV_PLAT} =  "ios"] ; then
        echo "$(date +%m/%d/%Y-%H:%M:%S) authorization OS: ${IV_PLAT} without mac address for user: ${common_name}" >> ${logfile}
 elif [ -f "/auth_mac/${common_name}"  ]; then
        if grep -q ${IV_HWADDR} /auth_mac/${common_name}; then
                echo "$(date +%m/%d/%Y-%H:%M:%S) passed mac: ${IV_HWADDR} for user: ${common_name}" >> ${logfile}
        else
                echo "$(date +%m/%d/%Y-%H:%M:%S) mac: ${IV_HWADDR} not registred! for user: ${common_name}, please add mac, OS: ${IV_PLAT}" >> ${logfile}
                exit 1
        fi
 else
         touch "/auth_mac/${common_name}"
        echo "${IV_HWADDR}" >> /auth_mac/${common_name}
        echo "$(date +%m/%d/%Y-%H:%M:%S) new reg mac: ${IV_HWADDR}, for user: ${common_name} " >> ${logfile}


fi
exit 0
