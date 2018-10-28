prestaShopVersion=1.7.4.3

#Download Prestashop
echo "Downloading Prestashop"
echo "----------------------"
sudo rm -rf prestashop*.zip*
wget -q https://download.prestashop.com/download/releases/prestashop_${prestaShopVersion}.zip

#Unpacking Prestashop
echo "Unpacking Prestashop"
echo "----------------------"
#Installing ZIP archiever
sudo apt-get install -y unzip

sudo unzip -qq prestashop_${prestaShopVersion}.zip -d /var/www/public
echo "Archive unzipped successfully, deleting archive"
sudo rm -f prestashop_${prestaShopVersion}.zip

echo "Unzipping prestashop (this may take some time) and deleting unneccessary files"
cd /var/www/public
sudo rm -f index.php Install_Prestashop.html
sudo unzip -q prestashop.zip
sudo rm -f prestashop.zip

#Installing Prestashop from CLI
echo "Installing Prestashop from CLI"
echo "------------------------------"
php install/index_cli.php --domain=prestashop.test --db_password=root --db_name=scotchbox --newsletter=0

#Removing install directory
sudo rm -rf install/
