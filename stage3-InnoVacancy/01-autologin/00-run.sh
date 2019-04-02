#!/bin/bash -e

ln -sf /etc/systemd/system/autologin@.service \
	"${ROOTFS_DIR}/etc/systemd/system/getty.target.wants/getty@tty1.service"

install -m 644 files/autologin.conf "${ROOTFS_DIR}/etc/systemd/system/getty@tty1.service.d/autologin.conf"