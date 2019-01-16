class CollectionsController < ApplicationController

  def states
    @collections = State.all
    render json: @collections
  end

  def macroregions
    @collections = Macroregion.all
    render json: @collections
  end

  def microregions
    @collections = Microregion.all
    render json: @collections
  end

  def stations
    @collections = Station.all
    render json: @collections
  end

  def equipments
    @collections = Equipment.all
    render json: @collections
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
