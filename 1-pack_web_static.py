#!/usr/bin/python3
"""
    Fabric file to pack the content of the weppage and
    put in versions directory
"""
from fabric.api import *
from datetime import datetime
from os import mkdir
from os.path import exists


def do_pack():
    """Pack the content of web_static and store it in versions
    With name: web_static_<year><month><day><hour><minute><second>.tgz

    return archive path
    """
    if not exists("versions"):
        mkdir("versions")

    time_now = datetime.now().strftime("%Y%m%d%H%M%S")
    archive_name = f"web_static_{time_now}.tgz"
    local(f"tar -cvzf versions/{archive_name} web_static/")

    return f"versions/{archive_name}"
