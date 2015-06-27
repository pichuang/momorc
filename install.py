#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Maintainer: Roan Huang <pichuang@cs.nctu.edu.tw>

import logging
import sys
import platform
import os
import subprocess
from os.path import expanduser

logger = logging.getLogger('momorc')
LEVELS = {'debug': logging.DEBUG,
          'info': logging.INFO,
          'warning': logging.WARNING}
ch = logging.StreamHandler()
logger.addHandler(ch)

'''
Add you don't want install filename
TODO: Maybe need a file handle this
'''
IGNORE_LIST = ["README.md", "install.py", "test.py", ".git", "__pycache__", ".gitignore" ]

class Environment:
    def __init__(self):
        logger.debug("Get enviroment")

    @staticmethod
    def os_system():
        system = platform.system()
        logger.debug("OS_VERSION: %s" % system)
        return system

    @staticmethod
    def os_distribution():
        linux = platform.linux_distribution()[0]
        if linux == "":
            logger.debug("OS_Distribution: unknown")
        else:
            logger.debug("OS_Distribution: %s" % linux)
        return linux

    @staticmethod
    def pwd():
        pwd = os.getcwd()
        logger.debug("pwd: %s" % pwd)
        return pwd

    @staticmethod
    def home_path():
        home_path = expanduser("~")
        logger.debug("home path: %s" % home_path)
        return home_path

    @staticmethod
    def hostname():
        hostname = platform.node()
        logger.debug("hostname: %s" % hostname)
        return hostname

    @staticmethod
    def is_git():
        cmd = 'whereis git'
        if linux_command(cmd) != 0:
            logger.debug("code %s" % linux_command(cmd))
            return False
        else:
            return True

    @staticmethod
    def install_file_list():
        dirs = os.listdir(".")
        install_list = []
        for file in dirs:
            if file in IGNORE_LIST:
                pass
            else:
                install_list.append(file)
        logger.debug(install_list)
        return install_list

def linux_command(cmd):
    hide_output = open(os.devnull, 'w')
    retcode = subprocess.call(cmd, shell=True, stdout=hide_output, stderr=subprocess.STDOUT)
    logger.debug("%s execute get %s" % (cmd, retcode))
    return retcode

def install_rc(env, filename):
    logger.info("=> Install %s" % filename)
    src_path = env.pwd() + "/" + filename
    dst_path = env.home_path() + "/" + filename
    logger.debug("%s path: %s" % (filename, src_path))

    '''
    Check file is symbolic link?
    '''
    if os.path.islink(dst_path):
        logger.info("==> %s is exists\n" % filename)
        pass
    elif os.path.isfile(dst_path):
        logger.debug("==> %s backup from %s to %s\n" % (filename, src_path, dst_path))
        file_backup = dst_path + ".backup"
        os.rename(dst_path, file_backup)
        os.symlink(src_path, dst_path)
        logger.info("==> %s install from %s to %s\n" % (filename, src_path, dst_path))
    else:
        os.symlink(src_path, dst_path)
        logger.info("==> %s install from %s to %s\n" % (filename, src_path, dst_path))

def git_branch(env):
    #XXX: exists branch problem
    new_branch_name = env.hostname()
    if env.is_git():
        cmd = "git checkout -b " + new_branch_name
        retcode = linux_command(cmd)
        if retcode != 0:
            logger.debug("Can't checkout to %s" % new_branch_name)
        else:
            logger.info("==> Checkout to %s" % new_branch_name)
    else:
        logger.info("You need install git first.")
        sys.exit()

def main():
    logger.info("=== Start install MoMorc ===\n")
    env = Environment()
    git_branch(env)
    for install_file in env.install_file_list():
        install_rc(env, filename=install_file)
    logger.info("=== Finish install MoMorc ===")

if __name__ == '__main__':
    if len(sys.argv) > 1:
        level_name = sys.argv[1]
        level = LEVELS.get(level_name, logging.INFO)
        logger.setLevel(level)
    else:
        logger.setLevel(logging.INFO)
    main()
