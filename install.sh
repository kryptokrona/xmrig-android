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
PS3='Where do you want to mine? '
pool=("Swepool.org:3333" "Norpool.org:3333" "Pool.kryptokrona.se:3333" "Pool.gamersnest.org:3333")
select opt in "${pool[@]}"
do
    case $opt in
        "Swepool.org:3333")
            echo "Swepool it is!"
            break
            ;;
        "Norpool.org:3333")
            echo "Norpool it is!"
            break
            ;;
        "Pool.kryptokrona.se:3333")
            echo "Kryptokrona it is!"
            break
            ;;
        "Pool.gamersnest.org:3333")
            break
            ;;
        *) echo "Gamersnest it is!";;
    esac
done

#Ask for xkr address

echo Your XKR-Address?

read address

#Start xmrig

./xmrig -a cn-pico -o $pool -u $address -p x -t 8