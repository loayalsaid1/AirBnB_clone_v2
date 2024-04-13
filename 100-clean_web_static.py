#!/usr/bin/python3
"""Deploy your content to the remote

    Upload teh archive with the content, uncompress it, put it in place
"""
from fabric.api import *
from os.path import exists
from datetime import datetime
from os import mkdir


# Define hosts and user outside of the function using the older Fabric API
env.hosts = ["35.153.98.111", "35.175.65.23"]
env.user = "ubuntu"


# Define the function to pack the content
@runs_once
def do_pack():
    """Pack the content of web_static and store it in versions
    With name: web_static_<year><month><day><hour><minute><second>.tgz

    return archive path
    """
    if not exists("versions"):
        mkdir("versions")

    time_now = datetime.utcnow().strftime("%Y%m%d%H%M%S")
    archive_name = "web_static_{}.tgz".format(time_now)
    local("tar -cvzf versions/{} web_static/".format(archive_name))

    return "versions/{}".format(archive_name)


# Define the function to deploy the content
def do_deploy(archive_path=""):
    """Deploy your content to the remote

        Upload teh archive with the content, uncompress it, put it in place
    """
    if not exists(archive_path):
        return False
    try:
        put(archive_path, "/tmp/")
        archive_name = archive_path.split(sep='/')[-1][:-4]
        path = '/data/web_static/releases'
        run("sudo mkdir -p {}/{}".format(path, archive_name))
        run("sudo tar -xzf /tmp/{}.tgz -C {}/{}".format(
            archive_name, path, archive_name))
        run("sudo rm -rf /tmp/{}.tgz".format(archive_name))
        run("sudo mv -f {}/{}/web_static/* {}/{}".format(
            path, archive_name, path, archive_name))
        run("sudo rm -rf {}/{}/web_static".format(path, archive_name))

        run("sudo rm -rf /data/web_static/current")
        run("sudo ln -s {}/{} /data/web_static/current".format(
            path, archive_name))
        return True
    except Exception:
        return False


def deploy():
    """Archives and deploys the static files to the remote.
    """
    archive_path = do_pack()
    return do_deploy(archive_path) if archive_path else False


def do_clean(number=1):
    """Remove all old archives and releasess and leave <number>"""
    local_path = "versions"
    remote_path = "/data/web_static/releases"
    command = "rm -rf $(ls -t {} | tail -n +{})"
    command = "cd {} && rm -rf $(ls -t | tail -n +{})"
    starting_line = number + 1
    local(command.format(local_path, starting_line))
    sudo(command.format(remote_path, starting_line))
    # run('cd /home/ubuntu/ && rm -f $(ls -t /home/ubuntu | tail -n +2)')
