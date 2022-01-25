#!/bin/bash

termux-wake-unlock
apt-get update
apt-get install git -y
apt-get install cmake -y
apt update
apt upgrade -y
git clone https://github.com/xmrig/xmrig.git
cd xmrig
mkdir build
cd build
cmake -DWITH_HWLOC=OFF ..
make

#Ask for pool
echo 'Where do you want to mine?'
pool=("Swepool.org:3333" "Norpool.org:3333" "Pool.kryptokrona.se:3333" "Pool.gamersnest.org:3333" "Drakpool.com:3333")

for i in "${!pool[@]}"; do
  printf "%s\t%s\n" "$i" "${pool[$i]}"
done

read opt
echo After entering your XKR-address the miner will start. To start it again, just enter Termux and type xkr.
echo Your XKR-Address?
read address
#Create shortcut
echo "./xmrig -a cn-pico -o ${pool[$opt]} -u $address -p x -t 8" > start.sh
chmod +x start.sh
DIR=$(pwd)
alias xkr="${DIR}/start.sh"
echo "alias xkr=${DIR}/start.sh" >> ~/.bashrc
#Start xmrig
./xmrig -a cn-pico -o ${pool[$opt]} -u $address -p x -t 8
