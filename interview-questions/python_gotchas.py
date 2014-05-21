import time
import os

def check_files(env="dev", files_to_check=['foo','bar']):
    """Check for the string 'launch' in a couple files. if it exists
    there, end execution. if not, sleep a bit and keep checking. Don't
    die if any of the files do not exist.

    """
    if env == "prod":
        if 'foo' in files_to_check:
            files_to_check.remove('foo')
        files_to_check.append('baz')

    for f in files_to_check:
        print "checking {filename}".format(filename=f)
        try:
            fh = open(os.path.join('opt', 'data', f))
            result = fh.read()
            if "launch" in result:
                return True
        except:
            pass
    else:
        return False

if __name__ == "__main__":
    while True:
        try:
            time.sleep(1)
            if check_files("prod"):
                break
        except:
            pass
