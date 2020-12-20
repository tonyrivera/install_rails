## Install Ruby on Rails in Ubuntu 18.04
    sudo apt-get update
    sudo apt-get install curl
    bash <(curl -sL https://raw.githubusercontent.com/tonyrivera/install_rails/main/install_rails.sh)
    
    cd $HOMEcd b
    rails new app_name # Use this in non WSL ubuntu versions
    rails new app_name --skip-spring --skip-listen # For Windows Subsystem (WSL) for Linux Ubuntu users
    cd new_app/
    rails -server
