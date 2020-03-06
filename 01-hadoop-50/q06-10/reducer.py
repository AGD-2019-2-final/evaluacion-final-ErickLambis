import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    maximo_valor = None
    minimo_valor = None

    for line in sys.stdin:
        key, val = line.split("\t")
        val = float(val)
        
        if maximo_valor is None:
          maximo_valor = val
        if minimo_valor is None:
          minimo_valor = val

        if key == curkey:
              maximo_valor = max(maximo_valor,val)
              minimo_valor = min(minimo_valor,val)
        else:
            if curkey is not None:
                sys.stdout.write("{}\t{}\t{}\n".format(curkey, maximo_valor,minimo_valor))

            curkey = key
            maximo_valor = val
            minimo_valor = val
    sys.stdout.write("{}\t{}\t{}\n".format(curkey, maximo_valor,minimo_valor))
