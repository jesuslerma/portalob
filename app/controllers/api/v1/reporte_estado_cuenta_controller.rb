module Api
  module V1
    class ReporteEstadoCuentaController < ApplicationController
      
      #respond_to :json

      def index
        @user = current_usuario
        #order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "POB_VistaEstadoCuenta?_where=taxid=%27" + @user.rfc + "%27&_sortBy=fecha"
        #order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/org.openbravo.service.json.jsonrest/POB_VistaEstadoCuenta?_where=taxid=%27" + @user.rfc + "%27&_sortBy=fecha"
        order_link = "http://" + @user.empresa.usuariosob + ":" + @user.empresa.passob + "@" + @user.empresa.urlwebservice + "/openbravo/org.openbravo.service.json.jsonrest/POB_VistaEstadoCuenta?_where=bpartner=%27" + @user.partner_id + "%27&_sortBy=fecha"
        puts order_link
        response = RestClient.get order_link 
      	respond_to do |format|
      		format.json {render json: response}
       	end
      end

      def show
        respond_with ReporteEstadoCuenta.find(params[:id])
      end

      def create
        respond_with ReporteEstadoCuenta.create(params[:product])
      end

      def update
        respond_with ReporteEstadoCuenta.update(params[:id], params[:product])
      end

      def destroy
        respond_with ReporteEstadoCuenta.destroy(params[:id])
      end
    end
  end
end