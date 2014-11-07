import sys
import pkg_resources
for module in pkg_resources.working_set:
    if sys.argv[1] in module.location:
        print module.project_name
