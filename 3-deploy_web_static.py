#!/usr/bin/python3
"""Deploy your content to the remote

    Upload teh archive with the content, uncompress it, put it in place
"""
from fabric.api import *
from os.path import exists
from datetime import datetime
from os import mkdir


# Define hosts and user outside of the function using the older Fabric API
env.hosts = ["34.232.77.37", "18.210.13.191"]
env.user = "ubuntu"


# Define the function to pack the content
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
@task
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


@task
def deploy():
    """Archives and deploys the static files to the remote.
    """
    archive_path = do_pack()
    return do_deploy(archive_path) if archive_path else False
