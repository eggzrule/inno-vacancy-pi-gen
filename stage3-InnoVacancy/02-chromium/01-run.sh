#!/bin/bash -e

# copy the xinit file for chromium
install -m 755 files/chromium.xinit "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/InnoVacancy-autostart/chromium.xinit"

# copy the innovacancy init.d file and default configuration
install -m 755 files/innovacancy.init "${ROOTFS_DIR}/etc/init.d/innovacancy"
install -m 644 files/innovacancy.default "${ROOTFS_DIR}/etc/default/innovacancy"

# register the innovacancy service
on_chroot << EOF
update-rc.d innovacancy defaults
EOF

# clear x authority if present
rm -r "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.Xauthority"