Townhall
========

Townhall is a web-application for creating a place where citizens can take an
active role in their local governments online.

To start, it will be a place where citizens can find videos of local meetings
and annotate them as they watch allowing others to flip between parts of
interest and drawing connections from other documents and meetings.

Getting Started
--------------

Checkout the latest copy using git:

    git clone git://github.com/townhall/townhall.git

Then create a branch:

    git checkout -b my-locale

Then customize the entries in config/townhall.yml for your locale.

Then configure heroku:

    heroku create my-locale

Then push to heroku

    git push heroku

In order to transcode video used in townhall you'll need to do the following on Ubuntu 10.04:

    sudo add-apt-repository ppa:nvidia-vdpau/cutting-edge-multimedia
    sudo apt-get update
    sudo apt-get install ffmpeg -y


Mailing List
-------

Just send your first email to
[townhall@librelist.com](mailto:townhall@librelist.com) and you'll be
automatically subscribed

Also feel free to checkout the archives
[http://librelist.com/browser/townhall](http://librelist.com/browser/townhall)

Contribute
----------
 - Create a github fork
 - Clone your fork
 - Make a feature branch
 - Make your changes, commit and push them
 - Open an issue pointing to your branch
