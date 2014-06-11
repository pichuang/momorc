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

def install_rc(env, filename):
    logger.info("Install %s" % filename)
    src_path = env.pwd() + "/" + filename
    dst_path = env.home_path() + "/" + filename
    logger.debug("%s path: %s" % (filename, src_path))

    '''
    Check file is symbolic link?
    '''
    if os.path.exists(dst_path) == True:
        if os.path.islink(dst_path) == True:
            logger.info("%s is exists" % filename)
            pass
        elif os.path.isfile(dst_path) == True:
            logger.debug("%s backup" % filename)
            file_backup = dst_path + ".backup"
            os.rename(dst_path, file_backup)
        else:
            logger.debug("%s somthing wrong" % filename)
    else:
        os.symlink(src_path, dst_path)
        logger.info("%s install from %s to %s" % (filename, src_path, dst_path))

def main():
    logger.info("Start install pichuangrc")
    env = enviroment()
    install_rc(env, filename=".gitconfig")
    #install_rc(env, filename=".vimrc")
    logger.info("Finish install pichuangrc")

if __name__ == '__main__':
    if len(sys.argv) > 1:
        level_name = sys.argv[1]
        level = LEVELS.get(level_name, logging.INFO)
        logger.setLevel(level)
    else:
        logger.setLevel(logging.INFO)
    main()
