#!/usr/bin/env bash

# help to use the program
helpy(){
printf "command: %s <path>\n" "$0"
printf "path: path to the Cisco Packet Tracer .deb file\n"
}

# verify the .deb file
[ "$1" == "-h" ] && helpy && exit 1
[ ! -f "$1" ] || [ "$1" == "-h" ] && helpy && exit 1 # if it doesn't exists
DEB_FILE_PATH="$1"
DEB_FILE=$(echo "$DEB_FILE_PATH" | grep -o '[^/]*$')


# extract files
echo "creating temporary files..."
DIR="$(mktemp -d)"

cp "$DEB_FILE_PATH" "$DIR"
pushd "$DIR" || exit 1
ar -xv "$DEB_FILE"
mkdir control
tar -C control -Jxvf control.tar.xz
mkdir data
tar -C data -Jxvf data.tar.xz
cd data || exit 1


# remove previous version
rm -rfv /opt/pt


# copy opt folder
cp -rv ./opt/ /


# remove temporary files
popd || exit 1
rm -rfv "$DIR"
