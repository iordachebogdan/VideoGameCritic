module Api
  class GamesController < ApplicationController
    def index
      games = Game.order('created_at DESC');
      render json: {status: 'SUCCESS', message: 'Loaded games',
        data: ActiveModel::Serializer::CollectionSerializer.new(games, each_serializer: GameSerializer).as_json},
        status: :ok
    end

    def show
      game = Game.find(params[:id])
      render json: {status: 'SUCCESS', message: 'Loaded game',
        data: GameSerializer.new(game).as_json}, status: :ok
    end

    def create
      game = Game.new(game_params)

      if game.save
       render json: {status: 'SUCCESS', message: 'Saved game',
          data: GameSerializer.new(game).as_json}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Game not saved',
          data: game.errors}, status: :unprocessable_entity
      end
    end

    def destroy
      game = Game.find(params[:id])
      if game.destroy
        render json: {status: 'SUCCESS', message: 'Destroyed game',
          data: GameSerializer.new(game).as_json}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Game not destroyed',
          data: game.errors}, status: :unprocessable_entity
      end
    end

    def update
      game = Game.find(params[:id]);
      if game.update_attributes(game_params)
        render json: {status: 'SUCCESS', message: 'Updated game',
          data: GameSerializer.new(game).as_json}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Game not updated',
          data: game.errors}, status: :unprocessable_entity
      end
    end

    private

    def game_params
      params.permit(:name, :description, :image, :category_id, :platform_id)
    end
  end
end
