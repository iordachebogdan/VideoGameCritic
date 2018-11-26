module Api
  class ConsolesController < ApplicationController
    def index
      consoles = Console.order('id');
      render json: {status: 'SUCCESS', message: 'Loaded consoles',
        data: consoles}, status: :ok
    end

    def show
      console = Console.find(params[:id])
      render json: {status: 'SUCCESS', message: 'Loaded console',
        data: console}, status: :ok
    end

    def create
      console = Console.new(console_params)

      if console.save
       render json: {status: 'SUCCESS', message: 'Saved console',
          data: console}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Console not saved',
          data: console}, status: :unprocessable_entity
      end
    end

    def destroy
      console = Console.find(params[:id])
      if console.destroy
        render json: {status: 'SUCCESS', message: 'Destroyed console',
          data: console}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Console not destroyed',
          data: console}, status: :unprocessable_entity
      end
    end

    def update
      console = Console.find(params[:id]);
      if console.update_attributes(console_params)
        render json: {status: 'SUCCESS', message: 'Updated console',
          data: console}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Console not updated',
          data: console}, status: :unprocessable_entity
      end
    end

    private

    def console_params
      params.require([:name, :description])
      params.permit(:name, :description)
    end
  end
end
