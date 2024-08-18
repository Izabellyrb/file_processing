class FileProcessesController < ApplicationController
  def index; end

  def import_file
    @file_process = FileProcess.new(file_name: params[:xml_file].original_filename)

    flash[:notice] = 'Arquivo enviado com sucesso!' if @file_process.save
    redirect_to root_path
    # xml_content = File.read(@xml_file)
    # docfile = Nokogiri::XML(xml_content)
  end

  private

  def report
    @xml_file = FileProcess.all
  end
end
