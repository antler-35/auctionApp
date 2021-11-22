# AuctionAPP
The Flask (Python) - HTML/CSS/Vanilla JS - PostgreSQL Auction Implementation.
AuctionApp instructions:

## For development environment

Clone the repository:

    git@github.com:antler-35/auctionApp.git

Move to the repository folder:

    cd auctionapp/

Create the virtual environment:

    python3 -m venv ~/.auctionapp

Activate the virtual env:

    . ~/.auctionapp/bin/activate

Install the requirements:

    pip install -r requirements.txt

Add .env and .envflask files

    mv .env.example .env
    mv .flaskenv.example .flaskenv

Update files according to the settings that you want to manage for example it in .flaskenv file:

    DATABASE_URL=postgres://YOUR_USER@YOUR_HOST:YOUR_PORT/YOUR_DB

Run the development server

    flask run --host=0.0.0.0

Happy Hacking!
