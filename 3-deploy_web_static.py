#!/usr/bin/python3
"""Deploy your content to the remote

    Upload teh archive with the content, uncompress it, put it in place
"""
# from fabric.api import *
# from os.path import exists
# from datetime import datetime
# from os import mkdir


# # Define hosts and user outside of the function using the older Fabric API
# env.hosts = ["35.153.98.111", "35.175.65.23"]
# env.user = "ubuntu"


# # Define the function to pack the content
# @runs_once
# def do_pack():
#     """Pack the content of web_static and store it in versions
#     With name: web_static_<year><month><day><hour><minute><second>.tgz

#     return archive path
#     """
#     if not exists("versions"):
#         mkdir("versions")

#     time_now = datetime.utcnow().strftime("%Y%m%d%H%M%S")
#     archive_name = "web_static_{}.tgz".format(time_now)
#     local("tar -cvzf versions/{} web_static/".format(archive_name))

#     return "versions/{}".format(archive_name)


# # Define the function to deploy the content
# def do_deploy(archive_path=""):
#     """Deploy your content to the remote

#         Upload teh archive with the content, uncompress it, put it in place
#     """
#     if not exists(archive_path):
#         return False
#     try:
#         put(archive_path, "/tmp/")
#         archive_name = archive_path.split(sep='/')[-1][:-4]
#         path = '/data/web_static/releases'
#         run("sudo mkdir -p {}/{}".format(path, archive_name))
#         run("sudo tar -xzf /tmp/{}.tgz -C {}/{}".format(
#             archive_name, path, archive_name))
#         run("sudo rm -rf /tmp/{}.tgz".format(archive_name))
#         run("sudo mv -f {}/{}/web_static/* {}/{}".format(
#             path, archive_name, path, archive_name))
#         run("sudo rm -rf {}/{}/web_static".format(path, archive_name))

#         run("sudo rm -rf /data/web_static/current")
#         run("sudo ln -s {}/{} /data/web_static/current".format(
#             path, archive_name))
#         return True
#     except Exception:
#         return False


# def deploy():
#     """Archives and deploys the static files to the remote.
#     """
#     archive_path = do_pack()
#     return do_deploy(archive_path) if archive_path else False


'''fcreates and distributes an archive to your web servers, using deploy():
'''

import os
from datetime import datetime
from fabric.api import env, local, put, run, runs_once


env.hosts = ['34.138.32.248', '3.226.74.205']


@runs_once
def do_pack():
    """Archives the static files."""
    if not os.path.isdir("versions"):
        os.mkdir("versions")
    cur_time = datetime.now()
    output = "versions/web_static_{}{}{}{}{}{}.tgz".format(
        cur_time.year,
        cur_time.month,
        cur_time.day,
        cur_time.hour,
        cur_time.minute,
        cur_time.second
    )
    try:
        print("Packing web_static to {}".format(output))
        local("tar -cvzf {} web_static".format(output))
        archize_size = os.stat(output).st_size
        print("web_static packed: {} -> {} Bytes".format(output, archize_size))
    except Exception:
        output = None
    return output


def do_deploy(archive_path):
    """Deploys the static files to the host servers.
    Args:
        archive_path (str): The path to the archived static files.
    """
    if not os.path.exists(archive_path):
        return False
    file_name = os.path.basename(archive_path)
    folder_name = file_name.replace(".tgz", "")
    folder_path = "/data/web_static/releases/{}/".format(folder_name)
    success = False
    try:
        put(archive_path, "/tmp/{}".format(file_name))
        run("mkdir -p {}".format(folder_path))
        run("tar -xzf /tmp/{} -C {}".format(file_name, folder_path))
        run("rm -rf /tmp/{}".format(file_name))
        run("mv {}web_static/* {}".format(folder_path, folder_path))
        run("rm -rf {}web_static".format(folder_path))
        run("rm -rf /data/web_static/current")
        run("ln -s {} /data/web_static/current".format(folder_path))
        print('New version is now LIVE!')
        success = True
    except Exception:
        success = False
    return success


def deploy():
    """Archives and deploys the static files to the host servers.
    """
    archive_path = do_pack()
    return do_deploy(archive_path) if archive_path else False
