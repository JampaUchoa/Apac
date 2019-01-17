# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Collection.delete_all
Equipment.delete_all
Station.delete_all
Microregion.delete_all
Macroregion.delete_all
State.delete_all

pernambuco = State.create(name: 'Pernambuco')
macroregions = ["Sertão", "São Francisco", "Agreste", "Zona da Mata", "Metropolitana"]

microregions = [
                ["Araripina", "Salgueiro", "Pajeú", "Sertão do Moxotó"], 
                ["Petrolina", "Itaparica"],
                ["Vale do Ipanema", "Vale do Ipojuca", "Alto Capibaribe", "Médio Capibaribe", "Garanhuns", "Brejo Pernambucano"],
                ["Mata Setentrional Pernambucana", "Vitória de Santo Antão", "Mata Meridional Pernambucana"],
                ["Itamaricá", "Recife", "Suape", "Fernando de Noronha"]            
            ]  

macroregions.each_with_index do |m, i|
    mac = Macroregion.create(name: m, state: pernambuco)
    microregions[i].each do |mi|
        mic = Microregion.create(name: mi, macroregion: mac) 
        3.times do |st|
            Station.create(name: "#{mi} - #{st+1}", microregion: mic)
        end
    end
end

Equipment.create([{ name: 'Régua' }, { name: 'Pluviômetro' }]) 

