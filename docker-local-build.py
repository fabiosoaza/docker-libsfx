#!/usr/bin/python3


from optparse import OptionParser
import os

from configparser import SafeConfigParser


def get_build_property(key):
    config = SafeConfigParser()
    config.read('build.properties')
    return config.get('build', key)

def get_docker_image_name():
   return get_build_property('image.name')

def menu():
    parser = OptionParser()
    parser.add_option("-b", "--build", 
                      help="build local image", action="store_true")
    parser.add_option("-i", "--run-it",
                     help="run interactive", action="store_true")                     
                   
    
    (options, args) = parser.parse_args()

    for option in vars(options):
        value =  getattr(options, option)
        if option == 'build' and value == True:
            build_image()   
        elif option == 'run_it' and value == True:  
            run_image()            

def build_image():
    os.system("docker build . -f Dockerfile -t fabiosoaza/%s:latest" %(get_docker_image_name()))    

def run_image():
    os.system('docker run -it fabiosoaza/%s:latest bash' %(get_docker_image_name()))    


menu()


