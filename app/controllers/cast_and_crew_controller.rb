class CastAndCrewController < ApplicationController

        before_action :set_cast, only: [:show, :update, :destroy]
        before_action :authenticate_request, only: [:create, :update, :destroy]
    
        def create
            cast = CastAndCrew.new(person_params)
        
            if cast.save
                render json: cast, status: :created
            else
                render json:  cast.errors, status: :unprocessable_entity
          end
            end
      
      def update 
        if @cast.update(cast_params)
          render json: @cast, status: :ok 
        else 
          render json: @cast.errors, status: :unprocessable_entity
        end
      end
    
    
    def destroy
        
      if @cast.destroy
        head :no_content
      else 
        render json: @cast.errors, status: :ok
      end
    
    end
    
      private
    
      def set_cast
        @cast = CastAndCrew.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        render json: { error: 'Cast not found' }, status: :not_found
      end
    
    
    def cast_params
      params.permit(:role, :character)
    end
    
    end
    