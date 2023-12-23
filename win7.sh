echo "Đang tải file xuống - Download windows files"
sudo wget -O /tmp/w7x64.img https://bit.ly/akuhnetw7X64
sudo wget -O driver.iso https://computernewb.com/isos/driver/virtio-win-0.1.240.iso
echo "Download ngrok"
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
read -p "Ctrl + V Authtoken: " CRP 
./ngrok authtoken $CRP 
nohup ./ngrok tcp 3388 &>/dev/null &
echo Downloading File From toigamo.blogspot.com
sudo apt-get install qemu-kvm -y
sudo apt -y install novnc python3-websockify python3-numpy
websockify -D --web=/usr/share/novnc/ 6080 localhost:5900
echo "Wait"
echo "Starting Windows"
echo RDP Address:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "Ctrl+C để copy - Ctrl+C To Copy"
echo Username: akuh
echo Password: Akuh.Net
echo "Chờ 30 giây để hoàn tất - Wait 30s to finish bot"
echo "Vui lòng không tắt cửa sổ này - Dont Close This Tab"
echo "Please support toigamo.blogspot.com thank you"
sudo chmod 666 /dev/kvm
sudo qemu-system-x86_64 -M q35,usb=on -device usb-tablet -cpu host -smp cores=3 -m 12G -device virtio-balloon-pci -vga qxl -device e1000e,netdev=n0 -netdev user,id=n0,hostfwd=tcp::3388-:3389 -boot c -device virtio-serial-pci -device virtio-rng-pci -enable-kvm -drive file=/tmp/w7x64.img,format=raw -drive file=driver.iso,media=cdrom  -vnc :0
