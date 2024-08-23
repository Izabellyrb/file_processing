class FileProcessesController < ApplicationController
  before_action :xml_file, :check_file, only: [:import_file]
  before_action :authenticate_user!, only: %i[index show]

  def index
    @file_processes = FileProcess.all
  end

  def import_file
    @file_process = FileProcess.new(file_data: parse_xml)

    if @file_process.save
      flash[:notice] = "Arquivo enviado com sucesso!"
    else
      flash[:alert] = "Arquivo não enviado. Tente novamente mais tarde."
    end

    redirect_to new_file_process_path
  end

  def show
    @file_process = FileProcess.find(params[:id])
  end

  private

  def xml_file
    params[:xml_file]
  end

  def parse_xml
    xml_data = Nokogiri::XML(xml_file.read)
    xml_data.remove_namespaces!
  end

  def check_file
    return if xml_file.present? && xml_file.content_type == "text/xml"

    flash[:alert] = "Por favor, insira um arquivo no formato xml."

    redirect_to new_file_process_path
  end
end
