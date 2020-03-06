import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__ == "__main__":
    
    for line in sys.stdin:

        amount = line.split(',')
        sys.stdout.write("{}\t{}\n".format(amount[3],amount[4]))
