#!/bin/sh
DEST=/var/www/html/env.js
echo "window._env = {" > ${DEST}
for KEY in ${EXPOSE_VARS}
do
    VAL=$(printenv ${KEY})
    echo "  \"${KEY}\": \"${VAL}\"," >> ${DEST}
done
echo "};" >> ${DEST}

nginx -g 'daemon off;'
