echo -e "Creating a 3GB swap file"
sudo dd if=/dev/zero of=/swapfile bs=1024 count=104857
sudo mkswap /swapfile
sudo chmod 600 /swapfile
sudo swapon /swapfile
