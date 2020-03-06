import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
        for i in line.split("\n"):
            val = i.split("   ")
            if len(val) == 3:
                sys.stdout.write("{}\t{}\t{}\n".format(val[0], val[1], val[2
