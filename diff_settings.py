#!/usr/bin/env python3

def apply(config, args):
    config['mapfile'] = 'build/mp1.us.map'
    config['myimg'] = 'build/marioparty.u.z64'
    config['baseimg'] = 'baserom.u.z64'
    config['makeflags'] = []
    config['source_directories'] = ['src', 'include', 'spec']
