#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
#Maintainer: Roan Huang <pichuang@cs.nctu.edu.tw>

import logging
import sys
import platform
import os
from os.path import expanduser

logger = logging.getLogger('pichuangrc')
LEVELS = {'debug': logging.DEBUG,
          'info': logging.INFO,
          'warning': logging.WARNING}
ch = logging.StreamHandler()
logger.addHandler(ch)


class enviroment():
    def __init__(self):
        logger.debug("Get enviroment")
    
    def os_system(self):
        system = platform.system()
        logger.debug("OS_VERSION: %s" % system)
        return system

    def os_distribution(self):
        linux = platform.linux_distribution()[0]
        if linux == "":
            logger.debug("OS_Distribution: unknown")
        else:
            logger.debug("OS_Distribution: %s" % linux)
        return linux

    def pwd(self):
        pwd = os.getcwd()
        logger.debug("pwd: %s" % pwd)
        return pwd

    def home_path(self):
        home_path = expanduser("~")
        logger.debug("home path: %s" % home_path)
        return home_path

def install_gitconfig(env):
    logger.info("Install .gitconfig")

    src_gitconfig_path = env.pwd() + "/.gitconfig"
    dst_gitconfig_path = env.home_path() +"/.gitconfig"
    logger.debug(".gitconfig path: %s" % src_gitconfig_path)
    
    '''
    Check .gitconfig is symbolic link?
    '''
    if os.path.exists(dst_gitconfig_path) == True:
        if os.path.islink(dst_gitconfig_path) == True:
            logger.debug(".gitconfig is exists")
            pass
        elif os.path.isfile(dst_gitconfig_path) == True:
            logger.debug(".gitconfig backup")
            gitconfig_backup = dst_gitconfig_path + ".backup"
            os.rename(dst_gitconfig_path, gitconfig_backup)
        else:
            logger.debug(".gitconfig Somthing wrong")
    else:
        os.symlink(src_gitconfig_path, dst_gitconfig_path)
        logger.info(".gitconfig install from %s to %s" % (src_gitconfig_path, dst_gitconfig_path))

    

def main():
    logger.info("Start install pichuangrc")
    env = enviroment()
    install_gitconfig(env)
    logger.info("Finish install pichuangrc")

if __name__ == '__main__':
    if len(sys.argv) > 1:
        level_name = sys.argv[1]
        level = LEVELS.get(level_name, logging.INFO)
        logger.setLevel(level)
    else:
        logger.setLevel(logging.INFO)
    main()
