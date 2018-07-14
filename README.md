# Papel Sentinel

An all-powerful toolset for Papel.

Sentinel is an autonomous agent for persisting, processing and automating Papel governance objects and tasks, and for expanded functions.

Sentinel is implemented as a Python application that binds to a local version 12 papeld instance on each Papel Masternode.

This guide covers installing Sentinel onto an existing Masternode in Ubuntu 14.04 / 16.04.

## Installation

### 1. Install Prerequisites

Make sure Python version 2.7.x or above is installed:

    python --version

Update system packages and ensure virtualenv is installed:

    $ sudo apt-get update
    $ sudo apt-get -y install python-virtualenv

### 2. Install Sentinel

Clone the Sentinel repo and install Python dependencies.

    $ git clone https://github.com/papelcoin/sentinel.git && cd sentinel
    $ virtualenv ./venv
    $ ./venv/bin/pip install -r requirements.txt

### 3. Set up Cron

Set up a crontab entry to call Sentinel every minute:

    $ crontab -e

In the crontab editor, add the lines below, replacing '/home/YOURUSERNAME/sentinel' to the path where you cloned sentinel to:

    * * * * * cd /home/YOURUSERNAME/sentinel && ./venv/bin/python bin/sentinel.py >/dev/null 2>&1
    
If you followed a guide where it had you install Terracoin to the root directory your path to where you cloned sentiel will be:

    * * * * * cd /root/sentinel && SENTINEL_DEBUG=1 ./venv/bin/python bin/sentinel.py >> sentinel.log 2>&1

### 4. Test the Configuration

Removed temporarily.

## Configuration

An alternative (non-default) path to the `papel.conf` file can be specified in `sentinel.conf`:

    papel_conf=/path/to/papel.conf

## Troubleshooting

To view debug output, set the `SENTINEL_DEBUG` environment variable to anything non-zero, then run the script manually:

    $ SENTINEL_DEBUG=1 ./venv/bin/python bin/sentinel.py
    
To view the debug output in real time enter:

    tail -f sentinel.log

### License

Released under the MIT license, under the same terms as PapelCore itself. See [LICENSE](LICENSE) for more info.
