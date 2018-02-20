#!/bin/bash

if [ $# -ne 2 ]
  then
    echo "Usage: ./$(basename $0) VM_NAME SNAPSHOT_NAME"
    exit 1
fi

vmName=$1
snapshotName=$2

echo "Snapshot $snapshotName sur la VM $vmName en cours de création..."
VBoxManage snapshot $vmName take $snapshotName 
echo "Snapshot créée"
