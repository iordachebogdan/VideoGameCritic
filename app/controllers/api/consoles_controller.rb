module Api
  class ConsolesController < ApplicationController
    def index
      consoles = Console.order('created_at DESC');
      render json: {status: 'SUCCESS', message: 'Loaded consoles',
        data: ActiveModel::Serializer::CollectionSerializer.new(consoles, each_serializer: ConsoleSerializer).as_json},
        status: :ok
    end

    def show
      console = Console.find(params[:id])
      render json: {status: 'SUCCESS', message: 'Loaded console',
        data: ConsoleSerializer.new(console).as_json},
        status: :ok
    end

    def create
      console = Console.new(console_params)

      if console.save
       render json: {status: 'SUCCESS', message: 'Saved console',
          data: ConsoleSerializer.new(console).as_json},
          status: :ok
      else
        render json: {status: 'ERROR', message: 'Console not saved',
          data: console.errors},
          status: :unprocessable_entity
      end
    end

    def destroy
      console = Console.find(params[:id])
      if console.destroy
        render json: {status: 'SUCCESS', message: 'Destroyed console',
          data: ConsoleSerializer.new(console).as_json}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Console not destroyed',
          data: console.errors}, status: :unprocessable_entity
      end
    end

    def update
      console = Console.find(params[:id]);
      if console.update_attributes(console_params)
        render json: {status: 'SUCCESS', message: 'Updated console',
          data: ConsoleSerializer.new(console)}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Console not updated',
          data: console.errors}, status: :unprocessable_entity
      end
    end

    private

    def console_params
      params.permit(:name, :description, :image, :platform_id)
    end
  end
end
