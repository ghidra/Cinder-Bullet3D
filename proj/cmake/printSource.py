#https://stackoverflow.com/questions/2212643/python-recursive-folder-read

import os
import sys

#walk_dir = sys.argv[1]
script_path = sys.path[0]

#print(script_path)
project_path = os.path.dirname(os.path.dirname(script_path))
source_path = project_path+"/src/bullet3/src"
shorten_path = project_path+"/src" #this is for the cmake generation

#print('walk_dir = ' + source_path)

list_file_path = os.path.join(script_path, 'my-directory-list.txt')
list_file = open(list_file_path,"w")

# If your current working directory may change during script execution, it's recommended to
# immediately convert program arguments to an absolute path. Then the variable root below will
# be an absolute path as well. Example:
# walk_dir = os.path.abspath(walk_dir)
#print('walk_dir (absolute) = ' + os.path.abspath(source_path))

for root, subdirs, files in os.walk(source_path):
    #print('--\nroot = ' + root)
    #list_file_path = os.path.join(root, 'my-directory-list.txt')
    #print('list_file_path = ' + list_file_path)

    #with open(list_file_path, 'wb') as list_file:
       # for subdir in subdirs:
          #  print('\t- subdirectory ' + subdir)
    #------
    for filename in files:
        file_path = os.path.join(root, filename)
        
        rel_path = os.path.relpath(file_path,shorten_path)
        #relative path (without the ../../../ print(rel_path)
        file_name = os.path.split(rel_path)[1] #file name print()
        extension = file_name.split(".")[-1]
        
        if (extension != 'lua') and (extension != 'txt'):
            #print(extension)

            list_file.write('''${CINDER_BULLET3D_SOURCE_PATH}/'''+rel_path+"\n")
        #print('''${CINDER_BULLET3D_SOURCE_PATH}'''+rel_path)

       # print('\t- file %s (full path: %s)' % (filename, file_path))

        # with open(file_path, 'rb') as f:
        #     f_content = f.read()
        #     list_file.write(('The file %s contains:\n' % filename).encode('utf-8'))
        #     list_file.write(f_content)
        #     list_file.write(b'\n')
list_file.close()