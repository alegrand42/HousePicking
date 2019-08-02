class Api::V1::HousesController < Api::V1::ApiController

  def create
    response = Houses.gather_data > 0 ? {message: 'Houses created'} : {message: 'Request fail'} 
    render json: response.to_json
  end

  def index
      render json: Houses.get_all_houses_data.to_json
  end

  def show
    render json: Houses.get_house_data(params).to_json
  end

  private

    def house_params
        params.require(:house).permit(:name, :disponibility, :size, :room, :agency, :url)
    end
end
