module Api
  module V1
    class PosproductosController < ApplicationController
      
      #respond_to :json

      def index
        @user = current_usuario
        order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/org.openbravo.service.json.jsonrest/pob_catalogoproductos?_where=upc=%27" + params[:upc] + "%27"
        puts order_link
    	  response = RestClient.get order_link 
      	respond_to do |format|
      		format.json {render json: response}
    	   end
      end

      def show
        respond_with Posproducto.find(params[:id])
      end

      def create
        respond_with Posproducto.create(params[:product])
      end

      def update
        respond_with Posproducto.update(params[:id], params[:product])
      end

      def destroy
        respond_with Posproducto.destroy(params[:id])
      end
    end
  end
end