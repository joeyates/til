# Setup

sudo apt install python3-pip
pip3 install gigalixir --ignore-installed six
export PATH=~/.local/bin:$PATH
gigalixir login

# Create Project

gigalixir pg:create --free

# Deploy

git push gigalixir master

# Copy Database - Local to remote

pg_dump {{database name}} | gigalixir pg:psql
