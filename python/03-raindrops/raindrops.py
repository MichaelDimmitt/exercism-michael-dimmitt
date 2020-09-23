
def getPrime(number, mod):
  #  print( number, mod, number % mod == 0 )
  return ( number % mod == 0 )

def checkRainNoiseForElement(number, prime):
  if getPrime(number, prime): return rainNoises[prime]
  else: return ''

# type: input int => [string, string]
def gatherPrimes(number):
  return [checkRainNoiseForElement(number, prime) for prime in [3, 5, 7]]

rainNoises = {
  3: "Pling",
  5: "Plang",
  7: "Plong"
}

def convert(number): # 27
  if not isinstance(number, int): raise Exception("Error, input must be an integer!"); 

  # additional acceptions that can be thrown:
  # fail all negative numbers
  # sys.maxint fail any number larger than the biggest int.

  listOfNoises = ''.join(gatherPrimes(number))
  
  if len(listOfNoises) == 0: return f"{number}"
  else: return listOfNoises
