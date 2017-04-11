
cd 


sudo apt-get -y install htop screen vim


ANACONDA_INSTALLER="https://repo.continuum.io/archive/Anaconda2-4.2.0-Linux-x86_64.sh"

export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-0.12.1-cp27-none-linux_x86_64.whl

export TF_BINARY_URL=$TF_BINARY_URL

if ls anaconda2/ > /dev/null 2>&1; then
    echo "Anaconda already installed."
else

   if ls Anaconda*64.sh > /dev/null 2>&1; then
      echo "Skipping Anaconda download"
   else
       wget $ANACONDA_INSTALLER
   fi

   bash Anaconda*64.sh
fi





echo "Installing tensorflow:"
pip install $TF_BINARY_URL


if git status > /dev/null 2>&1 ; then 
    echo "Git already installed"
else
    ( sudo apt-get install git ) 
fi


scp coombs.science.uoit.ca:/home/kmills/cudnn.tgz ./
sudo tar -xvf cudnn.tgz -C /usr/local/


