module Api
  class GamesController < ApplicationController
    def index
      games = Game.order('id');
      render json: {status: 'SUCCESS', message: 'Loaded games',
        data: games}, status: :ok
    end

    def show
      game = Game.find(params[:id])
      render json: {status: 'SUCCESS', message: 'Loaded game',
        data: game}, status: :ok
    end

    def create
      game = Game.new(game_params)

      if game.save
       render json: {status: 'SUCCESS', message: 'Saved game',
          data: game}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Game not saved',
          data: game}, status: :unprocessable_entity
      end
    end

    def destroy
      game = Game.find(params[:id])
      if game.destroy
        render json: {status: 'SUCCESS', message: 'Destroyed game',
          data: game}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Game not destroyed',
          data: game}, status: :unprocessable_entity
      end
    end

    def update
      game = Game.find(params[:id]);
      if game.update_attributes(game_params)
        render json: {status: 'SUCCESS', message: 'Updated game',
          data: game}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Game not updated',
          data: game}, status: :unprocessable_entity
      end
    end

    private

    def game_params
      params.require([:name, :description])
      params.permit(:name, :description)
    end
  end
end
