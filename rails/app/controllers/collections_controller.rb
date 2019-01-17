class CollectionsController < ApplicationController

  def states
    @collections = 
    render json: State.all
  end

  def macroregions
    render json: Macroregion.all
  end

  def microregions
    render json: Microregion.all
  end

  def stations
    render json: Station.all
  end

  def equipments
    render json: Equipment.all
  end

  def collections
    render json: Collection.all
  end
  
  def create
    ids = params[:stationsIds]
    collections = []
    ids.each do |id|
      c = Collection.create!(equipment_id: params[:equipment], station_id: id, day: params[:day], equipment_id: params[:equipment], value: params[:value])
      collections.push(c)
    end
    render json: collections
  end

end
