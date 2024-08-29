class FileProcessesController < ApplicationController
  before_action :xml_file, :check_file, only: [:import_file]
  before_action :authenticate_user!, only: %i[new index show]

  def index
    @invoices = Invoice.order(created_at: :desc)
  end

  def new; end

  def import_file
    @import_file = BaseService.new(parse_xml)

    if @import_file.run
      flash[:notice] = "Arquivo enviado com sucesso!"
    else
      flash[:alert] = "Arquivo não enviado. Tente novamente mais tarde."
    end

    redirect_to new_file_process_path
  end

  def show
    @invoice = Invoice.find(params[:id])
    @products = @invoice.products
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
