

# simplest version
def convert(number: int): # 27
  if not isinstance(number, int): 
    raise Exception("Error, input must be an integer!"); 
    
  rain_string = ""
  rain_string += "Pling" if (number % 3 == 0) else ""
  rain_string += "Plang" if (number % 5 == 0) else ""
  rain_string += "Plong" if (number % 7 == 0) else ""

  return rain_string if rain_string else str(number)

## simple version: (for loop)
# rain_noises = {
#   3: "Pling",
#   5: "Plang",
#   7: "Plong"
# }
# def convert(number: int): # 27
#   if not isinstance(number, int): 
#     raise Exception("Error, input must be an integer!"); 

#   rain_string = ""
#   for key in rain_noises.keys():
#     if (number % key == 0):
#       rain_string += rain_noises[key] 
  
#   return rain_string if rain_string else f"{number}"

## complex version: (list comprehension)
# rain_noises = {
#   3: "Pling",
#   5: "Plang",
#   7: "Plong"
# }
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
#   return list_of_noises if list_of_noises else f"{number}"
