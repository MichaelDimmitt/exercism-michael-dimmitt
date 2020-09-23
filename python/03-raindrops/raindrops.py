rain_noises = {
  3: "Pling",
  5: "Plang",
  7: "Plong"
}

## simple version: (for loop)
def convert(number: int): # 27
  if not isinstance(number, int): 
    raise Exception("Error, input must be an integer!"); 

  rain_string = ""
  for key in rain_noises.keys():
    if ( number % key == 0 ):
      rain_string += rain_noises[key] 
  
  return rain_string if len(rain_string) != 0 else f"{number}"

## complex version: (list comprehension)

# # removed check_rain_noise_for_element for a simplicity improvement.
# # def check_rain_noise_for_element(number, key):
# #  return (rain_noises[key] if ( number % key == 0 )

# def gather_rain_noises(number):
#   return [ (rain_noises[key] if ( number % key == 0 ) else '') for key in rain_noises.keys()]

# def convert(number): # 27
#   if not isinstance(number, int): 
#     raise Exception("Error, input must be an integer!"); 
#   # additional acceptions that can be thrown:
#   # fail all negative numbers
#   # sys.maxint fail any number larger than the biggest int.
#   list_of_noises = ''.join(gather_rain_noises(number))
#   return list_of_noises if len(list_of_noises) != 0 else f"{number}"
