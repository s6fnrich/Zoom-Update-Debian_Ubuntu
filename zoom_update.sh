if ((${EUID:-0} || "$(id -u)")); then
  echo You are not root.
  exit 1
else
	apt-get update
	apt-get upgrade
	mkdir Temp
	cd Temp
	apt-get -y --purge remove zoom
	wget https://zoom.us/client/latest/zoom_amd64.deb
	dpkg -i zoom*
	apt install -f
	rm *.*
	cd ..
	rmdir Temp
	apt autoremove
	apt autopurge
fi
