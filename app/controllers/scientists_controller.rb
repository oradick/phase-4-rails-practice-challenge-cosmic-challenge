class ScientistsController < ApplicationController
wrap_parameters format:[]

    def index
        scientists = Scientist.all
        render json: scientists
    end

    def show
        # debugger
        scientist = Scientist.find_by(id: params[:id])
        if scientist
            render json:scientist, serializer: ScientistWithPlanetsSerializer, status: :ok
        else
            render json: {error: "Scientist not found"}, status: :not_found
        end
    end
end
