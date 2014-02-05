class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def map
    locations = Location.all
    @locationMarkers = Gmaps4rails.build_markers(locations) do |location, marker|
      marker.lat location.lat
      marker.lng location.lng
      marker.infowindow '<a href="#" class="open-story" data-stories="' << location.stories.map{ |story| story.id }.join(",") << '">' << location.name << '</a>'
      marker.picture({
       "url" => ActionController::Base.helpers.asset_path("marker-orange.png"),
       "width" =>  30,
       "height" => 30})

    @menuURLs = {
      "person-orange" => ActionController::Base.helpers.asset_path("location/person-orange.png"),
      "person-notext" => ActionController::Base.helpers.asset_path("location/person-notext.png"),
      "person-text" => ActionController::Base.helpers.asset_path("location/person-text.png"),
      "place-orange" => ActionController::Base.helpers.asset_path("location/place-orange.png"),
      "place-notext" => ActionController::Base.helpers.asset_path("location/place-notext.png"),
      "place-text" => ActionController::Base.helpers.asset_path("location/place-text.png"),
      "event-orange" => ActionController::Base.helpers.asset_path("location/event-orange.png"),
      "event-notext" => ActionController::Base.helpers.asset_path("location/event-notext.png"),
      "event-text" => ActionController::Base.helpers.asset_path("location/event-text.png"),
      "other-orange" => ActionController::Base.helpers.asset_path("location/other-orange.png"),
      "other-notext" => ActionController::Base.helpers.asset_path("location/other-notext.png"),
      "other-text" => ActionController::Base.helpers.asset_path("location/other-text.png"),
      "audio-orange" => ActionController::Base.helpers.asset_path("location/audio-orange.png"),
      "audio-notext" => ActionController::Base.helpers.asset_path("location/audio-notext.png"),
      "audio-text" => ActionController::Base.helpers.asset_path("location/audio-text.png"),
      "multimedia-orange" => ActionController::Base.helpers.asset_path("location/multimedia-orange.png"),
      "multimedia-notext" => ActionController::Base.helpers.asset_path("location/multimedia-notext.png"),
      "multimedia-text" => ActionController::Base.helpers.asset_path("location/multimedia-text.png"),
      "visual-orange" => ActionController::Base.helpers.asset_path("location/visual-orange.png"),
      "visual-notext" => ActionController::Base.helpers.asset_path("location/visual-notext.png"),
      "visual-text" => ActionController::Base.helpers.asset_path("location/visual-text.png")
    }.to_json
    
    end
  end

  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render action: 'show', status: :created, location: @location }
      else
        format.html { render action: 'new' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit!
    end
end
