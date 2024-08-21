class FileProcessesController < ApplicationController
  before_action :check_file, only: [:import_file]
  before_action :authenticate_user!, only: %i[index show]

  def index
    @file_processes = FileProcess.all
  end

  def import_file
    if @valid_file
      @file_process = FileProcess.new(file_data: parse_xml)

      if @file_process.save
        flash[:notice] = "Arquivo enviado com sucesso!"
      else
        flash[:alert] = "Arquivo não enviado."
      end
    else
      flash[:alert] = "Por favor, insira um arquivo no formato xml"
    end

    redirect_to root_path
  end

  def show
    @file_process = FileProcess.find(params[:id])
  end

  private

  def parse_xml
    xml_data = Nokogiri::XML(params[:xml_file].read)
    xml_data.remove_namespaces!
  end

  def check_file # revalidar
    @xml_file = params[:xml_file]
    @valid_file = @xml_file.present? && @xml_file.content_type == "text/xml"
  end
end
