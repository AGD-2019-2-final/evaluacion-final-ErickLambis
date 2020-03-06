import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for i in sys.stdin:
      key = i.split('   ')[0]
      valcol1 = i.split('   ')[1]
      valcol2 = i.split('   ')[2].strip()
      sys.stdout.write("{}\t{}\t{}\n".format(key,valcol1,valcol2))
