import subprocess as sp
import os
import difflib
import string

from pkg_resources import ensure_directory


test_cases = {}
test = "t"
result = "r"


if __name__ == "__main__":
	for subdir, dirs, folder in os.walk("testcases"):
		for dir in dirs:
			path = os.path.join(subdir, dir)
			for filename in os.listdir(path):
				f = os.path.join(path, filename)
				if(os.path.isfile(f)):
					test_name = os.path.basename(f)
					test_name = test_name.split(".",1)[0]
					if(test_name not in test_cases):
						test_cases[test_name] = {}
					if(f.endswith(".bin")):
						test_cases[test_name][test] = f
					elif(f.endswith(".expected")):
						test_cases[test_name][result] = f
	for t in test_cases.keys():
		pass
	pass