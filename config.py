import configparser
from os import path, sep

directory = path.dirname(path.realpath(__file__)) + sep

config = None


def get(section, key):

    global config
    if config is None:
        load()

    if config.get(section) is None:
        return None
    else:
        return config[section].get(key)


def set(section, key, value):

    global config
    if config is None:
        load()

    if config.get(section) is None:
        config[section] = {}

    config[section][key] = value


def load():

    parser = configparser.ConfigParser()
    parser.read(directory + 'config.ini')

    global config
    config = {}

    for section in parser.sections():

        section_config = {}

        for key in parser._sections[section]:
            value = eval(parser._sections[section][key])
            section_config[key] = value

        config[section] = section_config
