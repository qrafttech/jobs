
#import la librairie json
require 'json'
#import de la librairie date
require 'date'

#File.join permet de créer un chemin d'accès au fichier input.json
#File.dirname(__FILE__) permet de récupérer le chemin d'accès au fichier main.rb
#puis on ajoute le chemin d'accès au fichier input.json
file_path = File.join(File.dirname(__FILE__), 'data', 'input.json')
#File.read permet de lire le fichier input.json et stocke dans une variable "file"
file = File.read(file_path)
#JSON.parse permet de convertir le fichier input.json en un hash qu'on stocke dans une variable "data"
#on peut lire le fichier input.json comme un hash car les données sont rentrées sous forme de clé/valeur dans le fichier input.json et expected_output.json
data = JSON.parse(file)

#on parcourt les hash data et on récupère les données de chaque location
#on itère sur le hash data['rentals'] qui contient les données de chaque location
#on récupère les données de chaque location dans une variable "rental"
#on récupère les données de chaque voiture dans une variable "car" en recherchant dans le tableau data['cars'] la voiture qui a le même id que la location
#on calcule le nombre de jours de location en convertissant les dates de début et de fin de location en integer et en faisant la différence entre les deux dates
#on calcule le prix de la distance en multipliant la distance parcourue de la location en cour par le prix au km de la voiture
#on calcule le prix du temps en multipliant le nombre de jours de location par le prix par jour de la voiture
#on calcule le prix de la location en additionnant le prix de la distance et le prix du temps
data['rentals'].each do |rental|
  car = data['cars'].find { |c| c['id'] == rental['car_id'] }
  rental_days = (Date.parse(rental['end_date']) - Date.parse(rental['start_date'])).to_i + 1
  distance_price = rental['distance'] * car['price_per_km']
  time_price = rental_days * car['price_per_day']
  rental_price = distance_price + time_price

  #on affiche le prix de la location en effectuant une interpolation de la variable rental_price avec l'id de la location
  puts "ID de location : #{rental['id']}, Prix de location : #{rental_price}"
end
