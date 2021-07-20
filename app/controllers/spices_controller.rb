class SpicesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
    spices = Spice.all
    render json: spices
    end

    def show
        spice = findSpice
        render json: spice
    end

    def create
        spice = Spice.new(spiceParams)
        if spice.save
            render json: spice, status: :created
        else
            render json: spice.errors, status: :unprocessable_entity
        end
    end

    def update
        spice = findSpice
        spice.update(spiceParams)
        render json: spice
    end

    def destroy
        spice = findSpice
        spice.destroy
        head :no_content
    end
    
    
    
    private

    def findSpice
        Spice.find_by(id: params[:id])
    end

    def spiceParams
        params.permit(:title, :name, :image, :description, :notes, :rating)
    end
    def render_not_found_response
        render json: { error: "Bird not found" }, status: :not_found
      end
end
